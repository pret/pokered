/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2022, Eldred Habert and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 *
 * Originally:
 * // This program is hereby released to the public domain.
 * // ~aaaaaa123456789, released 2022-03-15
 * https://gist.github.com/aaaaaa123456789/3feccf085ab4f82d144d9a47fb1b4bdf
 *
 * This was modified to use libpng instead of libplum, as well as comments and style changes.
 */

#include <assert.h>
#include <errno.h>
#include <limits.h>
#include <png.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "platform.h"

#define STR(x)  #x
#define XSTR(x) STR(x)

struct Attributes {
	unsigned char palette;
	unsigned char nbColors;
};

static unsigned long long randbits = 0;
static unsigned char randcount = 0;

static _Noreturn void fatal(char const *error) {
	fprintf(stderr, "FATAL: %s\n", error);
	exit(1);
}

static FILE *seed;

static unsigned long long getRandomBits(unsigned count) {
	while (count > randcount) {
		// Get new random bytes from stdin (assumed to be a stream of random data) to fulfill the
		// random bits request
		int data = getc(seed);
		if (data == EOF) {
			exit(0);
		}
		randbits |= (unsigned long long)data << randcount;
		randcount += 8;
	}
	unsigned long long result = randbits & ((1ull << count) - 1);
	randbits >>= count;
	randcount -= count;
	return result;
}

static void generate_tile_attributes(struct Attributes * restrict attributes) {
	/*
	 * Images have ten colors, grouped into two groups of 5 colors. The palette index indicates two
	 * things: which one of those groups will be used, and which colors out of those 5 will be used
	 * by the tile. The low bit indicates the group, and the rest of the value indicates the subset
	 * of colors. The remainder of the number is treated as a bitfield, where each bit represents a
	 * color: for instance, a value of 13 in the upper bits (binary 01101) indicates that colors 0,
	 * 2 and 3 from that group will be used. Values of 0 and 31 are naturally invalid because they
	 * indicate zero and five colors respectively, and 30 is also excluded to ensure that the
	 * particular subset of colors 1, 2, 3 and 4 never shows up. This guarantees that every tile
	 * will be representable using a palette containing color 0 (since those that don't contain
	 * color 0 will have three colors at most), which in turn ensures that only 4 palettes per group
	 * (and thus 8 total) are needed to cover the image: 0, 1, 2, 3; 0, 1, 2, 4; 0, 1, 3, 4; and 0,
	 * 2, 3, 4. This also implies that making color 0 transparent (in both groups) adds a
	 * transparent color to every palette.
	 */
	unsigned char pal;
	do {
		pal = getRandomBits(5);
	} while (pal == 0 || (pal > 29));
	attributes->palette = 2 * pal + getRandomBits(1);

	// Use an array to look up the number of colors in the palette; this is faster (and simpler)
	// than doing a population count over the bits
	static char const popcount[] = {0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3,
	                                4, 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4};
	attributes->nbColors = popcount[pal];
}

static void generate_tile_data(unsigned char tiledata[ARR_QUALS(restrict) MIN_NB_ELMS(8)][8],
                               unsigned colorcount) {
	switch (colorcount) {
	case 2: // 1bpp
		for (uint8_t y = 0; y < 8; y++) {
			for (uint8_t x = 0; x < 8; x++) {
				tiledata[y][x] = getRandomBits(1);
			}
		}
		break;

	case 4: // 2bpp
		for (uint8_t y = 0; y < 8; y++) {
			for (uint8_t x = 0; x < 8; x++) {
				tiledata[y][x] = getRandomBits(2);
			}
		}
		break;

	case 3: // 2bpp with resampling
		for (uint8_t y = 0; y < 8; y++) {
			for (uint8_t x = 0; x < 8; x++) {
				do {
					tiledata[y][x] = getRandomBits(2);
				} while (tiledata[y][x] == 3);
			}
		}
	}
}

