/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2018, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#ifndef RGBDS_ASM_CHARMAP_H
#define RGBDS_ASM_CHARMAP_H

#include <stdint.h>

#define DEFAULT_CHARMAP_NAME "main"

struct Charmap *charmap_New(char const *name, char const *baseName);
void charmap_Delete(struct Charmap *charmap);
void charmap_Set(char const *name);
void charmap_Push(void);
void charmap_Pop(void);
void charmap_Add(char *mapping, uint8_t value);
size_t charmap_Convert(char const *input, uint8_t *output);
size_t charmap_ConvertNext(char const **input, uint8_t **output);

#endif // RGBDS_ASM_CHARMAP_H
