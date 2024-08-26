/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2022, Eldred Habert and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#include "gfx/process.hpp"

#include <algorithm>
#include <assert.h>
#include <cinttypes>
#include <climits>
#include <cstdio>
#include <errno.h>
#include <fstream>
#include <memory>
#include <optional>
#include <png.h>
#include <setjmp.h>
#include <stdint.h>
#include <string.h>
#include <tuple>
#include <unordered_set>
#include <utility>
#include <vector>

#include "defaultinitalloc.hpp"
#include "file.hpp"
#include "helpers.h"
#include "itertools.hpp"

#include "gfx/main.hpp"
#include "gfx/pal_packing.hpp"
#include "gfx/pal_sorting.hpp"
#include "gfx/proto_palette.hpp"

class ImagePalette {
	// Use as many slots as there are CGB colors (plus transparency)
	std::array<std::optional<Rgba>, 0x8001> _colors;

public:
	ImagePalette() = default;

	/*
	 * Registers a color in the palette.
	 * If the newly inserted color "conflicts" with another one (different color, but same CGB
	 * color), then the other color is returned. Otherwise, `nullptr` is returned.
	 */
	[[nodiscard]] Rgba const *registerColor(Rgba const &rgba) {
		decltype(_colors)::value_type &slot = _colors[rgba.cgbColor()];

		if (rgba.cgbColor() == Rgba::transparent) {
			options.hasTransparentPixels = true;
		}

		if (!slot.has_value()) {
			slot.emplace(rgba);
		} else if (*slot != rgba) {
			assert(slot->cgbColor() != UINT16_MAX);
			return &*slot;
		}
		return nullptr;
	}

	size_t size() const {
		return std::count_if(_colors.begin(), _colors.end(),
		                     [](decltype(_colors)::value_type const &slot) {
			                     return slot.has_value() && !slot->isTransparent();
		                     });
	}
	decltype(_colors) const &raw() const { return _colors; }

	auto begin() const { return _colors.begin(); }
	auto end() const { return _colors.end(); }
};

class Png {
	std::string const &path;
	File file{};
	png_structp png = nullptr;
	png_infop info = nullptr;

	// These are cached for speed
	uint32_t width, height;
	DefaultInitVec<Rgba> pixels;
	ImagePalette colors;
	int colorType;
	int nbColors;
	png_colorp embeddedPal = nullptr;
	png_bytep transparencyPal = nullptr;

	[[noreturn]] static void handleError(png_structp png, char const *msg) {
		Png *self = reinterpret_cast<Png *>(png_get_error_ptr(png));

		fatal("Error reading input image (\"%s\"): %s", self->file.c_str(self->path), msg);
	}

	static void handleWarning(png_structp png, char const *msg) {
		Png *self = reinterpret_cast<Png *>(png_get_error_ptr(png));

		warning("In input image (\"%s\"): %s", self->file.c_str(self->path), msg);
	}

	static void readData(png_structp png, png_bytep data, size_t length) {
		Png *self = reinterpret_cast<Png *>(png_get_io_ptr(png));
		std::streamsize expectedLen = length;
		std::streamsize nbBytesRead =
		    self->file->sgetn(reinterpret_cast<char *>(data), expectedLen);

		if (nbBytesRead != expectedLen) {
			fatal("Error reading input image (\"%s\"): file too short (expected at least %zd more "
			      "bytes after reading %lld)",
			      self->file.c_str(self->path), length - nbBytesRead,
			      self->file->pubseekoff(0, std::ios_base::cur));
		}
	}

public:
	ImagePalette const &getColors() const { return colors; }

	int getColorType() const { return colorType; }

	std::tuple<int, png_const_colorp, png_bytep> getEmbeddedPal() const {
		return {nbColors, embeddedPal, transparencyPal};
	}

	uint32_t getWidth() const { return width; }

	uint32_t getHeight() const { return height; }

	Rgba &pixel(uint32_t x, uint32_t y) { return pixels[y * width + x]; }

	Rgba const &pixel(uint32_t x, uint32_t y) const { return pixels[y * width + x]; }

	bool isSuitableForGrayscale() const {
		// Check that all of the grays don't fall into the same "bin"
		if (colors.size() > options.maxOpaqueColors()) { // Apply the Pigeonhole Principle
			options.verbosePrint(Options::VERB_DEBUG,
			                     "Too many colors for grayscale sorting (%zu > %" PRIu8 ")\n",
			                     colors.size(), options.maxOpaqueColors());
			return false;
		}
		uint8_t bins = 0;
		for (auto const &color : colors) {
			if (!color.has_value() || color->isTransparent()) {
				continue;
			}
			if (!color->isGray()) {
				options.verbosePrint(Options::VERB_DEBUG,
				                     "Found non-gray color #%08x, not using grayscale sorting\n",
				                     color->toCSS());
				return false;
			}
			uint8_t mask = 1 << color->grayIndex();
			if (bins & mask) { // Two in the same bin!
				options.verbosePrint(
				    Options::VERB_DEBUG,
				    "Color #%08x conflicts with another one, not using grayscale sorting\n",
				    color->toCSS());
				return false;
			}
			bins |= mask;
		}
		return true;
	}

