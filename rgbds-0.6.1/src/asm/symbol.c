/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2018, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

// Symboltable and macroargs stuff

#include <assert.h>
#include <errno.h>
#include <inttypes.h>
#include <limits.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

#include "asm/fixpoint.h"
#include "asm/fstack.h"
#include "asm/macro.h"
#include "asm/main.h"
#include "asm/output.h"
#include "asm/section.h"
#include "asm/symbol.h"
#include "asm/util.h"
#include "asm/warning.h"

#include "error.h"
#include "hashmap.h"
#include "helpers.h"
#include "version.h"

HashMap symbols;

static const char *labelScope; // Current section's label scope
static struct Symbol *PCSymbol;
static struct Symbol *_NARGSymbol;
static char savedTIME[256];
static char savedDATE[256];
static char savedTIMESTAMP_ISO8601_LOCAL[256];
static char savedTIMESTAMP_ISO8601_UTC[256];
static bool exportall;

bool sym_IsPC(struct Symbol const *sym)
{
	return sym == PCSymbol;
}

struct ForEachArgs {
	void (*func)(struct Symbol *sym, void *arg);
	void *arg;
};

static void forEachWrapper(void *_sym, void *_argWrapper)
{
	struct ForEachArgs *argWrapper = _argWrapper;
	struct Symbol *sym = _sym;

	argWrapper->func(sym, argWrapper->arg);
}

void sym_ForEach(void (*func)(struct Symbol *, void *), void *arg)
{
	struct ForEachArgs argWrapper = { .func = func, .arg = arg };

	hash_ForEach(symbols, forEachWrapper, &argWrapper);
}

static int32_t Callback_NARG(void)
{
	if (!macro_GetCurrentArgs()) {
		error("_NARG does not make sense outside of a macro\n");
		return 0;
	}
	return macro_NbArgs();
}

static int32_t Callback__LINE__(void)
{
	warning(WARNING_OBSOLETE, "`__LINE__` is deprecated\n");

	return lexer_GetLineNo();
}

static char const *Callback__FILE__(void)
{
	warning(WARNING_OBSOLETE, "`__FILE__` is deprecated\n");

	// There are only two call sites for this; one copies the contents directly, the other is
	// EQUS expansions, which cannot straddle file boundaries. So this should be fine.
	static char *buf = NULL;
	static size_t bufsize = 0;
	char const *fileName = fstk_GetFileName();
	size_t j = 1;

	assert(fileName[0]);
	// The assertion above ensures the loop runs at least once
	for (size_t i = 0; fileName[i]; i++, j++) {
		// Account for the extra backslash inserted below
		if (fileName[i] == '"')
			j++;
		// Ensure there will be enough room; DO NOT PRINT ANYTHING ABOVE THIS!
		if (j + 2 >= bufsize) { // Always keep room for 2 tail chars
			bufsize = bufsize ? bufsize * 2 : 64;
			buf = realloc(buf, bufsize);
			if (!buf)
				fatalerror("Failed to grow buffer for file name: %s\n",
					   strerror(errno));
		}
		// Escape quotes, since we're returning a string
		if (fileName[i] == '"')
			buf[j - 1] = '\\';
		buf[j] = fileName[i];
	}
	// Write everything after the loop, to ensure the buffer has been allocated
	buf[0] = '"';
	buf[j++] = '"';
	buf[j] = '\0';
	return buf;
}

static int32_t CallbackPC(void)
{
	struct Section const *section = sect_GetSymbolSection();

	return section ? section->org + sect_GetSymbolOffset() : 0;
}

// Get the value field of a symbol
int32_t sym_GetValue(struct Symbol const *sym)
{
	if (sym_IsNumeric(sym) && sym->hasCallback)
		return sym->numCallback();

	if (sym->type == SYM_LABEL)
		// TODO: do not use section's org directly
		return sym->value + sym_GetSection(sym)->org;

	return sym->value;
}

