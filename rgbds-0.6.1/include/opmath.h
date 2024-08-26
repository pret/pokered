/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2021, RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#ifndef RGBDS_OP_MATH_H
#define RGBDS_OP_MATH_H

#include <stdint.h>

int32_t op_divide(int32_t dividend, int32_t divisor);
int32_t op_modulo(int32_t dividend, int32_t divisor);
int32_t op_exponent(int32_t base, uint32_t power);
int32_t op_shift_left(int32_t value, int32_t amount);
int32_t op_shift_right(int32_t value, int32_t amount);
int32_t op_shift_right_unsigned(int32_t value, int32_t amount);

#endif // RGBDS_OP_MATH_H
