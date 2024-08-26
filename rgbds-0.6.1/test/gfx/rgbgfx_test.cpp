/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2022, Eldred Habert and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

// For `execProg` (Windows is its special little snowflake again)
#if !defined(_MSC_VER) && !defined(__MINGW32__)
	#include <sys/stat.h>
	#include <sys/wait.h>

	#include <spawn.h>
	#include <unistd.h>
#else
	#define WIN32_LEAN_AND_MEAN // Include less from `windows.h` to avoid conflicts
	#include <windows.h>
	#include <errhandlingapi.h>
	#include <processthreadsapi.h>
	#undef max // This macro conflicts with `std::numeric_limits<...>::max()`
#endif

#include <algorithm>
#include <array>
#include <cassert>
#include <cinttypes>
#include <fcntl.h>
#include <fstream>
#include <limits>
#include <memory>
#include <png.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>
#include <string>
#include <vector>

#include "defaultinitalloc.hpp"

#include "gfx/rgba.hpp" // Reused from RGBGFX

static uintmax_t nbErrors;

static void warning(char const *fmt, ...) {
	va_list ap;

	fputs("warning: ", stderr);
	va_start(ap, fmt);
	vfprintf(stderr, fmt, ap);
	va_end(ap);
	putc('\n', stderr);
}

static void error(char const *fmt, ...) {
	va_list ap;

	fputs("error: ", stderr);
	va_start(ap, fmt);
	vfprintf(stderr, fmt, ap);
	va_end(ap);
	putc('\n', stderr);

	if (nbErrors != std::numeric_limits<decltype(nbErrors)>::max()) {
		nbErrors++;
	}
}

[[noreturn]] static void fatal(char const *fmt, ...) {
	va_list ap;

	fputs("FATAL: ", stderr);
	va_start(ap, fmt);
	vfprintf(stderr, fmt, ap);
	va_end(ap);
	putc('\n', stderr);

	if (nbErrors != std::numeric_limits<decltype(nbErrors)>::max()) {
		nbErrors++;
	}

	fprintf(stderr, "Test aborted after %ju error%s\n", nbErrors, nbErrors == 1 ? "" : "s");
	exit(1);
}

// Copy-pasted from RGBGFX
class Png {
	std::string const &path;
	std::filebuf file{};
	png_structp png = nullptr;
	png_infop info = nullptr;

	// These are cached for speed
	uint32_t width, height;
	DefaultInitVec<Rgba> pixels;
	int colorType;
	int nbColors;
	png_colorp embeddedPal = nullptr;
	png_bytep transparencyPal = nullptr;

	[[noreturn]] static void handleError(png_structp png, char const *msg) {
		Png *self = reinterpret_cast<Png *>(png_get_error_ptr(png));

		fatal("Error reading input image (\"%s\"): %s", self->path.c_str(), msg);
	}

	static void handleWarning(png_structp png, char const *msg) {
		Png *self = reinterpret_cast<Png *>(png_get_error_ptr(png));

		warning("In input image (\"%s\"): %s", self->path.c_str(), msg);
	}

	static void readData(png_structp png, png_bytep data, size_t length) {
		Png *self = reinterpret_cast<Png *>(png_get_io_ptr(png));
		std::streamsize expectedLen = length;
		std::streamsize nbBytesRead = self->file.sgetn(reinterpret_cast<char *>(data), expectedLen);

		if (nbBytesRead != expectedLen) {
			fatal("Error reading input image (\"%s\"): file too short (expected at least %zd more "
			      "bytes after reading %lld)",
			      self->path.c_str(), length - nbBytesRead,
			      self->file.pubseekoff(0, std::ios_base::cur));
		}
	}

public:
	uint32_t getWidth() const { return width; }

	uint32_t getHeight() const { return height; }

	Rgba &pixel(uint32_t x, uint32_t y) { return pixels[y * width + x]; }

	Rgba const &pixel(uint32_t x, uint32_t y) const { return pixels[y * width + x]; }