	/*
	 * Reads a PNG and notes all of its colors
	 *
	 * This code is more complicated than strictly necessary, but that's because of the API
	 * being used: the "high-level" interface doesn't provide all the transformations we need,
	 * so we use the "lower-level" one instead.
	 * We also use that occasion to only read the PNG one line at a time, since we store all of
	 * the pixel data in `pixels`, which saves on memory allocations.
	 */
	explicit Png(std::string const &filePath) : path(filePath), colors() {
		if (file.open(path, std::ios_base::in | std::ios_base::binary) == nullptr) {
			fatal("Failed to open input image (\"%s\"): %s", file.c_str(path), strerror(errno));
		}

		options.verbosePrint(Options::VERB_LOG_ACT, "Opened input file\n");

		std::array<unsigned char, 8> pngHeader;

		if (file->sgetn(reinterpret_cast<char *>(pngHeader.data()), pngHeader.size())
		        != static_cast<std::streamsize>(pngHeader.size()) // Not enough bytes?
		    || png_sig_cmp(pngHeader.data(), 0, pngHeader.size()) != 0) {
			fatal("Input file (\"%s\") is not a PNG image!", file.c_str(path));
		}

		options.verbosePrint(Options::VERB_INTERM, "PNG header signature is OK\n");

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

		if (options.inputSlice.width == 0 && width % 8 != 0) {
			fatal("Image width (%" PRIu32 " pixels) is not a multiple of 8!", width);
		}
		if (options.inputSlice.height == 0 && height % 8 != 0) {
			fatal("Image height (%" PRIu32 " pixels) is not a multiple of 8!", height);
		}

		pixels.resize(static_cast<size_t>(width) * static_cast<size_t>(height));

		auto colorTypeName = [this]() {
			switch (colorType) {
			case PNG_COLOR_TYPE_GRAY:
				return "grayscale";
			case PNG_COLOR_TYPE_GRAY_ALPHA:
				return "grayscale + alpha";
			case PNG_COLOR_TYPE_PALETTE:
				return "palette";
			case PNG_COLOR_TYPE_RGB:
				return "RGB";
			case PNG_COLOR_TYPE_RGB_ALPHA:
				return "RGB + alpha";
			default:
				fatal("Unknown color type %d", colorType);
			}
		};
		auto interlaceTypeName = [&interlaceType]() {
			switch (interlaceType) {
			case PNG_INTERLACE_NONE:
				return "not interlaced";
			case PNG_INTERLACE_ADAM7:
				return "interlaced (Adam7)";
			default:
				fatal("Unknown interlace type %d", interlaceType);
			}
		};
		options.verbosePrint(Options::VERB_INTERM,
		                     "Input image: %" PRIu32 "x%" PRIu32 " pixels, %dbpp %s, %s\n", width,
		                     height, bitDepth, colorTypeName(), interlaceTypeName());

		if (png_get_PLTE(png, info, &embeddedPal, &nbColors) != 0) {
			int nbTransparentEntries;
			if (png_get_tRNS(png, info, &transparencyPal, &nbTransparentEntries, nullptr)) {
				assert(nbTransparentEntries == nbColors);
			}

			options.verbosePrint(Options::VERB_INTERM, "Embedded palette has %d colors: [",
			                     nbColors);
			for (int i = 0; i < nbColors; ++i) {
				auto const &color = embeddedPal[i];
				options.verbosePrint(
				    Options::VERB_INTERM, "#%02x%02x%02x%02x%s", color.red, color.green, color.blue,
				    transparencyPal ? transparencyPal[i] : 0xFF, i != nbColors - 1 ? ", " : "]\n");
			}
		} else {
			options.verbosePrint(Options::VERB_INTERM, "No embedded palette\n");
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
		// Holds known-conflicting color pairs to avoid warning about them twice.
		// We don't need to worry about transitivity, as ImagePalette slots are immutable once
		// assigned, and conflicts always occur between that and another color.
		// For the same reason, we don't need to worry about order, either.
		std::vector<std::tuple<uint32_t, uint32_t>> conflicts;
		// Holds colors whose alpha value is ambiguous
		std::vector<uint32_t> indeterminates;

		// Assign a color to the given position, and register it in the image palette as well
		auto assignColor = [this, &conflicts, &indeterminates](png_uint_32 x, png_uint_32 y,
		                                                       Rgba &&color) {
			if (!color.isTransparent() && !color.isOpaque()) {
				uint32_t css = color.toCSS();
				if (std::find(indeterminates.begin(), indeterminates.end(), css)
				    == indeterminates.end()) {
					error("Color #%08x is neither transparent (alpha < %u) nor opaque (alpha >= "
					      "%u) [first seen at x: %" PRIu32 ", y: %" PRIu32 "]",
					      css, Rgba::transparency_threshold, Rgba::opacity_threshold, x, y);
					indeterminates.push_back(css);
				}
			} else if (Rgba const *other = colors.registerColor(color); other) {
				std::tuple conflicting{color.toCSS(), other->toCSS()};
				// Do not report combinations twice
				if (std::find(conflicts.begin(), conflicts.end(), conflicting) == conflicts.end()) {
					warning("Fusing colors #%08x and #%08x into Game Boy color $%04x [first seen "
					        "at x: %" PRIu32 ", y: %" PRIu32 "]",
					        std::get<0>(conflicting), std::get<1>(conflicting), color.cgbColor(), x,
					        y);
					// Do not report this combination again
					conflicts.emplace_back(conflicting);
				}
			}

			pixel(x, y) = color;
		};

		if (interlaceType == PNG_INTERLACE_NONE) {
			for (png_uint_32 y = 0; y < height; ++y) {
				png_read_row(png, row.data(), nullptr);

				for (png_uint_32 x = 0; x < width; ++x) {
					assignColor(x, y,
					            Rgba(row[x * 4], row[x * 4 + 1], row[x * 4 + 2], row[x * 4 + 3]));
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
						assignColor(x, y, Rgba(ptr[0], ptr[1], ptr[2], ptr[3]));
						ptr += 4;
					}
				}
			}
		}

		// We don't care about chunks after the image data (comments, etc.)
		png_read_end(png, nullptr);
	}

