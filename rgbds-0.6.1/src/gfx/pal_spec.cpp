/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2022, Eldred Habert and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#include "gfx/pal_spec.hpp"

#include <algorithm>
#include <cassert>
#include <cinttypes>
#include <climits>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <fstream>
#include <limits>
#include <optional>
#include <ostream>
#include <streambuf>
#include <string>
#include <string_view>
#include <tuple>
#include <type_traits>
#include <unordered_map>

#include "platform.h"

#include "gfx/main.hpp"

using namespace std::string_view_literals;

constexpr uint8_t nibble(char c) {
	if (c >= 'a') {
		assert(c <= 'f');
		return c - 'a' + 10;
	} else if (c >= 'A') {
		assert(c <= 'F');
		return c - 'A' + 10;
	} else {
		assert(c >= '0' && c <= '9');
		return c - '0';
	}
}

constexpr uint8_t toHex(char c1, char c2) {
	return nibble(c1) * 16 + nibble(c2);
}

constexpr uint8_t singleToHex(char c) {
	return toHex(c, c);
}

template<typename Str> // Should be std::string or std::string_view
static void skipWhitespace(Str const &str, typename Str::size_type &pos) {
	pos = std::min(str.find_first_not_of(" \t"sv, pos), str.length());
}

void parseInlinePalSpec(char const * const rawArg) {
	// List of #rrggbb/#rgb colors, comma-separated, palettes are separated by colons

	std::string_view arg(rawArg);
	using size_type = decltype(arg)::size_type;

	auto parseError = [&rawArg, &arg](size_type ofs, size_type len, char const *fmt,
	                                  auto &&...args) {
		(void)arg; // With NDEBUG, `arg` is otherwise not used
		assert(ofs <= arg.length());
		assert(len <= arg.length());

		error(fmt, args...);
		fprintf(stderr,
		        "In inline palette spec: %s\n"
		        "                        ",
		        rawArg);
		for (auto i = ofs; i; --i) {
			putc(' ', stderr);
		}
		for (auto i = len; i; --i) {
			putc('^', stderr);
		}
		putc('\n', stderr);
	};

	options.palSpec.clear();
	options.palSpec.emplace_back(); // Value-initialized, not default-init'd, so we get zeros

	size_type n = 0; // Index into the argument
	// TODO: store max `nbColors` ever reached, and compare against palette size later
	size_t nbColors = 0; // Number of colors in the current palette
	for (;;) {
		++n; // Ignore the '#' (checked either by caller or previous loop iteration)

		Rgba &color = options.palSpec.back()[nbColors];
		auto pos = std::min(arg.find_first_not_of("0123456789ABCDEFabcdef"sv, n), arg.length());
		switch (pos - n) {
		case 3:
			color = Rgba(singleToHex(arg[n + 0]), singleToHex(arg[n + 1]), singleToHex(arg[n + 2]),
			             0xFF);
			break;
		case 6:
			color = Rgba(toHex(arg[n + 0], arg[n + 1]), toHex(arg[n + 2], arg[n + 3]),
			             toHex(arg[n + 4], arg[n + 5]), 0xFF);
			break;
		case 0:
			parseError(n - 1, 1, "Missing color after '#'");
			return;
		default:
			parseError(n, pos - n, "Unknown color specification");
			return;
		}
		n = pos;

		// Skip whitespace, if any
		skipWhitespace(arg, n);

		// Skip comma/semicolon, or end
		if (n == arg.length()) {
			break;
		}
		switch (arg[n]) {
		case ',':
			++n; // Skip it

			++nbColors;

			// A trailing comma may be followed by a semicolon
			skipWhitespace(arg, n);
			if (n == arg.length()) {
				break;
			} else if (arg[n] != ';' && arg[n] != ':') {
				if (nbColors == 4) {
					parseError(n, 1, "Each palette can only contain up to 4 colors");
					return;
				}
				break;
			}
			[[fallthrough]];

		case ':':
		case ';':
			++n;
			skipWhitespace(arg, n);

			nbColors = 0; // Start a new palette
			// Avoid creating a spurious empty palette
			if (n != arg.length()) {
				options.palSpec.emplace_back();
			}
			break;

		default:
			parseError(n, 1, "Unexpected character, expected ',', ';', or end of argument");
			return;
		}

		// Check again to allow trailing a comma/semicolon
		if (n == arg.length()) {
			break;
		}
		if (arg[n] != '#') {
			parseError(n, 1, "Unexpected character, expected '#'");
			return;
		}
	}
}

