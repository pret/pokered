/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2019, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

// Declarations manipulating symbols
#ifndef RGBDS_LINK_SECTION_H
#define RGBDS_LINK_SECTION_H

// GUIDELINE: external code MUST NOT BE AWARE of the data structure used!

#include <stdint.h>
#include <stdbool.h>

#include "link/main.h"

#include "linkdefs.h"

struct FileStackNode;
struct Section;

struct AttachedSymbol {
	struct Symbol *symbol;
	struct AttachedSymbol *next;
};

struct Patch {
	struct FileStackNode const *src;
	uint32_t lineNo;
	uint32_t offset;
	uint32_t pcSectionID;
	uint32_t pcOffset;
	enum PatchType type;
	uint32_t rpnSize;
	uint8_t *rpnExpression;

	struct Section const *pcSection;
};

struct Section {
	// Info contained in the object files
	char *name;
	uint16_t size;
	uint16_t offset;
	enum SectionType type;
	enum SectionModifier modifier;
	bool isAddressFixed;
	// This `struct`'s address in ROM.
	// Importantly for fragments, this does not include `offset`!
	uint16_t org;
	bool isBankFixed;
	uint32_t bank;
	bool isAlignFixed;
	uint16_t alignMask;
	uint16_t alignOfs;
	uint8_t *data; // Array of size `size`
	uint32_t nbPatches;
	struct Patch *patches;
	// Extra info computed during linking
	struct Symbol **fileSymbols;
	uint32_t nbSymbols;
	struct Symbol **symbols;
	struct Section *nextu; // The next "component" of this unionized sect
};

/*
 * Execute a callback for each section currently registered.
 * This is to avoid exposing the data structure in which sections are stored.
 * @param callback The function to call for each structure;
 *                 the first argument will be a pointer to the structure,
 *                 the second argument will be the pointer `arg`.
 * @param arg A pointer which will be passed to all calls to `callback`.
 */
void sect_ForEach(void (*callback)(struct Section *, void *), void *arg);

/*
 * Registers a section to be processed.
 * @param section The section to register.
 */
void sect_AddSection(struct Section *section);

/*
 * Finds a section by its name.
 * @param name The name of the section to look for
 * @return A pointer to the section, or NULL if it wasn't found
 */
struct Section *sect_GetSection(char const *name);

/*
 * `free`s all section memory that was allocated.
 */
void sect_CleanupSections(void);

/*
 * Checks if all sections meet reasonable criteria, such as max size
 */
void sect_DoSanityChecks(void);

#endif // RGBDS_LINK_SECTION_H