	~Png() { png_destroy_read_struct(&png, &info, nullptr); }

	class TilesVisitor {
		Png const &_png;
		bool const _columnMajor;
		uint32_t const _width, _height;
		uint32_t const _limit = _columnMajor ? _height : _width;

	public:
		TilesVisitor(Png const &png, bool columnMajor, uint32_t width, uint32_t height)
		    : _png(png), _columnMajor(columnMajor), _width(width), _height(height) {}

		class Tile {
			Png const &_png;
		public:
			uint32_t const x, y;

			Tile(Png const &png, uint32_t x_, uint32_t y_) : _png(png), x(x_), y(y_) {}

			Rgba pixel(uint32_t xOfs, uint32_t yOfs) const {
				return _png.pixel(x + xOfs, y + yOfs);
			}
		};

	private:
		struct iterator {
			TilesVisitor const &parent;
			uint32_t const limit;
			uint32_t x, y;

			std::pair<uint32_t, uint32_t> coords() const {
				return {x + options.inputSlice.left, y + options.inputSlice.top};
			}
			Tile operator*() const {
				return {parent._png, x + options.inputSlice.left, y + options.inputSlice.top};
			}

			iterator &operator++() {
				auto [major, minor] = parent._columnMajor ? std::tie(y, x) : std::tie(x, y);
				major += 8;
				if (major == limit) {
					minor += 8;
					major = 0;
				}
				return *this;
			}

			friend bool operator==(iterator const &lhs, iterator const &rhs) {
				return lhs.coords() == rhs.coords(); // Compare the returned coord pairs
			}

			friend bool operator!=(iterator const &lhs, iterator const &rhs) {
				return lhs.coords() != rhs.coords(); // Compare the returned coord pairs
			}
		};

	public:
		iterator begin() const { return {*this, _limit, 0, 0}; }
		iterator end() const {
			iterator it{*this, _limit, _width - 8, _height - 8}; // Last valid one...
			return ++it; // ...now one-past-last!
		}
	};
public:
	TilesVisitor visitAsTiles() const {
		return {*this, options.columnMajor,
		        options.inputSlice.width ? options.inputSlice.width * 8 : width,
		        options.inputSlice.height ? options.inputSlice.height * 8 : height};
	}
};

class RawTiles {
	/*
	 * A tile which only contains indices into the image's global palette
	 */
	class RawTile {
		std::array<std::array<size_t, 8>, 8> _pixelIndices{};

	public:
		// Not super clean, but it's closer to matrix notation
		size_t &operator()(size_t x, size_t y) { return _pixelIndices[y][x]; }
	};

private:
	std::vector<RawTile> _tiles;

public:
	/*
	 * Creates a new raw tile, and returns a reference to it so it can be filled in
	 */
	RawTile &newTile() {
		_tiles.emplace_back();
		return _tiles.back();
	}
};

struct AttrmapEntry {
	/*
	 * This field can either be a proto-palette ID, or `transparent` to indicate that the
	 * corresponding tile is fully transparent. If you are looking to get the palette ID for this
	 * attrmap entry while correctly handling the above, use `getPalID`.
	 */
	size_t protoPaletteID; // Only this field is used when outputting "unoptimized" data
	uint8_t tileID; // This is the ID as it will be output to the tilemap
	bool bank;
	bool yFlip;
	bool xFlip;

	static constexpr decltype(protoPaletteID) transparent = SIZE_MAX;

	size_t getPalID(DefaultInitVec<size_t> const &mappings) const {
		return protoPaletteID == transparent ? 0 : mappings[protoPaletteID];
	}
};