/*
 * Tries to read some magic bytes from the provided `file`.
 * Returns whether the magic was correctly read.
 */
template<size_t n>
static bool readMagic(std::filebuf &file, char const *magic) {
	assert(strlen(magic) == n);

	char magicBuf[n];
	return file.sgetn(magicBuf, n) == n && memcmp(magicBuf, magic, n);
}

// Like `readMagic`, but automatically determines the size from the string literal's length.
// Don't worry if you make a mistake, an `assert`'s got your back!
#define READ_MAGIC(file, magic) \
	readMagic<sizeof(magic) - 1>(file, magic) // Don't count the terminator

template<typename T, typename U>
static T readBE(U const *bytes) {
	T val = 0;
	for (size_t i = 0; i < sizeof(val); ++i) {
		val = val << 8 | static_cast<uint8_t>(bytes[i]);
	}
	return val;
}

template<typename T, typename U>
static T readLE(U const *bytes) {
	T val = 0;
	for (size_t i = 0; i < sizeof(val); ++i) {
		val |= static_cast<uint8_t>(bytes[i]) << (i * 8);
	}
	return val;
}

/*
 * **Appends** the first line read from `file` to the end of the provided `buffer`.
 */
static void readLine(std::filebuf &file, std::string &buffer) {
	// TODO: maybe this can be optimized to bulk reads?
	for (;;) {
		auto c = file.sbumpc();
		if (c == std::filebuf::traits_type::eof()) {
			return;
		}
		if (c == '\n') {
			// Discard a trailing CRLF
			if (!buffer.empty() && buffer.back() == '\r') {
				buffer.pop_back();
			}
			return;
		}

		buffer.push_back(c);
	}
}

// FIXME: Normally we'd use `std::from_chars`, but that's not available with GCC 7
/*
 * Parses the initial part of a string_view, advancing the "read index" as it does
 */
template<typename U> // Should be uint*_t
static std::optional<U> parseDec(std::string const &str, std::string::size_type &n) {
	std::string::size_type start = n;

	uintmax_t value = 0; // Use a larger type to handle overflow more easily
	for (auto end = std::min(str.length(), str.find_first_not_of("0123456789"sv, n)); n < end;
	     ++n) {
		value = std::min(value * 10 + (str[n] - '0'), (uintmax_t)std::numeric_limits<U>::max);
	}

	return n > start ? std::optional<U>{value} : std::nullopt;
}

static std::optional<Rgba> parseColor(std::string const &str, std::string::size_type &n,
                                      uint16_t i) {
	std::optional<uint8_t> r = parseDec<uint8_t>(str, n);
	if (!r) {
		error("Failed to parse color #%" PRIu16 " (\"%s\"): invalid red component", i + 1,
		      str.c_str());
		return std::nullopt;
	}
	skipWhitespace(str, n);
	if (n == str.length()) {
		error("Failed to parse color #%" PRIu16 " (\"%s\"): missing green component", i + 1,
		      str.c_str());
		return std::nullopt;
	}
	std::optional<uint8_t> g = parseDec<uint8_t>(str, n);
	if (!g) {
		error("Failed to parse color #%" PRIu16 " (\"%s\"): invalid green component", i + 1,
		      str.c_str());
		return std::nullopt;
	}
	skipWhitespace(str, n);
	if (n == str.length()) {
		error("Failed to parse color #%" PRIu16 " (\"%s\"): missing blue component", i + 1,
		      str.c_str());
		return std::nullopt;
	}
	std::optional<uint8_t> b = parseDec<uint8_t>(str, n);
	if (!b) {
		error("Failed to parse color #%" PRIu16 " (\"%s\"): invalid blue component", i + 1,
		      str.c_str());
		return std::nullopt;
	}

	return std::optional<Rgba>{Rgba(*r, *g, *b, 0xFF)};
}

