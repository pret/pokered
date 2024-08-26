/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2019, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

// Applying patches to SECTIONs
#ifndef RGBDS_LINK_PATCH_H
#define RGBDS_LINK_PATCH_H

#include <stdbool.h>
#include <stdint.h>

#include "link/section.h"

#include "linkdefs.h"

struct Assertion {
	struct Patch patch;
	// enum AssertionType type; The `patch`'s field is instead re-used
	char *message;
	// This would be redundant with `.section->fileSymbols`... but `section` is sometimes NULL!
	struct Symbol **fileSymbols;

	struct Assertion *next;
};

/*
 * Checks all assertions
 * @return true if assertion failed
 */
void patch_CheckAssertions(struct Assertion *assertion);

/*
 * Applies all SECTIONs' patches to them
 */
void patch_ApplyPatches(void);

#endif // RGBDS_LINK_PATCH_H