static std::tuple<DefaultInitVec<size_t>, std::vector<Palette>>
    generatePalettes(std::vector<ProtoPalette> const &protoPalettes, Png const &png) {
	// Run a "pagination" problem solver
	// TODO: allow picking one of several solvers?
	auto [mappings, nbPalettes] = packing::overloadAndRemove(protoPalettes);
	assert(mappings.size() == protoPalettes.size());

	if (options.verbosity >= Options::VERB_INTERM) {
		fprintf(stderr, "Proto-palette mappings: (%zu palette%s)\n", nbPalettes,
		        nbPalettes != 1 ? "s" : "");
		for (size_t i = 0; i < mappings.size(); ++i) {
			fprintf(stderr, "%zu -> %zu\n", i, mappings[i]);
		}
	}

	std::vector<Palette> palettes(nbPalettes);
	// If the image contains at least one transparent pixel, force transparency in the first slot of
	// all palettes
	if (options.hasTransparentPixels) {
		for (Palette &pal : palettes) {
			pal.colors[0] = Rgba::transparent;
		}
	}
	// Generate the actual palettes from the mappings
	for (size_t protoPalID = 0; protoPalID < mappings.size(); ++protoPalID) {
		auto &pal = palettes[mappings[protoPalID]];
		for (uint16_t color : protoPalettes[protoPalID]) {
			pal.addColor(color);
		}
	}

	// "Sort" colors in the generated palettes, see the man page for the flowchart
	auto [embPalSize, embPalRGB, embPalAlpha] = png.getEmbeddedPal();
	if (embPalRGB != nullptr) {
		sorting::indexed(palettes, embPalSize, embPalRGB, embPalAlpha);
	} else if (png.isSuitableForGrayscale()) {
		sorting::grayscale(palettes, png.getColors().raw());
	} else {
		sorting::rgb(palettes);
	}
	return {mappings, palettes};
}

static std::tuple<DefaultInitVec<size_t>, std::vector<Palette>>
    makePalsAsSpecified(std::vector<ProtoPalette> const &protoPalettes, Png const &png) {
	if (options.palSpecType == Options::EMBEDDED) {
		// Generate a palette spec from the first few colors in the embedded palette
		auto [embPalSize, embPalRGB, embPalAlpha] = png.getEmbeddedPal();
		if (embPalRGB == nullptr) {
			fatal("`-c embedded` was given, but the PNG does not have an embedded palette!");
		}

		// Fill in the palette spec
		options.palSpec.emplace_back(); // A single palette, with `#00000000`s (transparent)
		assert(options.palSpec.size() == 1);
		if (embPalSize > options.maxOpaqueColors()) { // Ignore extraneous colors if they are unused
			embPalSize = options.maxOpaqueColors();
		}
		for (int i = 0; i < embPalSize; ++i) {
			options.palSpec[0][i] = Rgba(embPalRGB[i].red, embPalRGB[i].green, embPalRGB[i].blue,
			                             embPalAlpha ? embPalAlpha[i] : 0xFF);
		}
	}

	// Convert the palette spec to actual palettes
	std::vector<Palette> palettes(options.palSpec.size());
	for (auto [spec, pal] : zip(options.palSpec, palettes)) {
		for (size_t i = 0; i < options.nbColorsPerPal && spec[i].isOpaque(); ++i) {
			pal[i] = spec[i].cgbColor();
		}
	}

	auto listColors = [](auto const &list) {
		static char buf[sizeof(", $XXXX, $XXXX, $XXXX, $XXXX")];
		char *ptr = buf;
		for (uint16_t cgbColor : list) {
			sprintf(ptr, ", $%04x", cgbColor);
			ptr += 7;
		}
		return &buf[2];
	};

	// Iterate through proto-palettes, and try mapping them to the specified palettes
	DefaultInitVec<size_t> mappings(protoPalettes.size());
	bool bad = false;
	for (size_t i = 0; i < protoPalettes.size(); ++i) {
		ProtoPalette const &protoPal = protoPalettes[i];
		// Find the palette...
		auto iter = std::find_if(palettes.begin(), palettes.end(), [&protoPal](Palette const &pal) {
			// ...which contains all colors in this proto-pal
			return std::all_of(protoPal.begin(), protoPal.end(), [&pal](uint16_t color) {
				return std::find(pal.begin(), pal.end(), color) != pal.end();
			});
		});

		if (iter == palettes.end()) {
			assert(!protoPal.empty());
			error("Could not fit tile colors [%s] in specified palettes", listColors(protoPal));
			bad = true;
		}
		mappings[i] = iter - palettes.begin(); // Bogus value, but whatever
	}
	if (bad) {
		fprintf(stderr, "note: The following palette%s specified:\n",
		        palettes.size() == 1 ? " was" : "s were");
		for (Palette const &pal : palettes) {
			fprintf(stderr, "        [%s]\n", listColors(pal));
		}
		giveUp();
	}

	return {mappings, palettes};
}

