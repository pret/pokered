/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2022, Eldred Habert and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#include "gfx/proto_palette.hpp"

#include <algorithm>
#include <array>
#include <cassert>
#include <stddef.h>
#include <stdint.h>

bool ProtoPalette::add(uint16_t color) {
	size_t i = 0;

	// Seek the first slot greater than our color
	// (A linear search is better because we don't store the array size,
	// and there are very few slots anyway)
	while (_colorIndices[i] < color) {
		++i;
		if (i == _colorIndices.size())
			return false;
	}
	// If we found ourselves, great!
	if (_colorIndices[i] == color)
		return true;

	// Swap entries until the end
	while (_colorIndices[i] != UINT16_MAX) {
		std::swap(_colorIndices[i], color);
		++i;
		if (i == _colorIndices.size())
			return false; // Oh well
	}
	// Write that last one into the new slot
	_colorIndices[i] = color;
	return true;
}

ProtoPalette::ComparisonResult ProtoPalette::compare(ProtoPalette const &other) const {
	// This works because the sets are sorted numerically
	assert(std::is_sorted(_colorIndices.begin(), _colorIndices.end()));
	assert(std::is_sorted(other._colorIndices.begin(), other._colorIndices.end()));

	auto ours = _colorIndices.begin(), theirs = other._colorIndices.begin();
	bool weBigger = true, theyBigger = true;

	while (ours != _colorIndices.end() && theirs != other._colorIndices.end()) {
		if (*ours == *theirs) {
			++ours;
			++theirs;
		} else if (*ours < *theirs) {
			++ours;
			theyBigger = false;
		} else { // *ours > *theirs
			++theirs;
			weBigger = false;
		}
	}
	weBigger &= theirs == other._colorIndices.end();
	theyBigger &= ours == _colorIndices.end();

	return theyBigger ? THEY_BIGGER : (weBigger ? WE_BIGGER : NEITHER);
}

size_t ProtoPalette::size() const {
	return std::distance(begin(), end());
}

bool ProtoPalette::empty() const {
	return _colorIndices[0] == UINT16_MAX;
}

auto ProtoPalette::begin() const -> decltype(_colorIndices)::const_iterator {
	return _colorIndices.begin();
}
auto ProtoPalette::end() const -> decltype(_colorIndices)::const_iterator {
	return std::find(_colorIndices.begin(), _colorIndices.end(), UINT16_MAX);
}
