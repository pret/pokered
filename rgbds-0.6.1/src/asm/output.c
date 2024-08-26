/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2019, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

// Outputs an objectfile

#include <assert.h>
#include <errno.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "asm/charmap.h"
#include "asm/fstack.h"
#include "asm/main.h"
#include "asm/output.h"
#include "asm/rpn.h"
#include "asm/section.h"
#include "asm/symbol.h"
#include "asm/warning.h"

#include "error.h"
#include "linkdefs.h"
#include "platform.h" // strdup

struct Patch {
	struct FileStackNode const *src;
	uint32_t lineNo;
	uint32_t offset;
	struct Section *pcSection;
	uint32_t pcOffset;
	uint8_t type;
	uint32_t rpnSize;
	uint8_t *rpn;
	struct Patch *next;
};

struct Assertion {
	struct Patch *patch;
	struct Section *section;
	char *message;
	struct Assertion *next;
};

char *objectName;

struct Section *sectionList;

// Linked list of symbols to put in the object file
static struct Symbol *objectSymbols = NULL;
static struct Symbol **objectSymbolsTail = &objectSymbols;
static uint32_t nbSymbols = 0; // Length of the above list

static struct Assertion *assertions = NULL;

static struct FileStackNode *fileStackNodes = NULL;

// Count the number of sections used in this object
static uint32_t countSections(void)
{
	uint32_t count = 0;

	for (struct Section const *sect = sectionList; sect; sect = sect->next)
		count++;

	return count;
}

// Count the number of patches used in this object
static uint32_t countPatches(struct Section const *sect)
{
	uint32_t r = 0;

	for (struct Patch const *patch = sect->patches; patch != NULL;
	     patch = patch->next)
		r++;

	return r;
}

// Count the number of assertions used in this object
static uint32_t countAsserts(void)
{
	struct Assertion *assert = assertions;
	uint32_t count = 0;

	while (assert) {
		count++;
		assert = assert->next;
	}
	return count;
}

// Write a long to a file (little-endian)
static void putlong(uint32_t i, FILE *f)
{
	putc(i, f);
	putc(i >> 8, f);
	putc(i >> 16, f);
	putc(i >> 24, f);
}

// Write a NULL-terminated string to a file
static void putstring(char const *s, FILE *f)
{
	while (*s)
		putc(*s++, f);
	putc(0, f);
}

static uint32_t getNbFileStackNodes(void)
{
	return fileStackNodes ? fileStackNodes->ID + 1 : 0;
}

void out_RegisterNode(struct FileStackNode *node)
{
	// If node is not already registered, register it (and parents), and give it a unique ID
	while (node->ID == (uint32_t)-1) {
		node->ID = getNbFileStackNodes();
		if (node->ID == (uint32_t)-1)
			fatalerror("Reached too many file stack nodes; try splitting the file up\n");
		node->next = fileStackNodes;
		fileStackNodes = node;

		// Also register the node's parents
		node = node->parent;
		if (!node)
			break;
	}
}

void out_ReplaceNode(struct FileStackNode *node)
{
	(void)node;
#if 0
This is code intended to replace a node, which is pretty useless until ref counting is added...

	struct FileStackNode **ptr = &fileStackNodes;

	// The linked list is supposed to have decrementing IDs, so iterate with less memory reads,
	// to hopefully hit the cache less. A debug check is added after, in case a change is made
	// that breaks this assumption.
	for (uint32_t i = fileStackNodes->ID; i != node->ID; i--)
		ptr = &(*ptr)->next;
	assert((*ptr)->ID == node->ID);

	node->next = (*ptr)->next;
	assert(!node->next || node->next->ID == node->ID - 1); // Catch inconsistencies early
	// TODO: unreference the node
	*ptr = node;
#endif
}

// Return a section's ID
static uint32_t getsectid(struct Section const *sect)
{
	struct Section const *sec = sectionList;
	uint32_t ID = 0;

	while (sec) {
		if (sec == sect)
			return ID;
		ID++;
		sec = sec->next;
	}

	fatalerror("Unknown section '%s'\n", sect->name);
}

static uint32_t getSectIDIfAny(struct Section const *sect)
{
	return sect ? getsectid(sect) : (uint32_t)-1;
}

// Write a patch to a file
static void writepatch(struct Patch const *patch, FILE *f)
{
	assert(patch->src->ID != (uint32_t)-1);
	putlong(patch->src->ID, f);
	putlong(patch->lineNo, f);
	putlong(patch->offset, f);
	putlong(getSectIDIfAny(patch->pcSection), f);
	putlong(patch->pcOffset, f);
	putc(patch->type, f);
	putlong(patch->rpnSize, f);
	fwrite(patch->rpn, 1, patch->rpnSize, f);
}

