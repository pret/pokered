/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2020, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#ifndef RGBDS_SECTION_H
#define RGBDS_SECTION_H

#include <stdint.h>
#include <stdbool.h>

#include "linkdefs.h"
#include "platform.h" // NONNULL

extern uint8_t fillByte;

struct Expression;

struct Section {
	char *name;
	enum SectionType type;
	enum SectionModifier modifier;
	struct FileStackNode *src; // Where the section was defined
	uint32_t fileLine; // Line where the section was defined
	uint32_t size;
	uint32_t org;
	uint32_t bank;
	uint8_t align; // Exactly as specified in `ALIGN[]`
	uint16_t alignOfs;
	struct Section *next;
	struct Patch *patches;
	uint8_t *data;
};

struct SectionSpec {
	uint32_t bank;
	uint8_t alignment;
	uint16_t alignOfs;
};

extern struct Section *currentSection;

struct Section *sect_FindSectionByName(char const *name);
void sect_NewSection(char const *name, uint32_t secttype, uint32_t org,
		     struct SectionSpec const *attributes, enum SectionModifier mod);
void sect_SetLoadSection(char const *name, uint32_t secttype, uint32_t org,
			 struct SectionSpec const *attributes, enum SectionModifier mod);
void sect_EndLoadSection(void);

struct Section *sect_GetSymbolSection(void);
uint32_t sect_GetSymbolOffset(void);
uint32_t sect_GetOutputOffset(void);
void sect_AlignPC(uint8_t alignment, uint16_t offset);

void sect_StartUnion(void);
void sect_NextUnionMember(void);
void sect_EndUnion(void);
void sect_CheckUnionClosed(void);

void sect_AbsByte(uint8_t b);
void sect_AbsByteGroup(uint8_t const *s, size_t length);
void sect_AbsWordGroup(uint8_t const *s, size_t length);
void sect_AbsLongGroup(uint8_t const *s, size_t length);
void sect_Skip(uint32_t skip, bool ds);
void sect_String(char const *s);
void sect_RelByte(struct Expression *expr, uint32_t pcShift);
void sect_RelBytes(uint32_t n, struct Expression *exprs, size_t size);
void sect_RelWord(struct Expression *expr, uint32_t pcShift);
void sect_RelLong(struct Expression *expr, uint32_t pcShift);
void sect_PCRelByte(struct Expression *expr, uint32_t pcShift);
void sect_BinaryFile(char const *s, int32_t startPos);
void sect_BinaryFileSlice(char const *s, int32_t start_pos, int32_t length);

void sect_PushSection(void);
void sect_PopSection(void);

bool sect_IsSizeKnown(struct Section const NONNULL(name));

#endif // RGBDS_SECTION_H