static void dumpFilename(struct Symbol const *sym)
{
	if (sym->src)
		fstk_Dump(sym->src, sym->fileLine);
	else if (sym->fileLine == 0)
		fputs("<command-line>", stderr);
	else
		fputs("<builtin>", stderr);
}

// Set a symbol's definition filename and line
static void setSymbolFilename(struct Symbol *sym)
{
	sym->src = fstk_GetFileStack();
	sym->fileLine = sym->src ? lexer_GetLineNo() : 0; // This is (NULL, 1) for built-ins
}

// Update a symbol's definition filename and line
static void updateSymbolFilename(struct Symbol *sym)
{
	struct FileStackNode *oldSrc = sym->src;

	setSymbolFilename(sym);
	// If the old node was referenced, ensure the new one is
	if (oldSrc && oldSrc->referenced && oldSrc->ID != (uint32_t)-1)
		out_RegisterNode(sym->src);
	// TODO: unref the old node, and use `out_ReplaceNode` instead of deleting it
}

// Create a new symbol by name
static struct Symbol *createsymbol(char const *symName)
{
	struct Symbol *sym = malloc(sizeof(*sym));

	if (!sym)
		fatalerror("Failed to create symbol '%s': %s\n", symName, strerror(errno));

	if (snprintf(sym->name, MAXSYMLEN + 1, "%s", symName) > MAXSYMLEN)
		warning(WARNING_LONG_STR, "Symbol name is too long: '%s'\n", symName);

	sym->isExported = false;
	sym->isBuiltin = false;
	sym->hasCallback = false;
	sym->section = NULL;
	setSymbolFilename(sym);
	sym->ID = -1;
	sym->next = NULL;

	hash_AddElement(symbols, sym->name, sym);
	return sym;
}

// Creates the full name of a local symbol in a given scope, by prepending
// the name with the parent symbol's name.
static void fullSymbolName(char *output, size_t outputSize,
			   char const *localName, char const *scopeName)
{
	int ret = snprintf(output, outputSize, "%s%s", scopeName, localName);

	if (ret < 0)
		fatalerror("snprintf error when expanding symbol name: %s", strerror(errno));
	else if ((size_t)ret >= outputSize)
		fatalerror("Symbol name is too long: '%s%s'\n", scopeName, localName);
}

static void assignStringSymbol(struct Symbol *sym, char const *value)
{
	char *string = strdup(value);

	if (!string)
		fatalerror("No memory for string equate: %s\n", strerror(errno));

	sym->type = SYM_EQUS;
	sym->macro = string;
	sym->macroSize = strlen(string);
}

struct Symbol *sym_FindExactSymbol(char const *symName)
{
	return hash_GetElement(symbols, symName);
}

struct Symbol *sym_FindUnscopedSymbol(char const *symName)
{
	if (strchr(symName, '.')) {
		error("Expected non-scoped symbol name, not \"%s\"\n", symName);
		return NULL;
	}
	return sym_FindExactSymbol(symName);
}

struct Symbol *sym_FindScopedSymbol(char const *symName)
{
	char const *localName = strchr(symName, '.');

	if (localName) {
		if (strchr(localName + 1, '.'))
			fatalerror("'%s' is a nonsensical reference to a nested local symbol\n",
				   symName);
		// If auto-scoped local label, expand the name
		if (localName == symName) { // Meaning, the name begins with the dot
			char fullName[MAXSYMLEN + 1];

			fullSymbolName(fullName, sizeof(fullName), symName, labelScope);
			return sym_FindExactSymbol(fullName);
		}
	}
	return sym_FindExactSymbol(symName);
}

struct Symbol *sym_FindScopedValidSymbol(char const *symName)
{
	struct Symbol *sym = sym_FindScopedSymbol(symName);

	// `@` has no value outside a section
	if (sym == PCSymbol && !sect_GetSymbolSection()) {
		return NULL;
	}
	// `_NARG` has no value outside a macro
	if (sym == _NARGSymbol && !macro_GetCurrentArgs()) {
		return NULL;
	}
	return sym;
}

struct Symbol const *sym_GetPC(void)
{
	return PCSymbol;
}

