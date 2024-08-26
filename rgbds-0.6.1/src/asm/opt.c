/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2022, RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#include <ctype.h>
#include <errno.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "asm/fixpoint.h"
#include "asm/fstack.h"
#include "asm/lexer.h"
#include "asm/main.h"
#include "asm/section.h"
#include "asm/warning.h"

struct OptStackEntry {
	char binary[2];
	char gbgfx[4];
	uint8_t fixPrecision;
	uint8_t fillByte;
	bool haltnop;
	bool warnOnHaltNop;
	bool optimizeLoads;
	bool warnOnLdOpt;
	bool warningsAreErrors;
	size_t maxRecursionDepth;
	// Don't be confused: we use the size of the **global variable** `warningStates`!
	enum WarningState warningStates[sizeof(warningStates)];
	struct OptStackEntry *next;
};

static struct OptStackEntry *stack = NULL;

void opt_B(char const chars[2])
{
	lexer_SetBinDigits(chars);
}

void opt_G(char const chars[4])
{
	lexer_SetGfxDigits(chars);
}

void opt_P(uint8_t padByte)
{
	fillByte = padByte;
}

void opt_Q(uint8_t precision)
{
	fixPrecision = precision;
}

void opt_R(size_t newDepth)
{
	fstk_NewRecursionDepth(newDepth);
	lexer_CheckRecursionDepth();
}

void opt_H(bool warn)
{
	warnOnHaltNop = warn;
}

void opt_h(bool halt)
{
	haltnop = halt;
}

void opt_L(bool optimize)
{
	optimizeLoads = optimize;
}

void opt_l(bool warn)
{
	warnOnLdOpt = warn;
}

void opt_W(char *flag)
{
	processWarningFlag(flag);
}

void opt_Parse(char *s)
{
	switch (s[0]) {
	case 'b':
		if (strlen(&s[1]) == 2)
			opt_B(&s[1]);
		else
			error("Must specify exactly 2 characters for option 'b'\n");
		break;

	case 'g':
		if (strlen(&s[1]) == 4)
			opt_G(&s[1]);
		else
			error("Must specify exactly 4 characters for option 'g'\n");
		break;

	case 'p':
		if (strlen(&s[1]) <= 2) {
			int result;
			unsigned int padByte;

			result = sscanf(&s[1], "%x", &padByte);
			if (result != 1)
				error("Invalid argument for option 'p'\n");
			else if (padByte > 0xFF)
				error("Argument for option 'p' must be between 0 and 0xFF\n");
			else
				opt_P(padByte);
		} else {
			error("Invalid argument for option 'p'\n");
		}
		break;

		const char *precisionArg;
	case 'Q':
		precisionArg = &s[1];
		if (precisionArg[0] == '.')
			precisionArg++;
		if (strlen(precisionArg) <= 2) {
			int result;
			unsigned int precision;

			result = sscanf(precisionArg, "%u", &precision);
			if (result != 1)
				error("Invalid argument for option 'Q'\n");
			else if (precision < 1 || precision > 31)
				error("Argument for option 'Q' must be between 1 and 31\n");
			else
				opt_Q(precision);
		} else {
			error("Invalid argument for option 'Q'\n");
		}
		break;

	case 'r': {
		++s; // Skip 'r'
		while (isblank(*s))
			++s; // Skip leading whitespace

		if (s[0] == '\0') {
			error("Missing argument to option 'r'\n");
			break;
		}

		char *endptr;
		unsigned long newDepth = strtoul(s, &endptr, 10);

		if (*endptr != '\0') {
			error("Invalid argument to option 'r' (\"%s\")\n", s);
		} else if (errno == ERANGE) {
			error("Argument to 'r' is out of range (\"%s\")\n", s);
		} else {
			opt_R(newDepth);
		}
		break;
	}

	case 'H':
		if (s[1] == '\0')
			opt_H(false);
		else
			error("Option 'H' does not take an argument\n");
		break;

	case 'h':
		if (s[1] == '\0')
			opt_h(false);
		else
			error("Option 'h' does not take an argument\n");
		break;

	case 'L':
		if (s[1] == '\0')
			opt_L(false);
		else
			error("Option 'L' does not take an argument\n");
		break;

	case 'l':
		if (s[1] == '\0')
			opt_l(false);
		else
			error("Option 'l' does not take an argument\n");
		break;

	case 'W':
		if (strlen(&s[1]) > 0)
			opt_W(&s[1]);
		else
			error("Must specify an argument for option 'W'\n");
		break;

	case '!': // negates flag options that do not take an argument
		switch (s[1]) {
		case 'H':
			if (s[2] == '\0')
				opt_H(true);
			else
				error("Option '!H' does not take an argument\n");
			break;

		case 'h':
			if (s[2] == '\0')
				opt_h(true);
			else
				error("Option '!h' does not take an argument\n");
			break;

		case 'L':
			if (s[2] == '\0')
				opt_L(true);
			else
				error("Option '!L' does not take an argument\n");
			break;

		case 'l':
			if (s[2] == '\0')
				opt_l(true);
			else
				error("Option '!l' does not take an argument\n");
			break;

		default:
			error("Unknown option '!%c'\n", s[1]);
			break;
		}
		break;

	default:
		error("Unknown option '%c'\n", s[0]);
		break;
	}
}

void opt_Push(void)
{
	struct OptStackEntry *entry = malloc(sizeof(*entry));

	if (entry == NULL)
		fatalerror("Failed to alloc option stack entry: %s\n", strerror(errno));

	// Both of these pulled from lexer.h
	entry->binary[0] = binDigits[0];
	entry->binary[1] = binDigits[1];

	entry->gbgfx[0] = gfxDigits[0];
	entry->gbgfx[1] = gfxDigits[1];
	entry->gbgfx[2] = gfxDigits[2];
	entry->gbgfx[3] = gfxDigits[3];

	entry->fixPrecision = fixPrecision; // Pulled from fixpoint.h

	entry->fillByte = fillByte; // Pulled from section.h

	entry->haltnop = haltnop; // Pulled from main.h
	entry->warnOnHaltNop = warnOnHaltNop;

	entry->optimizeLoads = optimizeLoads; // Pulled from main.h
	entry->warnOnLdOpt = warnOnLdOpt;

	// Both of these pulled from warning.h
	entry->warningsAreErrors = warningsAreErrors;
	memcpy(entry->warningStates, warningStates, sizeof(warningStates));

	entry->next = stack;
	stack = entry;
}

void opt_Pop(void)
{
	if (stack == NULL) {
		error("No entries in the option stack\n");
		return;
	}

	struct OptStackEntry *entry = stack;

	opt_B(entry->binary);
	opt_G(entry->gbgfx);
	opt_P(entry->fillByte);
	opt_Q(entry->fixPrecision);
	opt_H(entry->warnOnHaltNop);
	opt_h(entry->haltnop);
	opt_L(entry->optimizeLoads);
	opt_l(entry->warnOnLdOpt);

	// opt_W does not apply a whole warning state; it processes one flag string
	warningsAreErrors = entry->warningsAreErrors;
	memcpy(warningStates, entry->warningStates, sizeof(warningStates));

	stack = entry->next;
	free(entry);
}
