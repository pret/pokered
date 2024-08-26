/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2019, Eldred Habert and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#include <inttypes.h>
#include <limits.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "asm/fstack.h"
#include "asm/main.h"
#include "asm/warning.h"

#include "error.h"

unsigned int nbErrors = 0;

static const enum WarningState defaultWarnings[ARRAY_SIZE(warningStates)] = {
	[WARNING_ASSERT]		= WARNING_ENABLED,
	[WARNING_BACKWARDS_FOR]		= WARNING_DISABLED,
	[WARNING_BUILTIN_ARG]		= WARNING_DISABLED,
	[WARNING_CHARMAP_REDEF]		= WARNING_DISABLED,
	[WARNING_DIV]			= WARNING_DISABLED,
	[WARNING_EMPTY_DATA_DIRECTIVE]	= WARNING_DISABLED,
	[WARNING_EMPTY_MACRO_ARG]	= WARNING_DISABLED,
	[WARNING_EMPTY_STRRPL]		= WARNING_DISABLED,
	[WARNING_LARGE_CONSTANT]	= WARNING_DISABLED,
	[WARNING_LONG_STR]		= WARNING_DISABLED,
	[WARNING_MACRO_SHIFT]		= WARNING_DISABLED,
	[WARNING_NESTED_COMMENT]	= WARNING_ENABLED,
	[WARNING_OBSOLETE]		= WARNING_ENABLED,
	[WARNING_SHIFT]			= WARNING_DISABLED,
	[WARNING_SHIFT_AMOUNT]		= WARNING_DISABLED,
	[WARNING_USER]			= WARNING_ENABLED,

	[WARNING_NUMERIC_STRING_1]	= WARNING_ENABLED,
	[WARNING_NUMERIC_STRING_2]	= WARNING_DISABLED,
	[WARNING_TRUNCATION_1]		= WARNING_ENABLED,
	[WARNING_TRUNCATION_2]		= WARNING_DISABLED,
	[WARNING_UNMAPPED_CHAR_1]	= WARNING_ENABLED,
	[WARNING_UNMAPPED_CHAR_2]	= WARNING_DISABLED,
};

enum WarningState warningStates[ARRAY_SIZE(warningStates)];

bool warningsAreErrors; // Set if `-Werror` was specified

static enum WarningState warningState(enum WarningID id)
{
	// Check if warnings are globally disabled
	if (!warnings)
		return WARNING_DISABLED;

	// Get the actual state
	enum WarningState state = warningStates[id];

	if (state == WARNING_DEFAULT)
		// The state isn't set, grab its default state
		state = defaultWarnings[id];

	if (warningsAreErrors && state == WARNING_ENABLED)
		state = WARNING_ERROR;

	return state;
}

static const char * const warningFlags[NB_WARNINGS] = {
	"assert",
	"backwards-for",
	"builtin-args",
	"charmap-redef",
	"div",
	"empty-data-directive",
	"empty-macro-arg",
	"empty-strrpl",
	"large-constant",
	"long-string",
	"macro-shift",
	"nested-comment",
	"obsolete",
	"shift",
	"shift-amount",
	"user",

	// Parametric warnings
	"numeric-string",
	"numeric-string",
	"truncation",
	"truncation",
	"unmapped-char",
	"unmapped-char",

	// Meta warnings
	"all",
	"extra",
	"everything", // Especially useful for testing
};

static const struct {
	char const *name;
	uint8_t nbLevels;
	uint8_t defaultLevel;
} paramWarnings[] = {
	{ "numeric-string", 2, 1 },
	{ "truncation", 2, 2 },
	{ "unmapped-char", 2, 1 },
};