	/*
	 * Reads a PNG and notes all of its colors
	 *
	 * This code is more complicated than strictly necessary, but that's because of the API
	 * being used: the "high-level" interface doesn't provide all the transformations we need,
	 * so we use the "lower-level" one instead.
	 * We also use that occasion to only read the PNG one line at a time, since we store all of
	 * the pixel data in `pixels`, which saves on memory allocations.
	 */
	explicit Png(std::string const &filePath) : path(filePath) {
		if (file.open(path, std::ios_base::in | std::ios_base::binary) == nullptr) {
			fatal("Failed to open input image (\"%s\"): %s", path.c_str(), strerror(errno));
		}

		std::array<unsigned char, 8> pngHeader;

		if (file.sgetn(reinterpret_cast<char *>(pngHeader.data()), pngHeader.size())
		        != static_cast<std::streamsize>(pngHeader.size()) // Not enough bytes?
		    || png_sig_cmp(pngHeader.data(), 0, pngHeader.size()) != 0) {
			fatal("Input file (\"%s\") is not a PNG image!", path.c_str());
		}

		png = png_create_read_struct(PNG_LIBPNG_VER_STRING, (png_voidp)this, handleError,
		                             handleWarning);
		if (!png) {
			fatal("Failed to allocate PNG structure: %s", strerror(errno));
		}

		info = png_create_info_struct(png);
		if (!info) {
			png_destroy_read_struct(&png, nullptr, nullptr);
			fatal("Failed to allocate PNG info structure: %s", strerror(errno));
		}

		png_set_read_fn(png, this, readData);
		png_set_sig_bytes(png, pngHeader.size());

		// TODO: png_set_crc_action(png, PNG_CRC_ERROR_QUIT, PNG_CRC_WARN_DISCARD);

		// Skipping chunks we don't use should improve performance
		// TODO: png_set_keep_unknown_chunks(png, ...);

		// Process all chunks up to but not including the image data
		png_read_info(png, info);

		int bitDepth, interlaceType; //, compressionType, filterMethod;

		png_get_IHDR(png, info, &width, &height, &bitDepth, &colorType, &interlaceType, nullptr,
		             nullptr);

		if (width % 8 != 0) {
			fatal("Image width (%" PRIu32 " pixels) is not a multiple of 8!", width);
		}
		if (height % 8 != 0) {
			fatal("Image height (%" PRIu32 " pixels) is not a multiple of 8!", height);
		}

		pixels.resize(static_cast<size_t>(width) * static_cast<size_t>(height));

		if (png_get_PLTE(png, info, &embeddedPal, &nbColors) != 0) {
			int nbTransparentEntries;
			if (png_get_tRNS(png, info, &transparencyPal, &nbTransparentEntries, nullptr)) {
				assert(nbTransparentEntries == nbColors);
			}
		}

		// Set up transformations; to turn everything into RGBA888
		// TODO: it's not necessary to uniformize the pixel data (in theory), and not doing
		// so *might* improve performance, and should reduce memory usage.

		// Convert grayscale to RGB
		switch (colorType & ~PNG_COLOR_MASK_ALPHA) {
		case PNG_COLOR_TYPE_GRAY:
			png_set_gray_to_rgb(png); // This also converts tRNS to alpha
			break;
		case PNG_COLOR_TYPE_PALETTE:
			png_set_palette_to_rgb(png);
			break;
		}

		if (png_get_valid(png, info, PNG_INFO_tRNS)) {
			// If we read a tRNS chunk, convert it to alpha
			png_set_tRNS_to_alpha(png);
		} else if (!(colorType & PNG_COLOR_MASK_ALPHA)) {
			// Otherwise, if we lack an alpha channel, default to full opacity
			png_set_add_alpha(png, 0xFFFF, PNG_FILLER_AFTER);
		}

		// Scale 16bpp back to 8 (we don't need all of that precision anyway)
		if (bitDepth == 16) {
			png_set_scale_16(png);
		} else if (bitDepth < 8) {
			png_set_packing(png);
		}

		// Do NOT call `png_set_interlace_handling`. We want to expand the rows ourselves.

		// Update `info` with the transformations
		png_read_update_info(png, info);
		// These shouldn't have changed
		assert(png_get_image_width(png, info) == width);
		assert(png_get_image_height(png, info) == height);
		// These should have changed, however
		assert(png_get_color_type(png, info) == PNG_COLOR_TYPE_RGBA);
		assert(png_get_bit_depth(png, info) == 8);

		// Now that metadata has been read, we can process the image data

		size_t nbRowBytes = png_get_rowbytes(png, info);
		assert(nbRowBytes != 0);
		DefaultInitVec<png_byte> row(nbRowBytes);

		if (interlaceType == PNG_INTERLACE_NONE) {
			for (png_uint_32 y = 0; y < height; ++y) {
				png_read_row(png, row.data(), nullptr);

				for (png_uint_32 x = 0; x < width; ++x) {
					Rgba rgba(row[x * 4], row[x * 4 + 1], row[x * 4 + 2], row[x * 4 + 3]);
					pixel(x, y) = rgba;
				}
			}
		} else {
			assert(interlaceType == PNG_INTERLACE_ADAM7);

			// For interlace to work properly, we must read the image `nbPasses` times
			for (int pass = 0; pass < PNG_INTERLACE_ADAM7_PASSES; ++pass) {
				// The interlacing pass must be skipped if its width or height is reported as zero
				if (PNG_PASS_COLS(width, pass) == 0 || PNG_PASS_ROWS(height, pass) == 0) {
					continue;
				}

				png_uint_32 xStep = 1u << PNG_PASS_COL_SHIFT(pass);
				png_uint_32 yStep = 1u << PNG_PASS_ROW_SHIFT(pass);

				for (png_uint_32 y = PNG_PASS_START_ROW(pass); y < height; y += yStep) {
					png_bytep ptr = row.data();
					png_read_row(png, ptr, nullptr);

					for (png_uint_32 x = PNG_PASS_START_COL(pass); x < width; x += xStep) {
						Rgba rgba(ptr[0], ptr[1], ptr[2], ptr[3]);
						pixel(x, y) = rgba;
						ptr += 4;
					}
				}
			}
		}

		// We don't care about chunks after the image data (comments, etc.)
		png_read_end(png, nullptr);
	}