static void outputPalettes(std::vector<Palette> const &palettes) {
	File output;
	if (!output.open(options.palettes, std::ios_base::out | std::ios_base::binary)) {
		fatal("Failed to open \"%s\": %s", output.c_str(options.palettes), strerror(errno));
	}

	for (Palette const &palette : palettes) {
		for (uint8_t i = 0; i < options.nbColorsPerPal; ++i) {
			uint16_t color = palette.colors[i]; // Will return `UINT16_MAX` for unused slots
			output->sputc(color & 0xFF);
			output->sputc(color >> 8);
		}
	}
}

class TileData {
	std::array<uint8_t, 16> _data;
	// The hash is a bit lax: it's the XOR of all lines, and every other nibble is identical
	// if horizontal mirroring is in effect. It should still be a reasonable tie-breaker in
	// non-pathological cases.
	uint16_t _hash;
public:
	// This is an index within the "global" pool; no bank info is encoded here
	// It's marked as `mutable` so that it can be modified even on a `const` object;
	// this is necessary because the `set` in which it's inserted refuses any modification for fear
	// of altering the element's hash, but the tile ID is not part of it.
	mutable uint16_t tileID;

	static uint16_t rowBitplanes(Png::TilesVisitor::Tile const &tile, Palette const &palette,
	                             uint32_t y) {
		uint16_t row = 0;
		for (uint32_t x = 0; x < 8; ++x) {
			row <<= 1;
			uint8_t index = palette.indexOf(tile.pixel(x, y).cgbColor());
			assert(index < palette.size()); // The color should be in the palette
			if (index & 1) {
				row |= 1;
			}
			if (index & 2) {
				row |= 0x100;
			}
		}
		return row;
	}

	TileData(Png::TilesVisitor::Tile const &tile, Palette const &palette) : _hash(0) {
		size_t writeIndex = 0;
		for (uint32_t y = 0; y < 8; ++y) {
			uint16_t bitplanes = rowBitplanes(tile, palette, y);
			_data[writeIndex++] = bitplanes & 0xFF;
			if (options.bitDepth == 2) {
				_data[writeIndex++] = bitplanes >> 8;
			}

			// Update the hash
			_hash ^= bitplanes;
			if (options.allowMirroring) {
				// Count the line itself as mirrorred; vertical mirroring is
				// already taken care of because the symmetric line will be XOR'd
				// the same way. (...which is a problem, but probably benign.)
				_hash ^= flipTable[bitplanes >> 8] << 8 | flipTable[bitplanes & 0xFF];
			}
		}
	}

	auto const &data() const { return _data; }
	uint16_t hash() const { return _hash; }

	enum MatchType {
		NOPE,
		EXACT,
		HFLIP,
		VFLIP,
		VHFLIP,
	};
	MatchType tryMatching(TileData const &other) const {
		// Check for strict equality first, as that can typically be optimized, and it allows
		// hoisting the mirroring check out of the loop
		if (_data == other._data) {
			return MatchType::EXACT;
		}

		if (!options.allowMirroring) {
			return MatchType::NOPE;
		}

		// Check if we have horizontal mirroring, which scans the array forward again
		if (std::equal(_data.begin(), _data.end(), other._data.begin(),
		               [](uint8_t lhs, uint8_t rhs) { return lhs == flipTable[rhs]; })) {
			return MatchType::HFLIP;
		}

		// Check if we have vertical or vertical+horizontal mirroring, for which we have to read
		// bitplane *pairs*  backwards
		bool hasVFlip = true, hasVHFlip = true;
		for (uint8_t i = 0; i < _data.size(); ++i) {
			// Flip the bottom bit to get the corresponding row's bitplane 0/1
			// (This works because the array size is even)
			uint8_t lhs = _data[i], rhs = other._data[(15 - i) ^ 1];
			if (lhs != rhs) {
				hasVFlip = false;
			}
			if (lhs != flipTable[rhs]) {
				hasVHFlip = false;
			}
			if (!hasVFlip && !hasVHFlip) {
				return MatchType::NOPE; // If both have been eliminated, all hope is lost!
			}
		}

		// If we have both (i.e. we have symmetry), default to vflip only
		assert(hasVFlip || hasVHFlip);
		return hasVFlip ? MatchType::VFLIP : MatchType::VHFLIP;
	}
	friend bool operator==(TileData const &lhs, TileData const &rhs) {
		return lhs.tryMatching(rhs) != MatchType::NOPE;
	}
};

template<>
struct std::hash<TileData> {
	std::size_t operator()(TileData const &tile) const { return tile.hash(); }
};

