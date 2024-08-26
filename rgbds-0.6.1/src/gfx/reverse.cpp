/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2022, Eldred Habert and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#include "gfx/reverse.hpp"

#include <algorithm>
#include <array>
#include <assert.h>
#include <cinttypes>
#include <errno.h>
#include <fstream>
#include <optional>
#include <png.h>
#include <string.h>
#include <tuple>
#include <vector>

#include "defaultinitalloc.hpp"
#include "file.hpp"
#include "helpers.h"
#include "itertools.hpp"

#include "gfx/main.hpp"

static DefaultInitVec<uint8_t> readInto(std::string path) {
	File file;
	if (!file.open(path, std::ios::in | std::ios::binary)) {
		fatal("Failed to open \"%s\": %s", file.c_str(path), strerror(errno));
	}
	DefaultInitVec<uint8_t> data(128 * 16); // Begin with some room pre-allocated

	size_t curSize = 0;
	for (;;) {
		size_t oldSize = curSize;
		curSize = data.size();

		// Fill the new area ([oldSize; curSize[) with bytes
		size_t nbRead =
		    file->sgetn(reinterpret_cast<char *>(&data.data()[oldSize]), curSize - oldSize);
		if (nbRead != curSize - oldSize) {
			// Shrink the vector to discard bytes that weren't read
			data.resize(oldSize + nbRead);
			break;
		}
		// If the vector has some capacity left, use it; otherwise, double the current size

		// Arbitrary, but if you got a better idea...
		size_t newSize = oldSize != data.capacity() ? data.capacity() : oldSize * 2;
		assert(oldSize != newSize);
		data.resize(newSize);
	}

	return data;
}

[[noreturn]] static void pngError(png_structp png, char const *msg) {
	fatal("Error writing reversed image (\"%s\"): %s",
	      static_cast<char const *>(png_get_error_ptr(png)), msg);
}

static void pngWarning(png_structp png, char const *msg) {
	warning("While writing reversed image (\"%s\"): %s",
	        static_cast<char const *>(png_get_error_ptr(png)), msg);
}

void writePng(png_structp png, png_bytep data, size_t length) {
	auto &pngFile = *static_cast<File *>(png_get_io_ptr(png));
	pngFile->sputn(reinterpret_cast<char *>(data), length);
}

void flushPng(png_structp png) {
	auto &pngFile = *static_cast<File *>(png_get_io_ptr(png));
	pngFile->pubsync();
}