	~Png() { png_destroy_read_struct(&png, &info, nullptr); }
};

static char *execProg(char const *name, char * const *argv) {
#if !defined(_MSC_VER) && !defined(__MINGW32__)
	pid_t pid;
	int err = posix_spawn(&pid, argv[0], nullptr, nullptr, argv, nullptr);
	if (err != 0) {
		return strerror(err);
	}

	siginfo_t info;
	if (waitid(P_PID, pid, &info, WEXITED) != 0) {
		fatal("Error waiting for %s: %s", name, strerror(errno));
	} else if (info.si_code != CLD_EXITED) {
		assert(info.si_code == CLD_KILLED || info.si_code == CLD_DUMPED);
		fatal("%s was terminated by signal %s%s", name, strsignal(info.si_status),
		      info.si_code == CLD_DUMPED ? " (core dumped)" : "");
	} else if (info.si_status != 0) {
		fatal("%s returned with status %d", name, info.si_status);
	}

#else // defined(_MSC_VER) || defined(__MINGW32__)

	auto winStrerror = [](DWORD errnum) {
		LPTSTR buf;
		if (FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM
		                      | FORMAT_MESSAGE_MAX_WIDTH_MASK,
		                  nullptr, errnum, 0, (LPTSTR)&buf, 0, nullptr)
		    == 0) {
			fatal("Failed to get error message for error 0x%x", errnum);
		}
		return buf;
	};

	char cmdLine[32768]; // Max command line size on Windows
	char *ptr = cmdLine;
	for (size_t i = 0; argv[i]; ++i) {
		char const *src = argv[i];
		// I miss you, `stpcpy`
		while (*src) {
			*ptr++ = *src++;
		}
		*ptr++ = ' ';
	}
	*ptr = '\0';

	STARTUPINFOA startupInfo;
	GetStartupInfoA(&startupInfo);
	STARTUPINFOA childStartupInfo{sizeof(startupInfo),
	                              nullptr,
	                              nullptr,
	                              nullptr,
	                              0,
	                              0,
	                              0,
	                              0,
	                              0,
	                              0,
	                              0,
	                              0,
	                              0,
	                              0,
	                              nullptr,
	                              0,
	                              0,
	                              0};

	PROCESS_INFORMATION child;
	if (CreateProcessA(nullptr, cmdLine, nullptr, nullptr, true, 0, nullptr, nullptr,
	                   &childStartupInfo, &child)
	    == 0) {
		return winStrerror(GetLastError());
	}

	DWORD status;
	do {
		if (GetExitCodeProcess(child.hProcess, &status) == 0) {
			fatal("Error waiting for %s: %ls", name, winStrerror(GetLastError()));
		}
	} while (status == STILL_ACTIVE);
	CloseHandle(child.hProcess);
	CloseHandle(child.hThread);

	if (status != 0) {
		fatal("%s returned with status %ld", name, status);
	}
