/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2022, Eldred Habert and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#include "gfx/rgba.hpp"

#include <assert.h>
#include <stdint.h>

#include "gfx/main.hpp" // options

/*
 * based on the Gaussian-like curve used by SameBoy since commit
 * 65dd02cc52f531dbbd3a7e6014e99d5b24e71a4c (Oct 2017)
 * with ties resolved by comparing the difference of the squares.
 */
static std::array<uint8_t, 256> reverse_curve{
    0,  0,  1,  1,  2,  2,  3,  3,  3,  3,  4,  4,  4,  4,  4,  4, // These
    5,  5,  5,  5,  5,  5,  6,  6,  6,  6,  6,  6,  6,  6,  7,  7, // comments
    7,  7,  7,  7,  7,  7,  7,  8,  8,  8,  8,  8,  8,  8,  8,  8, // prevent
    9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  10, 10, 10, 10, 10, 10, // clang-format
    10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, // from
    12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 13, 13, 13, 13, // reflowing
    13, 13, 13, 13, 13, 13, 13, 13, 14, 14, 14, 14, 14, 14, 14, 14, // these
    14, 14, 14, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, // sixteen
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 17, 17, 17, // 16-item
    17, 17, 17, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18, 18, // lines,
    18, 18, 18, 18, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, // which,
    19, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 21, 21, 21, 21, // in
    21, 21, 21, 21, 21, 21, 21, 22, 22, 22, 22, 22, 22, 22, 22, 22, // my
    22, 23, 23, 23, 23, 23, 23, 23, 23, 23, 24, 24, 24, 24, 24, 24, // opinion,
    24, 24, 25, 25, 25, 25, 25, 25, 25, 25, 26, 26, 26, 26, 26, 26, // help
    26, 27, 27, 27, 27, 27, 28, 28, 28, 28, 29, 29, 29, 30, 30, 31, // visualization!
};

uint16_t Rgba::cgbColor() const {
	if (isTransparent()) {
		return transparent;
	}
	assert(isOpaque());

	uint8_t r = red, g = green, b = blue;
	if (options.useColorCurve) {
		g = g * 4 < b ? 0 : (g * 4 - b) / 3;
		r = reverse_curve[r];
		g = reverse_curve[g];
		b = reverse_curve[b];
	}
	return (r >> 3) | (g >> 3) << 5 | (b >> 3) << 10;
}

uint8_t Rgba::grayIndex() const {
	assert(isGray());
	// Convert from [0; 256[ to [0; maxOpaqueColors[
	return static_cast<uint16_t>(255 - red) * options.maxOpaqueColors() / 256;
}