static void parsePSPFile(std::filebuf &file) {
	// https://www.selapa.net/swatches/colors/fileformats.php#psp_pal

	std::string line;
	readLine(file, line);
	if (line != "JASC-PAL") {
		error("Palette file does not appear to be a PSP palette file");
		return;
	}

	line.clear();
	readLine(file, line);
	if (line != "0100") {
		error("Unsupported PSP palette file version \"%s\"", line.c_str());
		return;
	}

	line.clear();
	readLine(file, line);
	std::string::size_type n = 0;
	std::optional<uint16_t> nbColors = parseDec<uint16_t>(line, n);
	if (!nbColors || n != line.length()) {
		error("Invalid \"number of colors\" line in PSP file (%s)", line.c_str());
		return;
	}

	if (*nbColors > options.nbColorsPerPal * options.nbPalettes) {
		warning("PSP file contains %" PRIu16 " colors, but there can only be %" PRIu16
		        "; ignoring extra",
		        *nbColors, options.nbColorsPerPal * options.nbPalettes);
		nbColors = options.nbColorsPerPal * options.nbPalettes;
	}

	options.palSpec.clear();

	for (uint16_t i = 0; i < *nbColors; ++i) {
		line.clear();
		readLine(file, line);

		n = 0;
		std::optional<Rgba> color = parseColor(line, n, i + 1);
		if (!color) {
			return;
		}
		if (n != line.length()) {
			error("Failed to parse color #%" PRIu16
			      " (\"%s\"): trailing characters after blue component",
			      i + 1, line.c_str());
			return;
		}

		if (i % options.nbColorsPerPal == 0) {
			options.palSpec.emplace_back();
		}
		options.palSpec.back()[i % options.nbColorsPerPal] = *color;
	}
}

static void parseGPLFile(std::filebuf &file) {
	// https://gitlab.gnome.org/GNOME/gimp/-/blob/gimp-2-10/app/core/gimppalette-load.c#L39

	std::string line;
	readLine(file, line);
	// FIXME: C++20 will allow `!line.starts_with` instead of `line.rfind` with 0
	if (line.rfind("GIMP Palette", 0)) {
		error("Palette file does not appear to be a GPL palette file");
		return;
	}

	uint16_t nbColors = 0;
	uint16_t maxNbColors = options.nbColorsPerPal * options.nbPalettes;

	for (;;) {
		line.clear();
		readLine(file, line);
		if (!line.length()) {
			break;
		}

		// FIXME: C++20 will allow `line.starts_with` instead of `!line.rfind` with 0
		if (!line.rfind("#", 0) || !line.rfind("Name:", 0) || !line.rfind("Column:", 0)) {
			continue;
		}

		std::string::size_type n = 0;
		std::optional<Rgba> color = parseColor(line, n, nbColors + 1);
		if (!color) {
			return;
		}

		++nbColors;
		if (nbColors < maxNbColors) {
			if (nbColors % options.nbColorsPerPal == 1) {
				options.palSpec.emplace_back();
			}
			options.palSpec.back()[nbColors % options.nbColorsPerPal] = *color;
		}
	}

	if (nbColors > maxNbColors) {
		warning("GPL file contains %" PRIu16 " colors, but there can only be %" PRIu16
		        "; ignoring extra",
		        nbColors, maxNbColors);
	}
}