#endif

	return nullptr;
}

int main(int argc, char **argv) {
	if (argc < 2) {
		fprintf(stderr, "usage: %s <rng file> [rgbgfx flags]\n", argv[0]);
		exit(0);
	}

	{
		char path[] = "./randtilegen", file[] = "out";
		char *args[] = {path, argv[1], file, nullptr};

		if (auto ret = execProg("randtilegen", args); ret != nullptr) {
			fatal("Failed to excute ./randtilegen (%s). Is it in the current working directory?",
			      ret);
		}
	}

	{
		char path[] = "../../rgbgfx", out_opt[] = "-o", out_file[] = "result.2bpp",
		     pal_opt[] = "-p", pal_file[] = "result.pal", attr_opt[] = "-a",
		     attr_file[] = "result.attrmap", in_file[] = "out0.png";
		std::vector<char *> args(
		    {path, out_opt, out_file, pal_opt, pal_file, attr_opt, attr_file, in_file});
		// Also copy the trailing `nullptr`
		std::copy_n(&argv[2], argc - 1, std::back_inserter(args));

		if (auto ret = execProg("rgbgfx conversion", args.data()); ret != nullptr) {
			fatal("Failed to execute ../../rgbgfx (%s). Is it in the parent directory?", ret);
		}
	}

	Png image0{"out0.png"};

	{
		char path[] = "../../rgbgfx", reverse_opt[] = "-r", out_opt[] = "-o",
		     out_file[] = "result.2bpp", pal_opt[] = "-p", pal_file[] = "result.pal",
		     attr_opt[] = "-a", attr_file[] = "result.attrmap", in_file[] = "result.png";
		auto width_string = std::to_string(image0.getWidth() / 8);
		std::vector<char *> args = {
		    path,     reverse_opt, width_string.data(), out_opt, out_file, pal_opt,
		    pal_file, attr_opt,    attr_file,           in_file};
		// Also copy the trailing `nullptr`
		std::copy_n(&argv[2], argc - 1, std::back_inserter(args));

		if (auto ret = execProg("rgbgfx reversal", args.data()); ret != nullptr) {
			fatal("Failed to execute ../../rgbgfx -r (%s)", ret);
		}
	}

	Png image1{"result.png"};

	if (image0.getWidth() != image1.getWidth()) {
		fatal("Image widths do not match!");
	}
	if (image0.getHeight() != image1.getHeight()) {
		fatal("Image heights do not match!");
	}

	for (uint32_t y = 0; y < image0.getHeight(); y++) {
		for (uint32_t x = 0; x < image0.getWidth(); x++) {
			Rgba px0 = image0.pixel(x, y);
			Rgba px1 = image1.pixel(x, y);

			auto cgbColor = [](Rgba const &rgba) {
				auto field = [](uint16_t component, uint8_t shift) {
					return (component & 0x1F) << shift;
				};
				return rgba.isTransparent()
				           ? Rgba::transparent
				           : field(rgba.red, 0) | field(rgba.green, 5) | field(rgba.blue, 10);
			};

			if (cgbColor(px0) != cgbColor(px1)) {
				error("Color mismatch at (%" PRIu32 ", %" PRIu32
				      "): (%u,%u,%u,%u) became (%u,%u,%u,%u) after round-tripping",
				      x, y, px0.red, px0.green, px0.blue, px0.alpha, px1.red, px1.green, px1.blue,
				      px1.alpha);
			}
		}
	}

	if (nbErrors > 0) {
		fprintf(stderr, "Test failed with %ju error%s\n", nbErrors, nbErrors == 1 ? "" : "s");
		exit(1);
	}

	return 0;
}
