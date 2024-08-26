/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2021, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

// Fixed-point math routines

#include <inttypes.h>
#include <math.h>
#include <stdint.h>

#include "asm/fixpoint.h"
#include "asm/symbol.h"
#include "asm/warning.h"

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

#define fix2double(i, q)	((double)((i) / pow(2.0, q)))
#define double2fix(d, q)	((int32_t)round((d) * pow(2.0, q)))

// 2*pi radians == 1 turn
#define turn2rad(f)	((f) * (M_PI * 2))
#define rad2turn(r)	((r) / (M_PI * 2))

uint8_t fixPrecision;

uint8_t fix_Precision(void)
{
	return fixPrecision;
}

double fix_PrecisionFactor(void)
{
	return pow(2.0, fixPrecision);
}

int32_t fix_Sin(int32_t i, int32_t q)
{
	return double2fix(sin(turn2rad(fix2double(i, q))), q);
}

int32_t fix_Cos(int32_t i, int32_t q)
{
	return double2fix(cos(turn2rad(fix2double(i, q))), q);
}

int32_t fix_Tan(int32_t i, int32_t q)
{
	return double2fix(tan(turn2rad(fix2double(i, q))), q);
}

int32_t fix_ASin(int32_t i, int32_t q)
{
	return double2fix(rad2turn(asin(fix2double(i, q))), q);
}

int32_t fix_ACos(int32_t i, int32_t q)
{
	return double2fix(rad2turn(acos(fix2double(i, q))), q);
}

int32_t fix_ATan(int32_t i, int32_t q)
{
	return double2fix(rad2turn(atan(fix2double(i, q))), q);
}

int32_t fix_ATan2(int32_t i, int32_t j, int32_t q)
{
	return double2fix(rad2turn(atan2(fix2double(i, q), fix2double(j, q))), q);
}

int32_t fix_Mul(int32_t i, int32_t j, int32_t q)
{
	return double2fix(fix2double(i, q) * fix2double(j, q), q);
}

int32_t fix_Div(int32_t i, int32_t j, int32_t q)
{
	return double2fix(fix2double(i, q) / fix2double(j, q), q);
}

int32_t fix_Mod(int32_t i, int32_t j, int32_t q)
{
	return double2fix(fmod(fix2double(i, q), fix2double(j, q)), q);
}

int32_t fix_Pow(int32_t i, int32_t j, int32_t q)
{
	return double2fix(pow(fix2double(i, q), fix2double(j, q)), q);
}

int32_t fix_Log(int32_t i, int32_t j, int32_t q)
{
	return double2fix(log(fix2double(i, q)) / log(fix2double(j, q)), q);
}

int32_t fix_Round(int32_t i, int32_t q)
{
	return double2fix(round(fix2double(i, q)), q);
}

int32_t fix_Ceil(int32_t i, int32_t q)
{
	return double2fix(ceil(fix2double(i, q)), q);
}

int32_t fix_Floor(int32_t i, int32_t q)
{
	return double2fix(floor(fix2double(i, q)), q);
}
