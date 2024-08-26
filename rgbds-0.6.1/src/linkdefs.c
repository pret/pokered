/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2022, RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#include "linkdefs.h"

// The default values are the most lax, as they are used as-is by RGBASM; only RGBLINK has the full info,
// so RGBASM's job is only to catch unconditional errors earlier.
struct SectionTypeInfo sectionTypeInfo[SECTTYPE_INVALID] = {
	[SECTTYPE_ROM0] = {
		.name = "ROM0",
		.startAddr = 0x0000,
		.size = 0x8000, // Patched to 0x4000 if !is32kMode
		.firstBank = 0,
		.lastBank = 0,
	},
	[SECTTYPE_ROMX]  = {
		.name = "ROMX",
		.startAddr = 0x4000,
		.size = 0x4000,
		.firstBank = 1,
		.lastBank = 65535,
	},
	[SECTTYPE_VRAM]  = {
		.name = "VRAM",
		.startAddr = 0x8000,
		.size = 0x2000,
		.firstBank = 0,
		.lastBank = 1, // Patched to 0 if isDmgMode
	},
	[SECTTYPE_SRAM]  = {
		.name = "SRAM",
		.startAddr = 0xA000,
		.size = 0x2000,
		.firstBank = 0,
		.lastBank = 255,
	},
	[SECTTYPE_WRAM0] = {
		.name = "WRAM0",
		.startAddr = 0xC000,
		.size = 0x2000, // Patched to 0x1000 if !isWRA0Mode
		.firstBank = 0,
		.lastBank = 0,
	},
	[SECTTYPE_WRAMX] = {
		.name = "WRAMX",
		.startAddr = 0xD000,
		.size = 0x1000,
		.firstBank = 1,
		.lastBank = 7,
	},
	[SECTTYPE_OAM]   = {
		.name = "OAM",
		.startAddr = 0xFE00,
		.size = 0x00A0,
		.firstBank = 0,
		.lastBank = 0,
	},
	[SECTTYPE_HRAM]  = {
		.name = "HRAM",
		.startAddr = 0xFF80,
		.size = 0x007F,
		.firstBank = 0,
		.lastBank = 0,
	},
};

char const * const sectionModNames[] = {
	[SECTION_NORMAL]   = "regular",
	[SECTION_UNION]    = "union",
	[SECTION_FRAGMENT] = "fragment",
};