// Can't mark as `const`, as the array type is otherwise not compatible (augh)
static void
    copy_tile_data(unsigned char destination[ARR_QUALS(restrict) MIN_NB_ELMS(8)][8],
                   unsigned char /* const */ source[ARR_QUALS(restrict) MIN_NB_ELMS(8)][8]) {
	// Apply a random rotation to the copy
	// coord ^ 7 = inverted coordinate; coord ^ 0 = regular coordinate
	unsigned xmask = getRandomBits(1) * 7;
	unsigned ymask = getRandomBits(1) * 7;
	for (unsigned y = 0; y < 8; y++) {
		for (unsigned x = 0; x < 8; x++) {
			destination[y][x] = source[y ^ ymask][x ^ xmask];
		}
	}
}

static void generate_palettes(uint16_t palettes[ARR_QUALS(restrict) MIN_NB_ELMS(60)][4]) {
	uint16_t colors[10];
	// Generate 10 random colors (two groups of 5 colors)
	for (unsigned p = 0; p < 10; p++) {
		colors[p] = getRandomBits(15);
	}
	// Potentially make the first color of each group transparent
	if (!getRandomBits(2)) {
		colors[0] |= 0x8000;
		colors[5] |= 0x8000;
	}

	for (unsigned p = 0; p < 60; p++) {
		uint16_t const *group = colors + 5 * (p & 1);
		uint16_t *palette = palettes[p];
		for (unsigned index = 0; index < 5; index++) {
			if (p & (2 << index)) {
				*(palette++) = group[index];
			}
		}
	}
}

/**
 * Expand a 5-bit color component to 8 bits with minimal bias
 */
static uint8_t _5to8(uint8_t five) {
	return five << 3 | five >> 2;
}

// Can't mark as `const`, as the array type is otherwise not compatible (augh)
static void write_image(char const *filename, uint16_t /* const */ palettes[MIN_NB_ELMS(60)][4],
                        unsigned char /* const */ (*tileData)[8][8],
                        struct Attributes const *attributes, uint8_t width, uint8_t height) {
	uint8_t const nbTiles = width * height;
	png_structp png = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
	png_infop pngInfo = png_create_info_struct(png);

	if (setjmp(png_jmpbuf(png))) {
		fprintf(stderr, "FATAL: An error occurred while writing image \"%s\"", filename);
		exit(1);
	}

	FILE *file = fopen(filename, "wb");
	if (file == NULL) {
		fprintf(stderr, "FATAL: Failed to open \"%s\": %s\n", filename, strerror(errno));
		exit(1);
	}
	png_init_io(png, file);

	png_set_IHDR(png, pngInfo, width * 8, height * 8, 8, PNG_COLOR_TYPE_RGB_ALPHA,
	             getRandomBits(1) ? PNG_INTERLACE_NONE : PNG_INTERLACE_ADAM7,
	             PNG_COMPRESSION_TYPE_DEFAULT, PNG_FILTER_TYPE_DEFAULT);

	// While it would be nice to write the image little by little, I really don't want to handle
	// interlacing myself. (We're doing interlacing to test that RGBGFX correctly handles it.)
	uint8_t const SIZEOF_PIXEL = 4; // Each pixel is 4 bytes (RGBA @ 8 bits/component)
	assert(width != 0);
	assert(height != 0);
	uint8_t *data = malloc(height * 8 * width * 8 * SIZEOF_PIXEL);
	uint8_t **rowPtrs = malloc(height * 8 * sizeof(*rowPtrs));
	if (data == NULL || rowPtrs == NULL) {
		fatal("Out of memory");
	}
	for (uint8_t y = 0; y < height * 8; ++y) {
		rowPtrs[y] = &data[y * width * 8 * SIZEOF_PIXEL];
	}

	for (uint8_t p = 0; p < nbTiles; p++) {
		uint8_t const tx = 8 * (p % width), ty = 8 * (p / width);
		for (uint8_t y = 0; y < 8; y++) {
			uint8_t * const row = rowPtrs[ty + y];
			for (uint8_t x = 0; x < 8; x++) {
				uint8_t * const pixel = &row[(tx + x) * SIZEOF_PIXEL];
				uint16_t const color = palettes[attributes[p].palette][tileData[p][y][x]];
				pixel[0] = _5to8(color & 0x1F);
				pixel[1] = _5to8(color >> 5 & 0x1F);
				pixel[2] = _5to8(color >> 10 & 0x1F);
				pixel[3] = color & 0x8000 ? 0x00 : 0xFF;
			}
		}
	}

	png_set_rows(png, pngInfo, rowPtrs);
	png_write_png(png, pngInfo, PNG_TRANSFORM_IDENTITY, NULL);
	fclose(file);
	free(rowPtrs);
	free(data);
	png_destroy_write_struct(&png, &pngInfo);
}