static bool isReferenced(struct Symbol const *sym)
{
	return sym->ID != (uint32_t)-1;
}

// Purge a symbol
void sym_Purge(char const *symName)
{
	struct Symbol *sym = sym_FindScopedValidSymbol(symName);

	if (!sym) {
		error("'%s' not defined\n", symName);
	} else if (sym->isBuiltin) {
		error("Built-in symbol '%s' cannot be purged\n", symName);
	} else if (isReferenced(sym)) {
		error("Symbol \"%s\" is referenced and thus cannot be purged\n", symName);
	} else {
		// Do not keep a reference to the label's name after purging it
		if (sym->name == labelScope)
			sym_SetCurrentSymbolScope(NULL);

		// FIXME: this leaks sym->macro for SYM_EQUS and SYM_MACRO, but this can't
		// free(sym->macro) because the expansion may be purging itself.
		hash_RemoveElement(symbols, sym->name);
		// TODO: ideally, also unref the file stack nodes
		free(sym);
	}
}

uint32_t sym_GetPCValue(void)
{
	struct Section const *sect = sect_GetSymbolSection();

	if (!sect)
		error("PC has no value outside a section\n");
	else if (sect->org == (uint32_t)-1)
		error("Expected constant PC but section is not fixed\n");
	else
		return CallbackPC();
	return 0;
}

// Return a constant symbol's value, assuming it's defined
uint32_t sym_GetConstantSymValue(struct Symbol const *sym)
{
	if (sym == PCSymbol)
		return sym_GetPCValue();
	else if (!sym_IsConstant(sym))
		error("\"%s\" does not have a constant value\n", sym->name);
	else
		return sym_GetValue(sym);

	return 0;
}

// Return a constant symbol's value
uint32_t sym_GetConstantValue(char const *symName)
{
	struct Symbol const *sym = sym_FindScopedSymbol(symName);

	if (!sym)
		error("'%s' not defined\n", symName);
	else
		return sym_GetConstantSymValue(sym);

	return 0;
}

char const *sym_GetCurrentSymbolScope(void)
{
	return labelScope;
}

void sym_SetCurrentSymbolScope(char const *newScope)
{
	labelScope = newScope;
}

/*
 * Create a symbol that will be non-relocatable and ensure that it
 * hasn't already been defined or referenced in a context that would
 * require that it be relocatable
 * @param symName The name of the symbol to create
 * @param numeric If false, the symbol may not have been referenced earlier
 */
static struct Symbol *createNonrelocSymbol(char const *symName, bool numeric)
{
	struct Symbol *sym = sym_FindExactSymbol(symName);

	if (!sym) {
		sym = createsymbol(symName);
	} else if (sym_IsDefined(sym)) {
		error("'%s' already defined at ", symName);
		dumpFilename(sym);
		putc('\n', stderr);
		return NULL; // Don't allow overriding the symbol, that'd be bad!
	} else if (!numeric) {
		// The symbol has already been referenced, but it's not allowed
		error("'%s' already referenced at ", symName);
		dumpFilename(sym);
		putc('\n', stderr);
		return NULL; // Don't allow overriding the symbol, that'd be bad!
	}

	return sym;
}

// Add an equated symbol
struct Symbol *sym_AddEqu(char const *symName, int32_t value)
{
	struct Symbol *sym = createNonrelocSymbol(symName, true);

	if (!sym)
		return NULL;

	sym->type = SYM_EQU;
	sym->value = value;

	return sym;
}

struct Symbol *sym_RedefEqu(char const *symName, int32_t value)
{
	struct Symbol *sym = sym_FindExactSymbol(symName);

	if (!sym)
		return sym_AddEqu(symName, value);

	if (sym_IsDefined(sym) && sym->type != SYM_EQU) {
		error("'%s' already defined as non-EQU at ", symName);
		dumpFilename(sym);
		putc('\n', stderr);
		return NULL;
	} else if (sym->isBuiltin) {
		error("Built-in symbol '%s' cannot be redefined\n", symName);
		return NULL;
	}