static void parseHEXFile(std::filebuf &file) {
	// https://lospec.com/palette-list/tag/gbc

	uint16_t nbColors = 0;
	uint16_t maxNbColors = options.nbColorsPerPal * options.nbPalettes;

	for (;;) {
		std::string line;
		readLine(file, line);
		if (!line.length()) {
			break;
		}

		if (line.length() != 6
		    || line.find_first_not_of("0123456789ABCDEFabcdef"sv) != std::string::npos) {
			error("Failed to parse color #%" PRIu16 " (\"%s\"): invalid \"rrggbb\" line",
			      nbColors + 1, line.c_str());
			return;
		}

		Rgba color =
		    Rgba(toHex(line[0], line[1]), toHex(line[2], line[3]), toHex(line[4], line[5]), 0xFF);

		++nbColors;
		if (nbColors < maxNbColors) {
			if (nbColors % options.nbColorsPerPal == 1) {
				options.palSpec.emplace_back();
			}
			options.palSpec.back()[nbColors % options.nbColorsPerPal] = color;
		}
	}

	if (nbColors > maxNbColors) {
		warning("HEX file contains %" PRIu16 " colors, but there can only be %" PRIu16
		        "; ignoring extra",
		        nbColors, maxNbColors);
	}
}

static void parseACTFile(std::filebuf &file) {
	// https://www.adobe.com/devnet-apps/photoshop/fileformatashtml/#50577411_pgfId-1070626

	std::array<char, 772> buf;
	auto len = file.sgetn(buf.data(), buf.size());

	uint16_t nbColors = 256;
	if (len == 772) {
		nbColors = readBE<uint16_t>(&buf[768]);
		// TODO: apparently there is a "transparent color index"? What?
		if (nbColors > 256 || nbColors == 0) {
			error("Invalid number of colors in ACT file (%" PRIu16 ")", nbColors);
			return;
		}
	} else if (len != 768) {
		error("Invalid file size for ACT file (expected 768 or 772 bytes, got %zu", len);
		return;
	}

	if (nbColors > options.nbColorsPerPal * options.nbPalettes) {
		warning("ACT file contains %" PRIu16 " colors, but there can only be %" PRIu16
		        "; ignoring extra",
		        nbColors, options.nbColorsPerPal * options.nbPalettes);
		nbColors = options.nbColorsPerPal * options.nbPalettes;
	}

	options.palSpec.clear();
	options.palSpec.emplace_back();

	char const *ptr = buf.data();
	size_t colorIdx = 0;
	for (uint16_t i = 0; i < nbColors; ++i) {
		Rgba &color = options.palSpec.back()[colorIdx];
		color = Rgba(ptr[0], ptr[1], ptr[2], 0xFF);

		ptr += 3;
		++colorIdx;
		if (colorIdx == options.nbColorsPerPal) {
			options.palSpec.emplace_back();
			colorIdx = 0;
		}
	}

	// Remove the spurious empty palette if there is one
	if (colorIdx == 0) {
		options.palSpec.pop_back();
	}
}