namespace unoptimized {

static void outputTileData(Png const &png, DefaultInitVec<AttrmapEntry> const &attrmap,
                           std::vector<Palette> const &palettes,
                           DefaultInitVec<size_t> const &mappings) {
	File output;
	if (!output.open(options.output, std::ios_base::out | std::ios_base::binary)) {
		fatal("Failed to open \"%s\": %s", output.c_str(options.output), strerror(errno));
	}

	uint64_t remainingTiles = (png.getWidth() / 8) * (png.getHeight() / 8);
	if (remainingTiles <= options.trim) {
		return;
	}
	remainingTiles -= options.trim;

	for (auto [tile, attr] : zip(png.visitAsTiles(), attrmap)) {
		// If the tile is fully transparent, default to palette 0
		Palette const &palette = palettes[attr.getPalID(mappings)];
		for (uint32_t y = 0; y < 8; ++y) {
			uint16_t bitplanes = TileData::rowBitplanes(tile, palette, y);
			output->sputc(bitplanes & 0xFF);
			if (options.bitDepth == 2) {
				output->sputc(bitplanes >> 8);
			}
		}

		--remainingTiles;
		if (remainingTiles == 0) {
			break;
		}
	}
	assert(remainingTiles == 0);
}

static void outputMaps(DefaultInitVec<AttrmapEntry> const &attrmap,
                       DefaultInitVec<size_t> const &mappings) {
	std::optional<File> tilemapOutput, attrmapOutput, palmapOutput;
	if (!options.tilemap.empty()) {
		tilemapOutput.emplace();
		if (!tilemapOutput->open(options.tilemap, std::ios_base::out | std::ios_base::binary)) {
			fatal("Failed to open \"%s\": %s", tilemapOutput->c_str(options.tilemap),
			      strerror(errno));
		}
	}
	if (!options.attrmap.empty()) {
		attrmapOutput.emplace();
		if (!attrmapOutput->open(options.attrmap, std::ios_base::out | std::ios_base::binary)) {
			fatal("Failed to open \"%s\": %s", attrmapOutput->c_str(options.attrmap),
			      strerror(errno));
		}
	}
	if (!options.palmap.empty()) {
		palmapOutput.emplace();
		if (!palmapOutput->open(options.palmap, std::ios_base::out | std::ios_base::binary)) {
			fatal("Failed to open \"%s\": %s", palmapOutput->c_str(options.palmap),
			      strerror(errno));
		}
	}

	uint8_t tileID = 0;
	uint8_t bank = 0;
	for (auto attr : attrmap) {
		if (tileID == options.maxNbTiles[bank]) {
			assert(bank == 0);
			bank = 1;
			tileID = 0;
		}

		if (tilemapOutput.has_value()) {
			(*tilemapOutput)->sputc(tileID + options.baseTileIDs[bank]);
		}
		if (attrmapOutput.has_value()) {
			uint8_t palID = attr.getPalID(mappings) & 7;
			(*attrmapOutput)->sputc(palID | bank << 3); // The other flags are all 0
		}
		if (palmapOutput.has_value()) {
			(*palmapOutput)->sputc(attr.getPalID(mappings));
		}
		++tileID;
	}
}

} // namespace unoptimized

namespace optimized {

struct UniqueTiles {
	std::unordered_set<TileData> tileset;
	std::vector<TileData const *> tiles;

	UniqueTiles() = default;
	// Copies are likely to break pointers, so we really don't want those.
	// Copy elision should be relied on to be more sure that refs won't be invalidated, too!
	UniqueTiles(UniqueTiles const &) = delete;
	UniqueTiles(UniqueTiles &&) = default;

	/*
	 * Adds a tile to the collection, and returns its ID
	 */
	std::tuple<uint16_t, TileData::MatchType> addTile(Png::TilesVisitor::Tile const &tile,
	                                                  Palette const &palette) {
		TileData newTile(tile, palette);
		auto [tileData, inserted] = tileset.insert(newTile);

		TileData::MatchType matchType = TileData::EXACT;
		if (inserted) {
			// Give the new tile the next available unique ID
			tileData->tileID = static_cast<uint16_t>(tiles.size());
			// Pointers are never invalidated!
			tiles.emplace_back(&*tileData);
		} else {
			matchType = tileData->tryMatching(newTile);
		}
		return {tileData->tileID, matchType};
	}

	auto size() const { return tiles.size(); }