static bool tryProcessParamWarning(char const *flag, uint8_t param, enum WarningState state)
{
	enum WarningID baseID = PARAM_WARNINGS_START;

	for (size_t i = 0; i < ARRAY_SIZE(paramWarnings); i++) {
		uint8_t maxParam = paramWarnings[i].nbLevels;

		if (!strcmp(paramWarnings[i].name, flag)) { // Match!
			// If making the warning an error but param is 0, set to the maximum
			// This accommodates `-Werror=flag`, but also `-Werror=flag=0`, which is
			// thus filtered out by the caller.
			// A param of 0 makes sense for disabling everything, but neither for
			// enabling nor "erroring". Use the default for those.
			if (param == 0 && state != WARNING_DISABLED) {
				param = paramWarnings[i].defaultLevel;
			} else if (param > maxParam) {
				if (param != 255) // Don't  warn if already capped
					warnx("Got parameter %" PRIu8
					      " for warning flag \"%s\", but the maximum is %"
					      PRIu8 "; capping.\n",
					      param, flag, maxParam);
				param = maxParam;
			}

			// Set the first <param> to enabled/error, and disable the rest
			for (uint8_t ofs = 0; ofs < maxParam; ofs++) {
				warningStates[baseID + ofs] =
					ofs < param ? state : WARNING_DISABLED;
			}
			return true;
		}

		baseID += maxParam;
	}
	return false;
}

enum MetaWarningCommand {
	META_WARNING_DONE = NB_WARNINGS
};

// Warnings that probably indicate an error
static uint8_t const _wallCommands[] = {
	WARNING_BACKWARDS_FOR,
	WARNING_BUILTIN_ARG,
	WARNING_CHARMAP_REDEF,
	WARNING_EMPTY_DATA_DIRECTIVE,
	WARNING_EMPTY_STRRPL,
	WARNING_LARGE_CONSTANT,
	WARNING_LONG_STR,
	WARNING_NESTED_COMMENT,
	WARNING_OBSOLETE,
	WARNING_NUMERIC_STRING_1,
	WARNING_UNMAPPED_CHAR_1,
	META_WARNING_DONE
};

// Warnings that are less likely to indicate an error
static uint8_t const _wextraCommands[] = {
	WARNING_EMPTY_MACRO_ARG,
	WARNING_MACRO_SHIFT,
	WARNING_NESTED_COMMENT,
	WARNING_OBSOLETE,
	WARNING_NUMERIC_STRING_2,
	WARNING_TRUNCATION_1,
	WARNING_TRUNCATION_2,
	WARNING_UNMAPPED_CHAR_1,
	WARNING_UNMAPPED_CHAR_2,
	META_WARNING_DONE
};

// Literally everything. Notably useful for testing
static uint8_t const _weverythingCommands[] = {
	WARNING_BACKWARDS_FOR,
	WARNING_BUILTIN_ARG,
	WARNING_DIV,
	WARNING_EMPTY_DATA_DIRECTIVE,
	WARNING_EMPTY_MACRO_ARG,
	WARNING_EMPTY_STRRPL,
	WARNING_LARGE_CONSTANT,
	WARNING_LONG_STR,
	WARNING_MACRO_SHIFT,
	WARNING_NESTED_COMMENT,
	WARNING_OBSOLETE,
	WARNING_SHIFT,
	WARNING_SHIFT_AMOUNT,
	WARNING_NUMERIC_STRING_1,
	WARNING_NUMERIC_STRING_2,
	WARNING_TRUNCATION_1,
	WARNING_TRUNCATION_2,
	WARNING_UNMAPPED_CHAR_1,
	WARNING_UNMAPPED_CHAR_2,
	// WARNING_USER,
	META_WARNING_DONE
};

static uint8_t const *metaWarningCommands[NB_META_WARNINGS] = {
	_wallCommands,
	_wextraCommands,
	_weverythingCommands
};