static void parseACOFile(std::filebuf &file) {
	// https://www.adobe.com/devnet-apps/photoshop/fileformatashtml/#50577411_pgfId-1055819
	// http://www.nomodes.com/aco.html

	char buf[10];

	if (file.sgetn(buf, 2) != 2) {
		error("Couldn't read ACO file version");
		return;
	}
	if (readBE<uint16_t>(buf) != 1) {
		error("Palette file does not appear to be an ACO file");
		return;
	}

	if (file.sgetn(buf, 2) != 2) {
		error("Couldn't read number of colors in palette file");
		return;
	}
	uint16_t nbColors = readBE<uint16_t>(buf);

	if (nbColors > options.nbColorsPerPal * options.nbPalettes) {
		warning("ACO file contains %" PRIu16 " colors, but there can only be %" PRIu16
		        "; ignoring extra",
		        nbColors, options.nbColorsPerPal * options.nbPalettes);
		nbColors = options.nbColorsPerPal * options.nbPalettes;
	}

	options.palSpec.clear();

	for (uint16_t i = 0; i < nbColors; ++i) {
		if (file.sgetn(buf, 10) != 10) {
			error("Failed to read color #%" PRIu16 " from palette file", i + 1);
			return;
		}

		if (i % options.nbColorsPerPal == 0) {
			options.palSpec.emplace_back();
		}

		Rgba &color = options.palSpec.back()[i % options.nbColorsPerPal];
		uint16_t colorType = readBE<uint16_t>(buf);
		switch (colorType) {
		case 0: // RGB
			color = Rgba(buf[0], buf[2], buf[4], 0xFF);
			break;
		case 1: // HSB
			error("Unsupported color type (HSB) for ACO file");
			return;
		case 2: // CMYK
			error("Unsupported color type (CMYK) for ACO file");
			return;
		case 7: // Lab
			error("Unsupported color type (lab) for ACO file");
			return;
		case 8: // Grayscale
			error("Unsupported color type (grayscale) for ACO file");
			return;
		default:
			error("Unknown color type (%" PRIu16 ") for ACO file", colorType);
			return;
		}
	}

	// TODO: maybe scan the v2 data instead (if present)
	// `codecvt` can be used to convert from UTF-16 to UTF-8
}

static void parseGBCFile(std::filebuf &file) {
	// This only needs to be able to read back files generated by `rgbgfx -p`
	options.palSpec.clear();

	for (;;) {
		char buf[2 * 4];
		auto len = file.sgetn(buf, sizeof(buf));
		if (len == 0) {
			break;
		} else if (len != sizeof(buf)) {
			error("GBC palette dump contains %zu 8-byte palette%s, plus %zu byte%s",
			      options.palSpec.size(), options.palSpec.size() == 1 ? "" : "s", len,
			      len == 1 ? "" : "s");
			break;
		}

		options.palSpec.push_back({Rgba::fromCGBColor(readLE<uint16_t>(&buf[0])),
		                           Rgba::fromCGBColor(readLE<uint16_t>(&buf[2])),
		                           Rgba::fromCGBColor(readLE<uint16_t>(&buf[4])),
		                           Rgba::fromCGBColor(readLE<uint16_t>(&buf[6]))});
	}
}

void parseExternalPalSpec(char const *arg) {
	// `fmt:path`, parse the file according to the given format

	// Split both parts, error out if malformed
	char const *ptr = strchr(arg, ':');
	if (ptr == nullptr) {
		error("External palette spec must have format `fmt:path` (missing colon)");
		return;
	}
	char const *path = ptr + 1;

	static std::array parsers{
	    std::tuple{"PSP", &parsePSPFile, std::ios::in    },
	    std::tuple{"GPL", &parseGPLFile, std::ios::in    },
	    std::tuple{"HEX", &parseHEXFile, std::ios::in    },
	    std::tuple{"ACT", &parseACTFile, std::ios::binary},
	    std::tuple{"ACO", &parseACOFile, std::ios::binary},
	    std::tuple{"GBC", &parseGBCFile, std::ios::binary},
	};

	auto iter = std::find_if(parsers.begin(), parsers.end(),
	                         [&arg, &ptr](decltype(parsers)::value_type const &parser) {
		                         return strncasecmp(arg, std::get<0>(parser), ptr - arg) == 0;
	                         });
	if (iter == parsers.end()) {
		error("Unknown external palette format \"%.*s\"",
		      static_cast<int>(std::min(ptr - arg, static_cast<decltype(ptr - arg)>(INT_MAX))),
		      arg);
		return;
	}

	std::filebuf file;
	// Some parsers read the file in text mode, others in binary mode
	if (!file.open(path, std::ios::in | std::get<2>(*iter))) {
		error("Failed to open palette file \"%s\"", path);
		return;
	}

	std::get<1> (*iter)(file);
}
