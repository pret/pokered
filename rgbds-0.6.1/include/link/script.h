/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2019, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

// Parsing a linker script
#ifndef RGBDS_LINK_SCRIPT_H
#define RGBDS_LINK_SCRIPT_H

#include <stdint.h>
#include "linkdefs.h"

extern FILE * linkerScript;

struct SectionPlacement {
	struct Section *section;
        enum SectionType type;
	uint16_t org;
	uint32_t bank;
};

extern uint64_t script_lineNo;

/*
 * Parses the linker script to return the next section constraint
 * @return A pointer to a struct, or NULL on EOF. The pointer shouldn't be freed
 */
struct SectionPlacement *script_NextSection(void);

/*
 * `free`s all assignment memory that was allocated.
 */
void script_Cleanup(void);

#endif // RGBDS_LINK_SCRIPT_H
