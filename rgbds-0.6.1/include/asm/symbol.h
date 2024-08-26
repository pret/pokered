/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2020, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#ifndef RGBDS_SYMBOL_H
#define RGBDS_SYMBOL_H

#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <time.h>

#include "asm/section.h"

#include "platform.h" // MIN_NB_ELMS

#define MAXSYMLEN	255

enum SymbolType {
	SYM_LABEL,
	SYM_EQU,
	SYM_VAR,
	SYM_MACRO,
	SYM_EQUS,
	SYM_REF // Forward reference to a label
};

struct Symbol {
	char name[MAXSYMLEN + 1];
	enum SymbolType type;
	bool isExported; // Whether the symbol is to be exported
	bool isBuiltin;  // Whether the symbol is a built-in
	struct Section *section;
	struct FileStackNode *src; // Where the symbol was defined
	uint32_t fileLine; // Line where the symbol was defined

	bool hasCallback;
	union {
		// If sym_IsNumeric
		int32_t value;
		int32_t (*numCallback)(void);
		// For SYM_MACRO and SYM_EQUS; TODO: have separate fields
		struct {
			size_t macroSize;
			char *macro;
		};
		// For SYM_EQUS
		char const *(*strCallback)(void);
	};

	uint32_t ID; // ID of the symbol in the object file (-1 if none)
	struct Symbol *next; // Next object to output in the object file
};

bool sym_IsPC(struct Symbol const *sym);

static inline bool sym_IsDefined(struct Symbol const *sym)
{
	return sym->type != SYM_REF;
}

static inline struct Section *sym_GetSection(struct Symbol const *sym)
{
	return sym_IsPC(sym) ? sect_GetSymbolSection() : sym->section;
}

static inline bool sym_IsConstant(struct Symbol const *sym)
{
	if (sym->type == SYM_LABEL) {
		struct Section const *sect = sym_GetSection(sym);

		return sect && sect->org != (uint32_t)-1;
	}
	return sym->type == SYM_EQU || sym->type == SYM_VAR;
}

static inline bool sym_IsNumeric(struct Symbol const *sym)
{
	return sym->type == SYM_LABEL || sym->type == SYM_EQU || sym->type == SYM_VAR;
}

static inline bool sym_IsLabel(struct Symbol const *sym)
{
	return sym->type == SYM_LABEL || sym->type == SYM_REF;
}

static inline bool sym_IsLocal(struct Symbol const *sym)
{
	return sym_IsLabel(sym) && strchr(sym->name, '.');
}

static inline bool sym_IsExported(struct Symbol const *sym)
{
	return sym->isExported;
}

// Get a string equate's value
static inline char const *sym_GetStringValue(struct Symbol const *sym)
{
	if (sym->hasCallback)
		return sym->strCallback();
	return sym->macro;
}

void sym_ForEach(void (*func)(struct Symbol *, void *), void *arg);

int32_t sym_GetValue(struct Symbol const *sym);
void sym_SetExportAll(bool set);
struct Symbol *sym_AddLocalLabel(char const *symName);
struct Symbol *sym_AddLabel(char const *symName);
struct Symbol *sym_AddAnonLabel(void);
void sym_WriteAnonLabelName(char buf[MIN_NB_ELMS(MAXSYMLEN + 1)], uint32_t ofs, bool neg);
void sym_Export(char const *symName);
struct Symbol *sym_AddEqu(char const *symName, int32_t value);
struct Symbol *sym_RedefEqu(char const *symName, int32_t value);
struct Symbol *sym_AddVar(char const *symName, int32_t value);
uint32_t sym_GetPCValue(void);
uint32_t sym_GetConstantSymValue(struct Symbol const *sym);
uint32_t sym_GetConstantValue(char const *symName);
// Find a symbol by exact name, bypassing expansion checks
struct Symbol *sym_FindExactSymbol(char const *symName);
// Find a symbol by exact name; may not be scoped, produces an error if it is
struct Symbol *sym_FindUnscopedSymbol(char const *symName);
// Find a symbol, possibly scoped, by name
struct Symbol *sym_FindScopedSymbol(char const *symName);
// Find a scoped symbol by name; do not return `@` or `_NARG` when they have no value
struct Symbol *sym_FindScopedValidSymbol(char const *symName);
struct Symbol const *sym_GetPC(void);
struct Symbol *sym_AddMacro(char const *symName, int32_t defLineNo, char *body, size_t size);
struct Symbol *sym_Ref(char const *symName);
struct Symbol *sym_AddString(char const *symName, char const *value);
struct Symbol *sym_RedefString(char const *symName, char const *value);
void sym_Purge(char const *symName);
void sym_Init(time_t now);

// Functions to save and restore the current symbol scope.
char const *sym_GetCurrentSymbolScope(void);
void sym_SetCurrentSymbolScope(char const *newScope);

#endif // RGBDS_SYMBOL_H
