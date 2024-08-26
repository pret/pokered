/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2018, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#ifndef RGBDS_ASM_OUTPUT_H
#define RGBDS_ASM_OUTPUT_H

#include <stdint.h>

#include "linkdefs.h"

struct Expression;
struct FileStackNode;

extern char *objectName;
extern struct Section *sectionList;

void out_RegisterNode(struct FileStackNode *node);
void out_ReplaceNode(struct FileStackNode *node);
void out_SetFileName(char *s);
void out_CreatePatch(uint32_t type, struct Expression const *expr, uint32_t ofs, uint32_t pcShift);
bool out_CreateAssert(enum AssertionType type, struct Expression const *expr,
		      char const *message, uint32_t ofs);
void out_WriteObject(void);

#endif // RGBDS_ASM_OUTPUT_H
