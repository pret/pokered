/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2019, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

// Declarations manipulating symbols
#ifndef RGBDS_LINK_SYMBOL_H
#define RGBDS_LINK_SYMBOL_H

// GUIDELINE: external code MUST NOT BE AWARE of the data structure used!

#include <stdint.h>

#include "linkdefs.h"

struct FileStackNode;

struct Symbol {
	// Info contained in the object files
	char *name;
	enum ExportLevel type;
	char const *objFileName;
	struct FileStackNode const *src;
	int32_t lineNo;
	int32_t sectionID;
	union {
		// Both types must be identical
		int32_t offset;
		int32_t value;
	};
	// Extra info computed during linking
	struct Section *section;
};

/*
 * Execute a callback for each symbol currently registered.
 * This is done to avoid exposing the data structure in which symbol are stored.
 * @param callback The function to call for each symbol;
 *                 the first argument will be a pointer to the symbol,
 *                 the second argument will be the pointer `arg`.
 * @param arg A pointer which will be passed to all calls to `callback`.
 */
void sym_ForEach(void (*callback)(struct Symbol *, void *), void *arg);

void sym_AddSymbol(struct Symbol *symbol);

/*
 * Finds a symbol in all the defined symbols.
 * @param name The name of the symbol to look for
 * @return A pointer to the symbol, or NULL if not found.
 */
struct Symbol *sym_GetSymbol(char const *name);

/*
 * `free`s all symbol memory that was allocated.
 */
void sym_CleanupSymbols(void);

#endif // RGBDS_LINK_SYMBOL_H
