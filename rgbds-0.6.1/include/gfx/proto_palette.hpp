/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2022, Eldred Habert and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#ifndef RGBDS_GFX_PROTO_PALETTE_HPP
#define RGBDS_GFX_PROTO_PALETTE_HPP

#include <algorithm>
#include <array>
#include <stddef.h>
#include <stdint.h>

class ProtoPalette {
	// Up to 4 colors, sorted, and where SIZE_MAX means the slot is empty
	// (OK because it's not a valid color index)
	// Sorting is done on the raw numerical values to lessen `compare`'s complexity
	std::array<uint16_t, 4> _colorIndices{UINT16_MAX, UINT16_MAX, UINT16_MAX, UINT16_MAX};

public:
	/*
	 * Adds the specified color to the set
	 * Returns false if the set is full
	 */
	bool add(uint16_t color);

	enum ComparisonResult {
		NEITHER,
		WE_BIGGER,
		THEY_BIGGER = -1,
	};
	ComparisonResult compare(ProtoPalette const &other) const;

	size_t size() const;
	bool empty() const;

	decltype(_colorIndices)::const_iterator begin() const;
	decltype(_colorIndices)::const_iterator end() const;
};

#endif // RGBDS_GFX_PROTO_PALETTE_HPP
