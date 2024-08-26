/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2019, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#ifndef RGBDS_UTIL_H
#define RGBDS_UTIL_H

#include <stdint.h>

char const *printChar(int c);

/*
 * @return The number of bytes read, or 0 if invalid data was found
 */
size_t readUTF8Char(uint8_t *dest, char const *src);

#endif // RGBDS_UTIL_H