static void generate_random_image(char const *filename) {
#define MIN_TILES_PER_SIDE 3
#define MAX_TILES          ((MIN_TILES_PER_SIDE + 7) * (MIN_TILES_PER_SIDE + 7))
	struct Attributes attributes[MAX_TILES];
	unsigned char tileData[MAX_TILES][8][8];
	uint8_t width = getRandomBits(3) + MIN_TILES_PER_SIDE,
	        height = getRandomBits(3) + MIN_TILES_PER_SIDE;
	for (uint8_t tile = 0; tile < (width * height); tile++) {
		generate_tile_attributes(attributes + tile);
		// If a tile contains only one color, then there's no tile data to generate: all pixels will
		// use color 0
		if (attributes[tile].nbColors < 2) {
			memset(tileData[tile], 0, sizeof(tileData[tile]));
			continue;
		}

		// Find tiles with the same number of colors
		unsigned index = 0, total = 0;
		for (; index < tile; index++) {
			if (attributes[index].nbColors == attributes[tile].nbColors) {
				total++;
			}
		}
		assert(index == tile); // This is used as a sentinel later on to indicate no tile was found

		if (total) {
			// If there are such tiles, there's a random chance that this tile will replicate one of
			// those tiles (potentially rotated)
			index = getRandomBits(8);
			if (index < total) {
				total = index + 1;
				for (index = 0; total; index++) {
					if (attributes[index].nbColors == attributes[tile].nbColors) {
						total--;
					}
				}
				if (total == 0) {
					index--;
				}
			} else {
				index = tile; // Restore the sentinel
			}
		}

		if (index == tile) {
			generate_tile_data(tileData[tile], attributes[index].nbColors);
		} else {
			copy_tile_data(tileData[tile], tileData[index]);
		}
	}

	uint16_t palettes[60][4];
	generate_palettes(palettes);
	write_image(filename, palettes, tileData, attributes, width, height);
}

int main(int argc, char **argv) {
	if (argc < 3 || argc > 4) {
		fprintf(stderr, "usage: %s <input file> <basename> [<maxcount>]\n", argv[0]);
		return 2;
	}

	seed = fopen(argv[1], "rb");
	if (!seed) {
		fprintf(stderr, "FATAL: Cannot open seed file (%s)\n", strerror(errno));
		return 1;
	}

	size_t const nameLen = strlen(argv[2]);
	unsigned long long maxcount = ULLONG_MAX;
	if (argc > 3) {
		char *error;
		maxcount = strtoull(argv[3], &error, 0);
		if (*error != '\0') {
			fatal("invalid count");
		}
	}

	char *filename = malloc(nameLen + sizeof(XSTR(ULLONG_MAX) ".png"));
	if (!filename) {
		fatal("out of memory");
	}
	memcpy(filename, argv[2], nameLen);

	for (unsigned long long count = 0; count < maxcount; count++) {
		sprintf(&filename[nameLen], "%llu.png", count);
		generate_random_image(filename);
		// Reset the global random state so that subsequent images don't share a random byte
		randbits = 0;
		randcount = 0;
	}

	return 0;
}