void reverse() {
	options.verbosePrint(Options::VERB_CFG, "Using libpng %s\n", png_get_libpng_ver(nullptr));

	// Check for weird flag combinations

	if (options.output.empty()) {
		fatal("Tile data must be provided when reversing an image!");
	}

	if (options.allowDedup && options.tilemap.empty()) {
		warning("Tile deduplication is enabled, but no tilemap is provided?");
	}

	if (options.useColorCurve) {
		warning("The color curve is not yet supported in reverse mode...");
	}

	if (options.inputSlice.left != 0 || options.inputSlice.top != 0
	    || options.inputSlice.height != 0) {
		warning("\"Sliced-off\" pixels are ignored in reverse mode");
	}
	if (options.inputSlice.width != 0 && options.inputSlice.width != options.reversedWidth * 8) {
		warning("Specified input slice width (%" PRIu16
		        ") doesn't match provided reversing width (%" PRIu8 " * 8)",
		        options.inputSlice.width, options.reversedWidth);
	}

	options.verbosePrint(Options::VERB_LOG_ACT, "Reading tiles...\n");
	auto const tiles = readInto(options.output);
	uint8_t tileSize = 8 * options.bitDepth;
	if (tiles.size() % tileSize != 0) {
		fatal("Tile data size must be a multiple of %" PRIu8 " bytes! (Read %zu)", tileSize,
		      tiles.size());
	}

	// By default, assume tiles are not deduplicated, and add the (allegedly) trimmed tiles
	size_t nbTileInstances = tiles.size() / tileSize + options.trim; // Image size in tiles
	options.verbosePrint(Options::VERB_INTERM, "Read %zu tiles.\n", nbTileInstances);
	std::optional<DefaultInitVec<uint8_t>> tilemap;
	if (!options.tilemap.empty()) {
		tilemap = readInto(options.tilemap);
		nbTileInstances = tilemap->size();
		options.verbosePrint(Options::VERB_INTERM, "Read %zu tilemap entries.\n", nbTileInstances);
	}

	if (nbTileInstances == 0) {
		fatal("Cannot generate empty image");
	}
	if (nbTileInstances > options.maxNbTiles[0] + options.maxNbTiles[1]) {
		warning("Read %zu tiles, more than the limit of %zu + %zu", nbTileInstances,
		        options.maxNbTiles[0], options.maxNbTiles[1]);
	}

	size_t width = options.reversedWidth, height; // In tiles
	if (nbTileInstances % width != 0) {
		fatal("Total number of tiles read (%zu) cannot be divided by image width (%zu tiles)",
		      nbTileInstances, width);
	}
	height = nbTileInstances / width;

	options.verbosePrint(Options::VERB_INTERM, "Reversed image dimensions: %zux%zu tiles\n", width,
	                     height);

	// TODO: -U

	std::vector<std::array<Rgba, 4>> palettes{
	    {Rgba(0xffffffff), Rgba(0xaaaaaaff), Rgba(0x555555ff), Rgba(0x000000ff)}
    };
	if (!options.palettes.empty()) {
		File file;
		if (!file.open(options.palettes, std::ios::in | std::ios::binary)) {
			fatal("Failed to open \"%s\": %s", file.c_str(options.palettes), strerror(errno));
		}

		palettes.clear();
		std::array<uint8_t, sizeof(uint16_t) * 4> buf; // 4 colors
		size_t nbRead;
		do {
			nbRead = file->sgetn(reinterpret_cast<char *>(buf.data()), buf.size());
			if (nbRead == buf.size()) {
				// Expand the colors
				auto &palette = palettes.emplace_back();
				std::generate(palette.begin(), palette.begin() + options.nbColorsPerPal,
				              [&buf, i = 0]() mutable {
					              i += 2;
					              return Rgba::fromCGBColor(buf[i - 2] + (buf[i - 1] << 8));
				              });
			} else if (nbRead != 0) {
				fatal("Palette data size (%zu) is not a multiple of %zu bytes!\n",
				      palettes.size() * buf.size() + nbRead, buf.size());
			}
		} while (nbRead != 0);

		if (palettes.size() > options.nbPalettes) {
			warning("Read %zu palettes, more than the specified limit of %zu", palettes.size(),
			        options.nbPalettes);
		}
	}

	std::optional<DefaultInitVec<uint8_t>> attrmap;
	if (!options.attrmap.empty()) {
		attrmap = readInto(options.attrmap);
		if (attrmap->size() != nbTileInstances) {
			fatal("Attribute map size (%zu tiles) doesn't match image's (%zu)", attrmap->size(),
			      nbTileInstances);
		}

		// Scan through the attributes for inconsistencies
		// We do this now for two reasons:
		// 1. Checking those during the main loop is harmful to optimization, and
		// 2. It clutters the code more, and it's not in great shape to begin with
		bool bad = false;
		for (auto attr : *attrmap) {
			if ((attr & 0b111) > palettes.size()) {
				error("Referencing palette %u, but there are only %zu!");
				bad = true;
			}
			if (attr & 0x08 && !tilemap) {
				warning("Tile in bank 1 but no tilemap specified; ignoring the bank bit");
			}
		}
		if (bad) {
			giveUp();
		}
	}

	if (tilemap) {
		if (attrmap) {
			for (auto [id, attr] : zip(*tilemap, *attrmap)) {
				bool bank = attr & 1 << 3;
				if (id >= options.maxNbTiles[bank]) {
					warning("Tile #%" PRIu8
					        " was referenced, but the limit for bank %u is %" PRIu16,
					        id, bank, options.maxNbTiles[bank]);
				}
			}
		} else {
			for (auto id : *tilemap) {
				if (id >= options.maxNbTiles[0]) {
					warning("Tile #%" PRIu8 " was referenced, but the limit is %" PRIu16, id,
					        options.maxNbTiles[0]);
				}
			}
		}
	}

	std::optional<DefaultInitVec<uint8_t>> palmap;
	if (!options.palmap.empty()) {
		palmap = readInto(options.palmap);
		if (palmap->size() != nbTileInstances) {
			fatal("Palette map size (%zu tiles) doesn't match image's (%zu)", palmap->size(),
			      nbTileInstances);
		}
	}

	options.verbosePrint(Options::VERB_LOG_ACT, "Writing image...\n");
	File pngFile;
	if (!pngFile.open(options.input, std::ios::out | std::ios::binary)) {
		fatal("Failed to create \"%s\": %s", pngFile.c_str(options.input), strerror(errno));
	}
	png_structp png = png_create_write_struct(
	    PNG_LIBPNG_VER_STRING,
	    const_cast<png_voidp>(static_cast<void const *>(pngFile.c_str(options.input))), pngError,
	    pngWarning);
	if (!png) {
		fatal("Couldn't create PNG write struct: %s", strerror(errno));
	}
	png_infop pngInfo = png_create_info_struct(png);
	if (!pngInfo) {
		fatal("Couldn't create PNG info struct: %s", strerror(errno));
	}
	png_set_write_fn(png, &pngFile, writePng, flushPng);

	png_set_IHDR(png, pngInfo, options.reversedWidth * 8, height * 8, 8, PNG_COLOR_TYPE_RGB_ALPHA,
	             PNG_INTERLACE_NONE, PNG_COMPRESSION_TYPE_DEFAULT, PNG_FILTER_TYPE_DEFAULT);
	png_write_info(png, pngInfo);

	png_color_8 sbitChunk;
	sbitChunk.red = 5;
	sbitChunk.green = 5;
	sbitChunk.blue = 5;
	sbitChunk.alpha = 1;
	png_set_sBIT(png, pngInfo, &sbitChunk);

	constexpr uint8_t SIZEOF_PIXEL = 4; // Each pixel is 4 bytes (RGBA @ 8 bits/component)
	size_t const SIZEOF_ROW = options.reversedWidth * 8 * SIZEOF_PIXEL;
	std::vector<uint8_t> tileRow(8 * SIZEOF_ROW, 0xFF); // Data for 8 rows of pixels
	uint8_t * const rowPtrs[8] = {
	    &tileRow.data()[0 * SIZEOF_ROW], &tileRow.data()[1 * SIZEOF_ROW],
	    &tileRow.data()[2 * SIZEOF_ROW], &tileRow.data()[3 * SIZEOF_ROW],
	    &tileRow.data()[4 * SIZEOF_ROW], &tileRow.data()[5 * SIZEOF_ROW],
	    &tileRow.data()[6 * SIZEOF_ROW], &tileRow.data()[7 * SIZEOF_ROW],
	};

	for (size_t ty = 0; ty < height; ++ty) {
		for (size_t tx = 0; tx < width; ++tx) {
			size_t index = options.columnMajor ? ty + tx * width : ty * width + tx;
			// By default, a tile is unflipped, in bank 0, and uses palette #0
			uint8_t attribute = attrmap.has_value() ? (*attrmap)[index] : 0x00;
			bool bank = attribute & 0x08;
			// Get the tile ID at this location
			size_t tileID = index;
			if (tilemap.has_value()) {
				tileID =
				    (*tilemap)[index] - options.baseTileIDs[bank] + bank * options.maxNbTiles[0];
			}
			assert(tileID < nbTileInstances); // Should have been checked earlier
			size_t palID = palmap ? (*palmap)[index] : attribute & 0b111;
			assert(palID < palettes.size()); // Should be ensured on data read

			// We do not have data for tiles trimmed with `-x`, so assume they are "blank"
			static std::array<uint8_t, 16> const trimmedTile{
			    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
			    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
			};
			uint8_t const *tileData = tileID > nbTileInstances - options.trim
			                              ? trimmedTile.data()
			                              : &tiles[tileID * tileSize];
			auto const &palette = palettes[palID];
			for (uint8_t y = 0; y < 8; ++y) {
				// If vertically mirrored, fetch the bytes from the other end
				uint8_t realY = attribute & 0x40 ? 7 - y : y;
				uint8_t bitplane0 = tileData[realY * 2], bitplane1 = tileData[realY * 2 + 1];
				if (attribute & 0x20) { // Handle horizontal flip
					bitplane0 = flipTable[bitplane0];
					bitplane1 = flipTable[bitplane1];
				}
				uint8_t *ptr = &rowPtrs[y][tx * 8 * SIZEOF_PIXEL];
				for (uint8_t x = 0; x < 8; ++x) {
					uint8_t bit0 = bitplane0 & 0x80, bit1 = bitplane1 & 0x80;
					Rgba const &pixel = palette[bit0 >> 7 | bit1 >> 6];
					*ptr++ = pixel.red;
					*ptr++ = pixel.green;
					*ptr++ = pixel.blue;
					*ptr++ = pixel.alpha;

					// Shift the pixel out
					bitplane0 <<= 1;
					bitplane1 <<= 1;
				}
			}
		}
		// We never modify the pointers, and neither should libpng, despite the overly lax function
		// signature.
		// (AIUI, casting away const-ness is okay as long as you don't actually modify the
		// pointed-to data)
		png_write_rows(png, const_cast<png_bytepp>(rowPtrs), 8);
	}

	// Finalize the write
	png_write_end(png, pngInfo);

	png_destroy_write_struct(&png, &pngInfo);
	pngFile.close();
}