void processWarningFlag(char *flag)
{
	static bool setError = false;

	// First, try to match against a "meta" warning
	for (enum WarningID id = META_WARNINGS_START; id < NB_WARNINGS; id++) {
		// TODO: improve the matching performance?
		if (!strcmp(flag, warningFlags[id])) {
			// We got a match!
			if (setError)
				errx("Cannot make meta warning \"%s\" into an error",
				     flag);

			for (uint8_t const *ptr = metaWarningCommands[id - META_WARNINGS_START];
			     *ptr != META_WARNING_DONE; ptr++) {
				// Warning flag, set without override
				if (warningStates[*ptr] == WARNING_DEFAULT)
					warningStates[*ptr] = WARNING_ENABLED;
			}

			return;
		}
	}

	// If it's not a meta warning, specially check against `-Werror`
	if (!strncmp(flag, "error", strlen("error"))) {
		char *errorFlag = flag + strlen("error");

		switch (*errorFlag) {
		case '\0':
			// `-Werror`
			warningsAreErrors = true;
			return;

		case '=':
			// `-Werror=XXX`
			setError = true;
			processWarningFlag(errorFlag + 1); // Skip the `=`
			setError = false;
			return;

		// Otherwise, allow parsing as another flag
		}
	}

	// Well, it's either a normal warning or a mistake

	enum WarningState state = setError ? WARNING_ERROR :
				  // Not an error, then check if this is a negation
				  strncmp(flag, "no-", strlen("no-")) ? WARNING_ENABLED
								      : WARNING_DISABLED;
	char const *rootFlag = state == WARNING_DISABLED ? flag + strlen("no-") : flag;

	// Is this a "parametric" warning?
	if (state != WARNING_DISABLED) { // The `no-` form cannot be parametrized
		// First, check if there is an "equals" sign followed by a decimal number
		char *equals = strchr(rootFlag, '=');

		if (equals && equals[1] != '\0') { // Ignore an equal sign at the very end as well
			// Is the rest of the string a decimal number?
			// We want to avoid `strtoul`'s whitespace and sign, so we parse manually
			uint8_t param = 0;
			char const *ptr = equals + 1;
			bool warned = false;

			// The `if`'s condition above ensures that this will run at least once
			do {
				// If we don't have a digit, bail
				if (*ptr < '0' || *ptr > '9')
					break;
				// Avoid overflowing!
				if (param > UINT8_MAX - (*ptr - '0')) {
					if (!warned)
						warnx("Invalid warning flag \"%s\": capping parameter at 255\n",
						      flag);
					warned = true; // Only warn once, cap always
					param = 255;
					continue;
				}
				param = param * 10 + (*ptr - '0');

				ptr++;
			} while (*ptr);

			// If we managed to the end of the string, check that the warning indeed
			// accepts a parameter
			if (*ptr == '\0') {
				if (setError && param == 0) {
					warnx("Ignoring nonsensical warning flag \"%s\"\n", flag);
					return;
				}
				*equals = '\0'; // Truncate the param at the '='
				if (tryProcessParamWarning(rootFlag, param,
							   param == 0 ? WARNING_DISABLED : state))
					return;
			}
		}
	}

	// Try to match the flag against a "normal" flag
	for (enum WarningID id = 0; id < NB_PLAIN_WARNINGS; id++) {
		if (!strcmp(rootFlag, warningFlags[id])) {
			// We got a match!
			warningStates[id] = state;
			return;
		}
	}

	// Lastly, this might be a "parametric" warning without an equals sign
	// If it is, treat the param as 1 if enabling, or 0 if disabling
	if (tryProcessParamWarning(rootFlag, 0, state))
		return;

	warnx("Unknown warning `%s`", flag);
}

void printDiag(char const *fmt, va_list args, char const *type,
	       char const *flagfmt, char const *flag)
{
	fputs(type, stderr);
	fstk_DumpCurrent();
	fprintf(stderr, flagfmt, flag);
	vfprintf(stderr, fmt, args);
	lexer_DumpStringExpansions();
}

void error(char const *fmt, ...)
{
	va_list args;

	va_start(args, fmt);
	printDiag(fmt, args, "error: ", ":\n    ", NULL);
	va_end(args);
	nbErrors++;
}

_Noreturn void fatalerror(char const *fmt, ...)
{
	va_list args;

	va_start(args, fmt);
	printDiag(fmt, args, "FATAL: ", ":\n    ", NULL);
	va_end(args);

	exit(1);
}

void warning(enum WarningID id, char const *fmt, ...)
{
	char const *flag = warningFlags[id];
	va_list args;

	va_start(args, fmt);

	switch (warningState(id)) {
	case WARNING_DISABLED:
		return;

	case WARNING_ERROR:
		printDiag(fmt, args, "error: ", ": [-Werror=%s]\n    ", flag);
		va_end(args);
		return;

	case WARNING_DEFAULT:
		unreachable_();
		// Not reached

	case WARNING_ENABLED:
		break;
	}

	printDiag(fmt, args, "warning: ", ": [-W%s]\n    ", flag);

	va_end(args);
}