// Write a section to a file
static void writesection(struct Section const *sect, FILE *f)
{
	putstring(sect->name, f);

	putlong(sect->size, f);

	bool isUnion = sect->modifier == SECTION_UNION;
	bool isFragment = sect->modifier == SECTION_FRAGMENT;

	putc(sect->type | isUnion << 7 | isFragment << 6, f);

	putlong(sect->org, f);
	putlong(sect->bank, f);
	putc(sect->align, f);
	putlong(sect->alignOfs, f);

	if (sect_HasData(sect->type)) {
		fwrite(sect->data, 1, sect->size, f);
		putlong(countPatches(sect), f);

		for (struct Patch const *patch = sect->patches; patch != NULL;
		     patch = patch->next)
			writepatch(patch, f);
	}
}

static void freesection(struct Section const *sect)
{
	if (sect_HasData(sect->type)) {
		struct Patch *patch = sect->patches;

		while (patch != NULL) {
			struct Patch *next = patch->next;

			free(patch->rpn);
			free(patch);
			patch = next;
		}
	}
}

// Write a symbol to a file
static void writesymbol(struct Symbol const *sym, FILE *f)
{
	putstring(sym->name, f);
	if (!sym_IsDefined(sym)) {
		putc(SYMTYPE_IMPORT, f);
	} else {
		assert(sym->src->ID != (uint32_t)-1);

		putc(sym->isExported ? SYMTYPE_EXPORT : SYMTYPE_LOCAL, f);
		putlong(sym->src->ID, f);
		putlong(sym->fileLine, f);
		putlong(getSectIDIfAny(sym_GetSection(sym)), f);
		putlong(sym->value, f);
	}
}

static void registerSymbol(struct Symbol *sym)
{
	*objectSymbolsTail = sym;
	objectSymbolsTail = &sym->next;
	out_RegisterNode(sym->src);
	if (nbSymbols == (uint32_t)-1)
		fatalerror("Registered too many symbols (%" PRIu32
			   "); try splitting up your files\n", (uint32_t)-1);
	sym->ID = nbSymbols++;
}

// Returns a symbol's ID within the object file
// If the symbol does not have one, one is assigned by registering the symbol
static uint32_t getSymbolID(struct Symbol *sym)
{
	if (sym->ID == (uint32_t)-1 && !sym_IsPC(sym))
		registerSymbol(sym);
	return sym->ID;
}

static void writerpn(uint8_t *rpnexpr, uint32_t *rpnptr, uint8_t *rpn,
		     uint32_t rpnlen)
{
	char symName[512];

	for (size_t offset = 0; offset < rpnlen; ) {
#define popbyte() rpn[offset++]
#define writebyte(byte)	rpnexpr[(*rpnptr)++] = byte
		uint8_t rpndata = popbyte();

		switch (rpndata) {
			struct Symbol *sym;
			uint32_t value;
			uint8_t b;
			size_t i;

		case RPN_CONST:
			writebyte(RPN_CONST);
			writebyte(popbyte());
			writebyte(popbyte());
			writebyte(popbyte());
			writebyte(popbyte());
			break;

		case RPN_SYM:
			i = 0;
			do {
				symName[i] = popbyte();
			} while (symName[i++]);

			// The symbol name is always written expanded
			sym = sym_FindExactSymbol(symName);
			if (sym_IsConstant(sym)) {
				writebyte(RPN_CONST);
				value = sym_GetConstantValue(symName);
			} else {
				writebyte(RPN_SYM);
				value = getSymbolID(sym);
			}

			writebyte(value & 0xFF);
			writebyte(value >> 8);
			writebyte(value >> 16);
			writebyte(value >> 24);
			break;

		case RPN_BANK_SYM:
			i = 0;
			do {
				symName[i] = popbyte();
			} while (symName[i++]);

			// The symbol name is always written expanded
			sym = sym_FindExactSymbol(symName);
			value = getSymbolID(sym);

			writebyte(RPN_BANK_SYM);
			writebyte(value & 0xFF);
			writebyte(value >> 8);
			writebyte(value >> 16);
			writebyte(value >> 24);
			break;

		case RPN_BANK_SECT:
			writebyte(RPN_BANK_SECT);
			do {
				b = popbyte();
				writebyte(b);
			} while (b != 0);
			break;

		case RPN_SIZEOF_SECT:
			writebyte(RPN_SIZEOF_SECT);
			do {
				b = popbyte();
				writebyte(b);
			} while (b != 0);
			break;

		case RPN_STARTOF_SECT:
			writebyte(RPN_STARTOF_SECT);
			do {
				b = popbyte();
				writebyte(b);
			} while (b != 0);
			break;

		default:
			writebyte(rpndata);
			break;
		}
#undef popbyte
#undef writebyte
	}
}

// Allocate a new patch structure and link it into the list
// WARNING: all patches are assumed to eventually be written, so the file stack node is registered
static struct Patch *allocpatch(uint32_t type, struct Expression const *expr, uint32_t ofs)
{
	struct Patch *patch = malloc(sizeof(struct Patch));
	uint32_t rpnSize = expr->isKnown ? 5 : expr->rpnPatchSize;
	struct FileStackNode *node = fstk_GetFileStack();

	if (!patch)
		fatalerror("No memory for patch: %s\n", strerror(errno));

	patch->rpn = malloc(sizeof(*patch->rpn) * rpnSize);
	if (!patch->rpn)
		fatalerror("No memory for patch's RPN rpnSize: %s\n", strerror(errno));