	updateSymbolFilename(sym);
	sym->type = SYM_EQU;
	sym->value = value;

	return sym;
}

/*
 * Add a string equated symbol.
 *
 * If the desired symbol is a string it needs to be passed to this function with
 * quotes inside the string, like sym_AddString("name", "\"test\"), or the
 * assembler won't be able to use it with DB and similar. This is equivalent to
 * ``` name EQUS "\"test\"" ```
 *
 * If the desired symbol is a register or a number, just the terminator quotes
 * of the string are enough: sym_AddString("M_PI", "3.1415"). This is the same
 * as ``` M_PI EQUS "3.1415" ```
 */
struct Symbol *sym_AddString(char const *symName, char const *value)
{
	struct Symbol *sym = createNonrelocSymbol(symName, false);

	if (!sym)
		return NULL;

	assignStringSymbol(sym, value);
	return sym;
}

struct Symbol *sym_RedefString(char const *symName, char const *value)
{
	struct Symbol *sym = sym_FindExactSymbol(symName);

	if (!sym)
		return sym_AddString(symName, value);

	if (sym->type != SYM_EQUS) {
		if (sym_IsDefined(sym))
			error("'%s' already defined as non-EQUS at ", symName);
		else
			error("'%s' already referenced at ", symName);
		dumpFilename(sym);
		putc('\n', stderr);
		return NULL;
	} else if (sym->isBuiltin) {
		error("Built-in symbol '%s' cannot be redefined\n", symName);
		return NULL;
	}

	updateSymbolFilename(sym);
	// FIXME: this leaks the previous sym->macro value, but this can't
	// free(sym->macro) because the expansion may be redefining itself.
	assignStringSymbol(sym, value);

	return sym;
}

// Alter a mutable symbol's value
struct Symbol *sym_AddVar(char const *symName, int32_t value)
{
	struct Symbol *sym = sym_FindExactSymbol(symName);

	if (!sym) {
		sym = createsymbol(symName);
	} else if (sym_IsDefined(sym) && sym->type != SYM_VAR) {
		error("'%s' already defined as %s at ",
		      symName, sym->type == SYM_LABEL ? "label" : "constant");
		dumpFilename(sym);
		putc('\n', stderr);
		return sym;
	} else {
		updateSymbolFilename(sym);
	}

	sym->type = SYM_VAR;
	sym->value = value;

	return sym;
}

/*
 * Add a label (aka "relocatable symbol")
 * @param symName The label's full name (so `.name` is invalid)
 * @return The created symbol
 */
static struct Symbol *addLabel(char const *symName)
{
	assert(symName[0] != '.'); // The symbol name must have been expanded prior
	struct Symbol *sym = sym_FindExactSymbol(symName);

	if (!sym) {
		sym = createsymbol(symName);
	} else if (sym_IsDefined(sym)) {
		error("'%s' already defined at ", symName);
		dumpFilename(sym);
		putc('\n', stderr);
		return NULL;
	} else {
		updateSymbolFilename(sym);
	}
	// If the symbol already exists as a ref, just "take over" it
	sym->type = SYM_LABEL;
	sym->value = sect_GetSymbolOffset();
	if (exportall)
		sym->isExported = true;
	sym->section = sect_GetSymbolSection();

	if (sym && !sym->section)
		error("Label \"%s\" created outside of a SECTION\n", symName);
	return sym;
}

// Add a local (`.name` or `Parent.name`) relocatable symbol
struct Symbol *sym_AddLocalLabel(char const *symName)
{
	if (!labelScope) {
		error("Local label '%s' in main scope\n", symName);
		return NULL;
	}
	assert(!strchr(labelScope, '.')); // Assuming no dots in `labelScope`

	char fullName[MAXSYMLEN + 1];
	char const *localName = strchr(symName, '.');

	assert(localName); // There should be at least one dot in `symName`
	// Check for something after the dot in `localName`
	if (localName[1] == '\0') {
		fatalerror("'%s' is a nonsensical reference to an empty local label\n",
			   symName);
	}
	// Check for more than one dot in `localName`
	if (strchr(localName + 1, '.'))
		fatalerror("'%s' is a nonsensical reference to a nested local label\n",
			   symName);