	auto begin() const { return tiles.begin(); }
	auto end() const { return tiles.end(); }
};

/*
 * Generate tile data while deduplicating unique tiles (via mirroring if enabled)
 * Additionally, while we have the info handy, convert from the 16-bit "global" tile IDs to
 * 8-bit tile IDs + the bank bit; this will save the work when we output the data later (potentially
 * twice)
 */
static UniqueTiles dedupTiles(Png const &png, DefaultInitVec<AttrmapEntry> &attrmap,
                              std::vector<Palette> const &palettes,
                              DefaultInitVec<size_t> const &mappings) {
	// Iterate throughout the image, generating tile data as we go
	// (We don't need the full tile data to be able to dedup tiles, but we don't lose anything
	// by caching the full tile data anyway, so we might as well.)
	UniqueTiles tiles;

	for (auto [tile, attr] : zip(png.visitAsTiles(), attrmap)) {
		auto [tileID, matchType] = tiles.addTile(tile, palettes[mappings[attr.protoPaletteID]]);

		attr.xFlip = matchType == TileData::HFLIP || matchType == TileData::VHFLIP;
		attr.yFlip = matchType == TileData::VFLIP || matchType == TileData::VHFLIP;
		attr.bank = tileID >= options.maxNbTiles[0];
		attr.tileID =
		    (attr.bank ? tileID - options.maxNbTiles[0] : tileID) + options.baseTileIDs[attr.bank];
	}

	// Copy elision should prevent the contained `unordered_set` from being re-constructed
	return tiles;
}

static void outputTileData(UniqueTiles const &tiles) {
	File output;
	if (!output.open(options.output, std::ios_base::out | std::ios_base::binary)) {
		fatal("Failed to create \"%s\": %s", output.c_str(options.output), strerror(errno));
	}

	uint16_t tileID = 0;
	for (auto iter = tiles.begin(), end = tiles.end() - options.trim; iter != end; ++iter) {
		TileData const *tile = *iter;
		assert(tile->tileID == tileID);
		++tileID;
		output->sputn(reinterpret_cast<char const *>(tile->data().data()), options.bitDepth * 8);
	}
}

static void outputTilemap(DefaultInitVec<AttrmapEntry> const &attrmap) {
	File output;
	if (!output.open(options.tilemap, std::ios_base::out | std::ios_base::binary)) {
		fatal("Failed to create \"%s\": %s", output.c_str(options.tilemap), strerror(errno));
	}

	for (AttrmapEntry const &entry : attrmap) {
		output->sputc(entry.tileID); // The tile ID has already been converted
	}
}

static void outputAttrmap(DefaultInitVec<AttrmapEntry> const &attrmap,
                          DefaultInitVec<size_t> const &mappings) {
	File output;
	if (!output.open(options.attrmap, std::ios_base::out | std::ios_base::binary)) {
		fatal("Failed to create \"%s\": %s", output.c_str(options.attrmap), strerror(errno));
	}

	for (AttrmapEntry const &entry : attrmap) {
		uint8_t attr = entry.xFlip << 5 | entry.yFlip << 6;
		attr |= entry.bank << 3;
		attr |= entry.getPalID(mappings) & 7;
		output->sputc(attr);
	}
}

static void outputPalmap(DefaultInitVec<AttrmapEntry> const &attrmap,
                         DefaultInitVec<size_t> const &mappings) {
	File output;
	if (!output.open(options.attrmap, std::ios_base::out | std::ios_base::binary)) {
		fatal("Failed to create \"%s\": %s", output.c_str(options.attrmap), strerror(errno));
	}

	for (AttrmapEntry const &entry : attrmap) {
		output->sputc(entry.getPalID(mappings));
	}
}

} // namespace optimized

