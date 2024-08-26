/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2022, Eldred Habert and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#include <errno.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "asm/macro.h"
#include "asm/warning.h"

#define MAXMACROARGS 99999

// Your average macro invocation does not go past the tens, but some go further
// This ensures that sane and slightly insane invocations suffer no penalties,
// and the rest is insane and thus will assume responsibility.
// Additionally, ~300 bytes (on x64) of memory per level of nesting has been
// deemed reasonable. (Halve that on x86.)
#define INITIAL_ARG_SIZE 32
struct MacroArgs {
	unsigned int nbArgs;
	unsigned int shift;
	unsigned int capacity;
	char *args[];
};

#define SIZEOF_ARGS(nbArgs) (sizeof(struct MacroArgs) + \
			    sizeof(((struct MacroArgs){0}).args[0]) * (nbArgs))

static struct MacroArgs *macroArgs = NULL;
static uint32_t uniqueID = 0;
static uint32_t maxUniqueID = 0;
// The initialization is somewhat harmful, since it is never used, but it
// guarantees the size of the buffer will be correct. I was unable to find a
// better solution, but if you have one, please feel free!
static char uniqueIDBuf[] = "_u4294967295"; // UINT32_MAX
static char *uniqueIDPtr = NULL;

struct MacroArgs *macro_GetCurrentArgs(void)
{
	return macroArgs;
}

struct MacroArgs *macro_NewArgs(void)
{
	struct MacroArgs *args = malloc(SIZEOF_ARGS(INITIAL_ARG_SIZE));

	if (!args)
		fatalerror("Unable to register macro arguments: %s\n", strerror(errno));

	args->nbArgs = 0;
	args->shift = 0;
	args->capacity = INITIAL_ARG_SIZE;
	return args;
}

void macro_AppendArg(struct MacroArgs **argPtr, char *s)
{
#define macArgs (*argPtr)
	if (s[0] == '\0')
		warning(WARNING_EMPTY_MACRO_ARG, "Empty macro argument\n");
	if (macArgs->nbArgs == MAXMACROARGS)
		error("A maximum of " EXPAND_AND_STR(MAXMACROARGS) " arguments is allowed\n");
	if (macArgs->nbArgs >= macArgs->capacity) {
		macArgs->capacity *= 2;
		// Check that overflow didn't roll us back
		if (macArgs->capacity <= macArgs->nbArgs)
			fatalerror("Failed to add new macro argument: capacity overflow\n");
		macArgs = realloc(macArgs, SIZEOF_ARGS(macArgs->capacity));
		if (!macArgs)
			fatalerror("Error adding new macro argument: %s\n", strerror(errno));
	}
	macArgs->args[macArgs->nbArgs++] = s;
#undef macArgs
}

void macro_UseNewArgs(struct MacroArgs *args)
{
	macroArgs = args;
}

void macro_FreeArgs(struct MacroArgs *args)
{
	for (uint32_t i = 0; i < macroArgs->nbArgs; i++)
		free(args->args[i]);
}

char const *macro_GetArg(uint32_t i)
{
	if (!macroArgs)
		return NULL;

	uint32_t realIndex = i + macroArgs->shift - 1;

	return realIndex >= macroArgs->nbArgs ? NULL
					      : macroArgs->args[realIndex];
}

char const *macro_GetAllArgs(void)
{
	if (!macroArgs)
		return NULL;

	if (macroArgs->shift >= macroArgs->nbArgs)
		return "";

	size_t len = 0;

	for (uint32_t i = macroArgs->shift; i < macroArgs->nbArgs; i++)
		len += strlen(macroArgs->args[i]) + 1; // 1 for comma

	char *str = malloc(len + 1); // 1 for '\0'
	char *ptr = str;

	if (!str)
		fatalerror("Failed to allocate memory for expanding '\\#': %s\n", strerror(errno));

	for (uint32_t i = macroArgs->shift; i < macroArgs->nbArgs; i++) {
		size_t n = strlen(macroArgs->args[i]);

		memcpy(ptr, macroArgs->args[i], n);
		ptr += n;

		// Commas go between args and after a last empty arg
		if (i < macroArgs->nbArgs - 1 || n == 0)
			*ptr++ = ','; // no space after comma
	}
	*ptr = '\0';

	return str;
}

uint32_t macro_GetUniqueID(void)
{
	return uniqueID;
}

char const *macro_GetUniqueIDStr(void)
{
	// Generate a new unique ID on the first use of `\@`
	if (uniqueID == 0)
		macro_SetUniqueID(++maxUniqueID);

	return uniqueIDPtr;
}

void macro_SetUniqueID(uint32_t id)
{
	uniqueID = id;
	if (id == 0 || id == (uint32_t)-1) {
		uniqueIDPtr = NULL;
	} else {
		// The buffer is guaranteed to be the correct size
		// This is a valid label fragment, but not a valid numeric
		sprintf(uniqueIDBuf, "_u%" PRIu32, id);
		uniqueIDPtr = uniqueIDBuf;
	}
}

uint32_t macro_UseNewUniqueID(void)
{
	// A new ID will be generated on the first use of `\@`
	macro_SetUniqueID(0);
	return uniqueID;
}

uint32_t macro_UndefUniqueID(void)
{
	// No ID will be generated; use of `\@` is an error
	macro_SetUniqueID((uint32_t)-1);
	return uniqueID;
}

void macro_ShiftCurrentArgs(int32_t count)
{
	if (!macroArgs) {
		error("Cannot shift macro arguments outside of a macro\n");
	} else if (count > 0 && ((uint32_t)count > macroArgs->nbArgs
		   || macroArgs->shift > macroArgs->nbArgs - count)) {
		warning(WARNING_MACRO_SHIFT,
			"Cannot shift macro arguments past their end\n");
		macroArgs->shift = macroArgs->nbArgs;
	} else if (count < 0 && macroArgs->shift < (uint32_t)-count) {
		warning(WARNING_MACRO_SHIFT,
			"Cannot shift macro arguments past their beginning\n");
		macroArgs->shift = 0;
	} else {
		macroArgs->shift += count;
	}
}

uint32_t macro_NbArgs(void)
{
	return macroArgs->nbArgs - macroArgs->shift;
}