	patch->type = type;
	patch->src = node;
	out_RegisterNode(node);
	patch->lineNo = lexer_GetLineNo();
	patch->offset = ofs;
	patch->pcSection = sect_GetSymbolSection();
	patch->pcOffset = sect_GetSymbolOffset();

	// If the rpnSize's value is known, output a constant RPN rpnSize directly
	if (expr->isKnown) {
		patch->rpnSize = rpnSize;
		// Make sure to update `rpnSize` above if modifying this!
		patch->rpn[0] = RPN_CONST;
		patch->rpn[1] = (uint32_t)(expr->val) & 0xFF;
		patch->rpn[2] = (uint32_t)(expr->val) >> 8;
		patch->rpn[3] = (uint32_t)(expr->val) >> 16;
		patch->rpn[4] = (uint32_t)(expr->val) >> 24;
	} else {
		patch->rpnSize = 0;
		writerpn(patch->rpn, &patch->rpnSize, expr->rpn, expr->rpnLength);
	}
	assert(patch->rpnSize == rpnSize);

	return patch;
}

// Create a new patch (includes the rpn expr)
void out_CreatePatch(uint32_t type, struct Expression const *expr, uint32_t ofs, uint32_t pcShift)
{
	struct Patch *patch = allocpatch(type, expr, ofs);

	// If the patch had a quantity of bytes output before it,
	// PC is not at the patch's location, but at the location
	// before those bytes.
	patch->pcOffset -= pcShift;

	patch->next = currentSection->patches;
	currentSection->patches = patch;
}

// Creates an assert that will be written to the object file
bool out_CreateAssert(enum AssertionType type, struct Expression const *expr,
		      char const *message, uint32_t ofs)
{
	struct Assertion *assertion = malloc(sizeof(*assertion));

	if (!assertion)
		return false;

	assertion->patch = allocpatch(type, expr, ofs);
	assertion->message = strdup(message);
	if (!assertion->message) {
		free(assertion);
		return false;
	}

	assertion->next = assertions;
	assertions = assertion;

	return true;
}

static void writeassert(struct Assertion *assert, FILE *f)
{
	writepatch(assert->patch, f);
	putstring(assert->message, f);
}

static void freeassert(struct Assertion *assert)
{
	free(assert->patch->rpn);
	free(assert->patch);
	free(assert);
}

static void writeFileStackNode(struct FileStackNode const *node, FILE *f)
{
	putlong(node->parent ? node->parent->ID : (uint32_t)-1, f);
	putlong(node->lineNo, f);
	putc(node->type, f);
	if (node->type != NODE_REPT) {
		putstring(((struct FileStackNamedNode const *)node)->name, f);
	} else {
		struct FileStackReptNode const *reptNode = (struct FileStackReptNode const *)node;

		putlong(reptNode->reptDepth, f);
		// Iters are stored by decreasing depth, so reverse the order for output
		for (uint32_t i = reptNode->reptDepth; i--; )
			putlong(reptNode->iters[i], f);
	}
}

static void registerUnregisteredSymbol(struct Symbol *symbol, void *arg)
{
	(void)arg; // sym_ForEach requires a void* parameter, but we are not using it.

	// Check for symbol->src, to skip any built-in symbol from rgbasm
	if (symbol->src && symbol->ID == (uint32_t)-1) {
		registerSymbol(symbol);
	}
}

// Write an objectfile
void out_WriteObject(void)
{
	FILE *f;
	if (strcmp(objectName, "-") != 0)
		f = fopen(objectName, "wb");
	else
		f = fdopen(STDOUT_FILENO, "wb");

	if (!f)
		err("Couldn't write file '%s'", objectName);

	// Also write symbols that weren't written above
	sym_ForEach(registerUnregisteredSymbol, NULL);

	fprintf(f, RGBDS_OBJECT_VERSION_STRING);
	putlong(RGBDS_OBJECT_REV, f);

	putlong(nbSymbols, f);
	putlong(countSections(), f);

	putlong(getNbFileStackNodes(), f);
	for (struct FileStackNode const *node = fileStackNodes; node; node = node->next) {
		writeFileStackNode(node, f);
		if (node->next && node->next->ID != node->ID - 1)
			fatalerror("Internal error: fstack node #%" PRIu32 " follows #%" PRIu32
				   ". Please report this to the developers!\n",
				   node->next->ID, node->ID);
	}

	for (struct Symbol const *sym = objectSymbols; sym; sym = sym->next)
		writesymbol(sym, f);

	for (struct Section *sect = sectionList; sect; sect = sect->next) {
		writesection(sect, f);
		freesection(sect);
	}

	putlong(countAsserts(), f);
	struct Assertion *assert = assertions;

	while (assert != NULL) {
		struct Assertion *next = assert->next;

		writeassert(assert, f);
		freeassert(assert);
		assert = next;
	}

	fclose(f);
}

// Set the objectfilename
void out_SetFileName(char *s)
{
	if (objectName)
		warnx("Overriding output filename %s", objectName);
	objectName = s;
	if (verbose)
		printf("Output filename %s\n", objectName);
}