	if (localName == symName) {
		// Expand `symName` to the full `labelScope.symName` name
		fullSymbolName(fullName, sizeof(fullName), symName, labelScope);
		symName = fullName;
	} else {
		size_t i = 0;

		// Find where `labelScope` and `symName` first differ
		while (labelScope[i] && symName[i] == labelScope[i])
			i++;

		// Check that `symName` starts with `labelScope` and then a '.'
		if (labelScope[i] != '\0' || symName[i] != '.') {
			size_t parentLen = localName - symName;

			assert(parentLen <= INT_MAX);
			error("Not currently in the scope of '%.*s'\n", (int)parentLen, symName);
		}
	}

	return addLabel(symName);
}

// Add a relocatable symbol
struct Symbol *sym_AddLabel(char const *symName)
{
	struct Symbol *sym = addLabel(symName);

	// Set the symbol as the new scope
	if (sym)
		sym_SetCurrentSymbolScope(sym->name);
	return sym;
}

static uint32_t anonLabelID;

// Add an anonymous label
struct Symbol *sym_AddAnonLabel(void)
{
	if (anonLabelID == UINT32_MAX) {
		error("Only %" PRIu32 " anonymous labels can be created!", anonLabelID);
		return NULL;
	}
	char name[MAXSYMLEN + 1];

	sym_WriteAnonLabelName(name, 0, true); // The direction is important!
	anonLabelID++;
	return addLabel(name);
}

// Write an anonymous label's name to a buffer
void sym_WriteAnonLabelName(char buf[MIN_NB_ELMS(MAXSYMLEN + 1)], uint32_t ofs, bool neg)
{
	uint32_t id = 0;

	if (neg) {
		if (ofs > anonLabelID)
			error("Reference to anonymous label %" PRIu32 " before, when only %" PRIu32
			      " ha%s been created so far\n",
			      ofs, anonLabelID, anonLabelID == 1 ? "s" : "ve");
		else
			id = anonLabelID - ofs;
	} else {
		ofs--; // We're referencing symbols that haven't been created yet...
		if (ofs > UINT32_MAX - anonLabelID)
			error("Reference to anonymous label %" PRIu32 " after, when only %" PRIu32
			      " may still be created\n", ofs + 1, UINT32_MAX - anonLabelID);
		else
			id = anonLabelID + ofs;
	}

	sprintf(buf, "!%u", id);
}

// Export a symbol
void sym_Export(char const *symName)
{
	if (symName[0] == '!') {
		error("Anonymous labels cannot be exported\n");
		return;
	}

	struct Symbol *sym = sym_FindScopedSymbol(symName);

	// If the symbol doesn't exist, create a ref that can be purged
	if (!sym)
		sym = sym_Ref(symName);
	sym->isExported = true;
}

// Add a macro definition
struct Symbol *sym_AddMacro(char const *symName, int32_t defLineNo, char *body, size_t size)
{
	struct Symbol *sym = createNonrelocSymbol(symName, false);

	if (!sym)
		return NULL;

	sym->type = SYM_MACRO;
	sym->macroSize = size;
	sym->macro = body;
	setSymbolFilename(sym); // TODO: is this really necessary?
	// The symbol is created at the line after the `endm`,
	// override this with the actual definition line
	sym->fileLine = defLineNo;

	return sym;
}

// Flag that a symbol is referenced in an RPN expression
// and create it if it doesn't exist yet
struct Symbol *sym_Ref(char const *symName)
{
	struct Symbol *sym = sym_FindScopedSymbol(symName);

	if (!sym) {
		char fullname[MAXSYMLEN + 1];

		if (symName[0] == '.') {
			if (!labelScope)
				fatalerror("Local label reference '%s' in main scope\n", symName);
			fullSymbolName(fullname, sizeof(fullname), symName, labelScope);
			symName = fullname;
		}

		sym = createsymbol(symName);
		sym->type = SYM_REF;
	}

	return sym;
}