void process() {
	options.verbosePrint(Options::VERB_CFG, "Using libpng %s\n", png_get_libpng_ver(nullptr));

	options.verbosePrint(Options::VERB_LOG_ACT, "Reading tiles...\n");
	Png png(options.input); // This also sets `hasTransparentPixels` as a side effect
	ImagePalette const &colors = png.getColors();

	// Now, we have all the image's colors in `colors`
	// The next step is to order the palette

	if (options.verbosity >= Options::VERB_INTERM) {
		fputs("Image colors: [ ", stderr);
		for (auto const &slot : colors) {
			if (!slot.has_value()) {
				continue;
			}
			fprintf(stderr, "#%08x, ", slot->toCSS());
		}
		fputs("]\n", stderr);
	}

	// Now, iterate through the tiles, generating proto-palettes as we go
	// We do this unconditionally because this performs the image validation (which we want to
	// perform even if no output is requested), and because it's necessary to generate any
	// output (with the exception of an un-duplicated tilemap, but that's an acceptable loss.)
	std::vector<ProtoPalette> protoPalettes;
	DefaultInitVec<AttrmapEntry> attrmap{};

	for (auto tile : png.visitAsTiles()) {
		ProtoPalette tileColors;
		AttrmapEntry &attrs = attrmap.emplace_back();

		for (uint32_t y = 0; y < 8; ++y) {
			for (uint32_t x = 0; x < 8; ++x) {
				Rgba color = tile.pixel(x, y);
				if (!color.isTransparent()) { // Do not count transparency in for packing
					tileColors.add(color.cgbColor());
				}
			}
		}

		if (tileColors.empty()) {
			// "Empty" proto-palettes screw with the packing process, so discard those
			attrs.protoPaletteID = AttrmapEntry::transparent;
			continue;
		}

		// Insert the proto-palette, making sure to avoid overlaps
		for (size_t n = 0; n < protoPalettes.size(); ++n) {
			switch (tileColors.compare(protoPalettes[n])) {
			case ProtoPalette::WE_BIGGER:
				protoPalettes[n] = tileColors; // Override them
				// Remove any other proto-palettes that we encompass
				// (Example [(0, 1), (0, 2)], inserting (0, 1, 2))
				/*
				 * The following code does its job, except that references to the removed
				 * proto-palettes are not updated, causing issues.
				 * TODO: overlap might not be detrimental to the packing algorithm.
				 * Investigation is necessary, especially if pathological cases are found.
				 *
				 * for (size_t i = protoPalettes.size(); --i != n;) {
				 *     if (tileColors.compare(protoPalettes[i]) == ProtoPalette::WE_BIGGER) {
				 *         protoPalettes.erase(protoPalettes.begin() + i);
				 *     }
				 * }
				 */
				[[fallthrough]];

			case ProtoPalette::THEY_BIGGER:
				// Do nothing, they already contain us
				attrs.protoPaletteID = n;
				goto contained;

			case ProtoPalette::NEITHER:
				break; // Keep going
			}
		}

		if (tileColors.size() > options.maxOpaqueColors()) {
			fatal("Tile at (%" PRIu32 ", %" PRIu32 ") has %zu opaque colors, more than %" PRIu8 "!",
			      tile.x, tile.y, tileColors.size(), options.maxOpaqueColors());
		}

		attrs.protoPaletteID = protoPalettes.size();
		if (protoPalettes.size() == AttrmapEntry::transparent) { // Check for overflow
			fatal("Reached %zu proto-palettes... sorry, this image is too much for me to handle :(",
			      AttrmapEntry::transparent);
		}
		protoPalettes.push_back(tileColors);
contained:;
	}

	options.verbosePrint(Options::VERB_INTERM, "Image contains %zu proto-palette%s\n",
	                     protoPalettes.size(), protoPalettes.size() != 1 ? "s" : "");
	if (options.verbosity >= Options::VERB_INTERM) {
		for (auto const &protoPal : protoPalettes) {
			fputs("[ ", stderr);
			for (uint16_t color : protoPal) {
				fprintf(stderr, "$%04x, ", color);
			}
			fputs("]\n", stderr);
		}
	}

	auto [mappings, palettes] = options.palSpecType == Options::NO_SPEC
	                                ? generatePalettes(protoPalettes, png)
	                                : makePalsAsSpecified(protoPalettes, png);

	if (options.verbosity >= Options::VERB_INTERM) {
		for (auto &&palette : palettes) {
			fputs("{ ", stderr);
			for (uint16_t colorIndex : palette) {
				fprintf(stderr, "%04" PRIx16 ", ", colorIndex);
			}
			fputs("}\n", stderr);
		}
	}

	if (palettes.size() > options.nbPalettes) {
		// If the palette generation is wrong, other (dependee) operations are likely to be
		// nonsensical, so fatal-error outright
		fatal("Generated %zu palettes, over the maximum of %" PRIu8, palettes.size(),
		      options.nbPalettes);
	}

	if (!options.palettes.empty()) {
		outputPalettes(palettes);
	}

	// If deduplication is not happening, we just need to output the tile data and/or maps as-is
	if (!options.allowDedup) {
		uint32_t const nbTilesH = png.getHeight() / 8, nbTilesW = png.getWidth() / 8;

		// Check the tile count
		if (nbTilesW * nbTilesH > options.maxNbTiles[0] + options.maxNbTiles[1]) {
			fatal("Image contains %" PRIu32 " tiles, exceeding the limit of %" PRIu16 " + %" PRIu16,
			      nbTilesW * nbTilesH, options.maxNbTiles[0], options.maxNbTiles[1]);
		}

		if (!options.output.empty()) {
			options.verbosePrint(Options::VERB_LOG_ACT, "Generating unoptimized tile data...\n");
			unoptimized::outputTileData(png, attrmap, palettes, mappings);
		}

		if (!options.tilemap.empty() || !options.attrmap.empty() || !options.palmap.empty()) {
			options.verbosePrint(
			    Options::VERB_LOG_ACT,
			    "Generating unoptimized tilemap and/or attrmap and/or palmap...\n");
			unoptimized::outputMaps(attrmap, mappings);
		}
	} else {
		// All of these require the deduplication process to be performed to be output
		options.verbosePrint(Options::VERB_LOG_ACT, "Deduplicating tiles...\n");
		optimized::UniqueTiles tiles = optimized::dedupTiles(png, attrmap, palettes, mappings);

		if (tiles.size() > options.maxNbTiles[0] + options.maxNbTiles[1]) {
			fatal("Image contains %zu tiles, exceeding the limit of %" PRIu16 " + %" PRIu16,
			      tiles.size(), options.maxNbTiles[0], options.maxNbTiles[1]);
		}

		if (!options.output.empty()) {
			options.verbosePrint(Options::VERB_LOG_ACT, "Generating optimized tile data...\n");
			optimized::outputTileData(tiles);
		}

		if (!options.tilemap.empty()) {
			options.verbosePrint(Options::VERB_LOG_ACT, "Generating optimized tilemap...\n");
			optimized::outputTilemap(attrmap);
		}

		if (!options.attrmap.empty()) {
			options.verbosePrint(Options::VERB_LOG_ACT, "Generating optimized attrmap...\n");
			optimized::outputAttrmap(attrmap, mappings);
		}

		if (!options.palmap.empty()) {
			options.verbosePrint(Options::VERB_LOG_ACT, "Generating optimized palmap...\n");
			optimized::outputPalmap(attrmap, mappings);
		}
	}
}
