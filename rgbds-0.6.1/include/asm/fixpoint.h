/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2021, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#ifndef RGBDS_ASM_FIXPOINT_H
#define RGBDS_ASM_FIXPOINT_H

#include <stdint.h>

extern uint8_t fixPrecision;

uint8_t fix_Precision(void);
double fix_PrecisionFactor(void);
int32_t fix_Sin(int32_t i, int32_t q);
int32_t fix_Cos(int32_t i, int32_t q);
int32_t fix_Tan(int32_t i, int32_t q);
int32_t fix_ASin(int32_t i, int32_t q);
int32_t fix_ACos(int32_t i, int32_t q);
int32_t fix_ATan(int32_t i, int32_t q);
int32_t fix_ATan2(int32_t i, int32_t j, int32_t q);
int32_t fix_Mul(int32_t i, int32_t j, int32_t q);
int32_t fix_Mod(int32_t i, int32_t j, int32_t q);
int32_t fix_Div(int32_t i, int32_t j, int32_t q);
int32_t fix_Pow(int32_t i, int32_t j, int32_t q);
int32_t fix_Log(int32_t i, int32_t j, int32_t q);
int32_t fix_Round(int32_t i, int32_t q);
int32_t fix_Ceil(int32_t i, int32_t q);
int32_t fix_Floor(int32_t i, int32_t q);

#endif // RGBDS_ASM_FIXPOINT_H