// Set whether to export all relocatable symbols by default
void sym_SetExportAll(bool set)
{
	exportall = set;
}

static struct Symbol *createBuiltinSymbol(char const *symName)
{
	struct Symbol *sym = createsymbol(symName);

	sym->isBuiltin = true;
	sym->hasCallback = true;
	sym->src = NULL;
	sym->fileLine = 1; // This is 0 for CLI-defined symbols
	return sym;
}

// Initialize the symboltable
void sym_Init(time_t now)
{
	PCSymbol = createBuiltinSymbol("@");
	_NARGSymbol = createBuiltinSymbol("_NARG");
	// __LINE__ is deprecated
	struct Symbol *__LINE__Symbol = createBuiltinSymbol("__LINE__");
	// __FILE__ is deprecated
	struct Symbol *__FILE__Symbol = createBuiltinSymbol("__FILE__");

	PCSymbol->type = SYM_LABEL;
	PCSymbol->section = NULL;
	PCSymbol->numCallback = CallbackPC;
	_NARGSymbol->type = SYM_EQU;
	_NARGSymbol->numCallback = Callback_NARG;
	__LINE__Symbol->type = SYM_EQU;
	__LINE__Symbol->numCallback = Callback__LINE__;
	__FILE__Symbol->type = SYM_EQUS;
	__FILE__Symbol->strCallback = Callback__FILE__;

	sym_AddVar("_RS", 0)->isBuiltin = true;

#define addSym(fn, name, val) do { \
	struct Symbol *sym = fn(name, val); \
	assert(sym); \
	sym->isBuiltin = true; \
} while (0)
#define addNumber(name, val) addSym(sym_AddEqu, name, val)
#define addString(name, val) addSym(sym_AddString, name, val)

	addString("__RGBDS_VERSION__", get_package_version_string());
	addNumber("__RGBDS_MAJOR__", PACKAGE_VERSION_MAJOR);
	addNumber("__RGBDS_MINOR__", PACKAGE_VERSION_MINOR);
	addNumber("__RGBDS_PATCH__", PACKAGE_VERSION_PATCH);
#ifdef PACKAGE_VERSION_RC
	addNumber("__RGBDS_RC__", PACKAGE_VERSION_RC);
#endif

	if (now == (time_t)-1) {
		warn("Couldn't determine current time");
		// Fall back by pretending we are at the Epoch
		now = 0;
	}

	const struct tm *time_local = localtime(&now);

	strftime(savedTIME, sizeof(savedTIME), "\"%H:%M:%S\"", time_local);
	strftime(savedDATE, sizeof(savedDATE), "\"%d %B %Y\"", time_local);
	strftime(savedTIMESTAMP_ISO8601_LOCAL,
		 sizeof(savedTIMESTAMP_ISO8601_LOCAL), "\"%Y-%m-%dT%H:%M:%S%z\"",
		 time_local);

	const struct tm *time_utc = gmtime(&now);

	strftime(savedTIMESTAMP_ISO8601_UTC,
		 sizeof(savedTIMESTAMP_ISO8601_UTC), "\"%Y-%m-%dT%H:%M:%SZ\"",
		 time_utc);

	addString("__TIME__", savedTIME);
	addString("__DATE__", savedDATE);
	addString("__ISO_8601_LOCAL__", savedTIMESTAMP_ISO8601_LOCAL);
	addString("__ISO_8601_UTC__", savedTIMESTAMP_ISO8601_UTC);

	addNumber("__UTC_YEAR__", time_utc->tm_year + 1900);
	addNumber("__UTC_MONTH__", time_utc->tm_mon + 1);
	addNumber("__UTC_DAY__", time_utc->tm_mday);
	addNumber("__UTC_HOUR__", time_utc->tm_hour);
	addNumber("__UTC_MINUTE__", time_utc->tm_min);
	addNumber("__UTC_SECOND__", time_utc->tm_sec);

#undef addNumber
#undef addString
#undef addSym

	sym_SetCurrentSymbolScope(NULL);
	anonLabelID = 0;}
