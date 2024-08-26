/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2022, Eldred Habert and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#ifndef RGBDS_GFX_MAIN_HPP
#define RGBDS_GFX_MAIN_HPP

#include <array>
#include <limits.h>
#include <stdint.h>
#include <string>
#include <utility>
#include <vector>

#include "helpers.h"

#include "gfx/rgba.hpp"

struct Options {
	uint16_t reversedWidth = 0; // -r, in tiles
	bool reverse() const { return reversedWidth != 0; }

	bool useColorCurve = false; // -C
	bool allowMirroring = false; // -m
	bool allowDedup = false; // -u
	bool columnMajor = false; // -Z, previously -h
	uint8_t verbosity = 0; // -v

	std::string attrmap{}; // -a, -A
	std::array<uint8_t, 2> baseTileIDs{0, 0}; // -b
	enum {
		NO_SPEC,
		EXPLICIT,
		EMBEDDED,
	} palSpecType = NO_SPEC; // -c
	std::vector<std::array<Rgba, 4>> palSpec{};
	uint8_t bitDepth = 2; // -d
	struct {
		uint16_t left;
		uint16_t top;
		uint16_t width;
		uint16_t height;
	} inputSlice{0, 0, 0, 0}; // -L (margins in clockwise order, like CSS)
	std::array<uint16_t, 2> maxNbTiles{UINT16_MAX, 0}; // -N
	uint8_t nbPalettes = 8; // -n
	std::string output{}; // -o
	std::string palettes{}; // -p, -P
	std::string palmap{}; // -q, -Q
	uint8_t nbColorsPerPal = 0; // -s; 0 means "auto" = 1 << bitDepth;
	std::string tilemap{}; // -t, -T
	uint64_t trim = 0; // -x

	std::string input{}; // positional arg

	static constexpr uint8_t VERB_NONE = 0; // Normal, no extra output
	static constexpr uint8_t VERB_CFG = 1; // Print configuration after parsing options
	static constexpr uint8_t VERB_LOG_ACT = 2; // Log actions before doing them
	static constexpr uint8_t VERB_INTERM = 3; // Print some intermediate results
	static constexpr uint8_t VERB_DEBUG = 4; // Internals are logged
	static constexpr uint8_t VERB_UNMAPPED = 5; // Unused so far
	static constexpr uint8_t VERB_VVVVVV = 6; // What, can't I have a little fun?
	format_(printf, 3, 4) void verbosePrint(uint8_t level, char const *fmt, ...) const;

	mutable bool hasTransparentPixels = false;
	uint8_t maxOpaqueColors() const { return nbColorsPerPal - hasTransparentPixels; }
};

extern Options options;

/*
 * Prints the error count, and exits with failure
 */
[[noreturn]] void giveUp();
/*
 * Prints a warning, and does not change the error count
 */
void warning(char const *fmt, ...);
/*
 * Prints an error, and increments the error count
 */
void error(char const *fmt, ...);
/*
 * Prints a fatal error, increments the error count, and gives up
 */
[[noreturn]] void fatal(char const *fmt, ...);

struct Palette {
	// An array of 4 GBC-native (RGB555) colors
	std::array<uint16_t, 4> colors{UINT16_MAX, UINT16_MAX, UINT16_MAX, UINT16_MAX};

	void addColor(uint16_t color);
	uint8_t indexOf(uint16_t color) const;
	uint16_t &operator[](size_t index) { return colors[index]; }
	uint16_t const &operator[](size_t index) const { return colors[index]; }

	decltype(colors)::iterator begin();
	decltype(colors)::iterator end();
	decltype(colors)::const_iterator begin() const;
	decltype(colors)::const_iterator end() const;

	uint8_t size() const;
};

namespace detail {
template<typename T, T... i>
static constexpr auto flipTable(std::integer_sequence<T, i...>) {
	return std::array{[](uint8_t byte) {
		// To flip all the bits, we'll flip both nibbles, then each nibble half, etc.
		byte = (byte & 0b0000'1111) << 4 | (byte & 0b1111'0000) >> 4;
		byte = (byte & 0b0011'0011) << 2 | (byte & 0b1100'1100) >> 2;
		byte = (byte & 0b0101'0101) << 1 | (byte & 0b1010'1010) >> 1;
		return byte;
	}(i)...};
}
}
// Flipping tends to happen fairly often, so take a bite out of dcache to speed it up
static constexpr auto flipTable = detail::flipTable(std::make_integer_sequence<uint16_t, 256>());

#endif // RGBDS_GFX_MAIN_HPP
