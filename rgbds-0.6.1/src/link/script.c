/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2019, Eldred Habert and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#include <ctype.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "link/main.h"
#include "link/script.h"
#include "link/section.h"

#include "error.h"
#include "linkdefs.h"

FILE *linkerScript;
char *includeFileName;

static uint32_t lineNo;

static struct {
	FILE *file;
	uint32_t lineNo;
	char *name;
} *fileStack;

static uint32_t fileStackSize;
static uint32_t fileStackIndex;

static void pushFile(char *newFileName)
{
	if (fileStackIndex == UINT32_MAX)
		errx("%s(%" PRIu32 "): INCLUDE recursion limit reached",
		     linkerScriptName, lineNo);

	if (fileStackIndex == fileStackSize) {
		if (!fileStackSize) // Init file stack
			fileStackSize = 4;
		fileStackSize *= 2;
		fileStack = realloc(fileStack, sizeof(*fileStack) * fileStackSize);
		if (!fileStack)
			err("%s(%" PRIu32 "): Internal INCLUDE error",
			    linkerScriptName, lineNo);
	}

	fileStack[fileStackIndex].file = linkerScript;
	fileStack[fileStackIndex].lineNo = lineNo;
	fileStack[fileStackIndex].name = linkerScriptName;
	fileStackIndex++;

	linkerScript = fopen(newFileName, "r");
	if (!linkerScript)
		err("%s(%" PRIu32 "): Could not open \"%s\"",
		    linkerScriptName, lineNo, newFileName);
	lineNo = 1;
	linkerScriptName = newFileName;
}

static bool popFile(void)
{
	if (!fileStackIndex)
		return false;

	free(linkerScriptName);

	fileStackIndex--;
	linkerScript = fileStack[fileStackIndex].file;
	lineNo = fileStack[fileStackIndex].lineNo;
	linkerScriptName = fileStack[fileStackIndex].name;

	return true;
}

static bool isWhiteSpace(int c)
{
	return c == ' ' || c == '\t';
}

static bool isNewline(int c)
{
	return c == '\r' || c == '\n';
}

/*
 * Try parsing a number, in base 16 if it begins with a dollar,
 * in base 10 otherwise
 * @param str The number to parse
 * @param number A pointer where the number will be written to
 * @return True if parsing was successful, false otherwise
 */
static bool tryParseNumber(char const *str, uint32_t *number)
{
	static char const digits[] = {
		'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
		'A', 'B', 'C', 'D', 'E', 'F'
	};
	uint8_t base = 10;

	if (*str == '$') {
		str++;
		base = 16;
	}

	// An empty string is not a number
	if (!*str)
		return false;

	*number = 0;
	do {
		char chr = toupper(*str++);
		uint8_t digit = 0;

		while (digit < base) {
			if (chr == digits[digit])
				break;
			digit++;
		}
		if (digit == base)
			return false;
		*number = *number * base + digit;
	} while (*str);

	return true;
}

enum LinkerScriptTokenType {
	TOKEN_NEWLINE,
	TOKEN_COMMAND,
	TOKEN_BANK,
	TOKEN_INCLUDE,
	TOKEN_NUMBER,
	TOKEN_STRING,
	TOKEN_EOF,

	TOKEN_INVALID
};

char const *tokenTypes[] = {
	[TOKEN_NEWLINE] = "newline",
	[TOKEN_COMMAND] = "command",
	[TOKEN_BANK]    = "bank command",
	[TOKEN_NUMBER]  = "number",
	[TOKEN_STRING]  = "string",
	[TOKEN_EOF]     = "end of file"
};

enum LinkerScriptCommand {
	COMMAND_ORG,
	COMMAND_ALIGN,

	COMMAND_INVALID
};

struct LinkerScriptToken {
	enum LinkerScriptTokenType type;
	union LinkerScriptTokenAttr {
		enum LinkerScriptCommand command;
		enum SectionType secttype;
		uint32_t number;
		char *string;
	} attr;
};

static char const * const commands[] = {
	[COMMAND_ORG] = "ORG",
	[COMMAND_ALIGN] = "ALIGN"
};

static int nextChar(void)
{
	int curchar = getc(linkerScript);

	if (curchar == EOF && ferror(linkerScript))
		err("%s(%" PRIu32 "): Unexpected error in %s",
		    linkerScriptName, lineNo, __func__);
	return curchar;
}

static struct LinkerScriptToken *nextToken(void)
{
	static struct LinkerScriptToken token;
	int curchar;

	// If the token has a string, make sure to avoid leaking it
	if (token.type == TOKEN_STRING)
		free(token.attr.string);

	// Skip initial whitespace...
	do
		curchar = nextChar();
	while (isWhiteSpace(curchar));

	// If this is a comment, skip to the end of the line
	if (curchar == ';') {
		do {
			curchar = nextChar();
		} while (!isNewline(curchar) && curchar != EOF);
	}

	if (curchar == EOF) {
		token.type = TOKEN_EOF;
	} else if (isNewline(curchar)) {
		// If we have a newline char, this is a newline token
		token.type = TOKEN_NEWLINE;

		if (curchar == '\r') {
			// Handle CRLF
			curchar = nextChar();
			if (curchar != '\n')
				ungetc(curchar, linkerScript);
		}
	} else if (curchar == '"') {
		// If we have a string start, this is a string
		token.type = TOKEN_STRING;
		token.attr.string = NULL; // Force initial alloc

		size_t size = 0;
		size_t capacity = 16; // Half of the default capacity

		do {
			curchar = nextChar();
			if (curchar == EOF || isNewline(curchar)) {
				errx("%s(%" PRIu32 "): Unterminated string",
				     linkerScriptName, lineNo);
			} else if (curchar == '"') {
				// Quotes force a string termination
				curchar = '\0';
			} else if (curchar == '\\') {
				// Backslashes are escape sequences
				curchar = nextChar();
				if (curchar == EOF || isNewline(curchar))
					errx("%s(%" PRIu32 "): Unterminated string",
					     linkerScriptName, lineNo);
				else if (curchar == 'n')
					curchar = '\n';
				else if (curchar == 'r')
					curchar = '\r';
				else if (curchar == 't')
					curchar = '\t';
				else if (curchar != '\\' && curchar != '"')
					errx("%s(%" PRIu32 "): Illegal character escape",
					     linkerScriptName, lineNo);
			}

			if (size >= capacity || token.attr.string == NULL) {
				capacity *= 2;
				token.attr.string = realloc(token.attr.string, capacity);
				if (!token.attr.string)
					err("%s: Failed to allocate memory for string",
					    __func__);
			}
			token.attr.string[size++] = curchar;
		} while (curchar);
	} else {
		// This is either a number, command or bank, that is: a word
		char *str = NULL;
		size_t size = 0;
		size_t capacity = 8; // Half of the default capacity

		for (;;) {
			if (size >= capacity || str == NULL) {
				capacity *= 2;
				str = realloc(str, capacity);
				if (!str)
					err("%s: Failed to allocate memory for token",
					    __func__);
			}
			str[size] = toupper(curchar);
			size++;

			if (!curchar)
				break;

			curchar = nextChar();
			// Whitespace, a newline or a comment end the token
			if (isWhiteSpace(curchar) || isNewline(curchar) || curchar == ';') {
				ungetc(curchar, linkerScript);
				curchar = '\0';
			}
		}

		token.type = TOKEN_INVALID;

		// Try to match a command
		for (enum LinkerScriptCommand i = 0; i < COMMAND_INVALID; i++) {
			if (!strcmp(commands[i], str)) {
				token.type = TOKEN_COMMAND;
				token.attr.command = i;
				break;
			}
		}

		if (token.type == TOKEN_INVALID) {
			// Try to match a bank specifier
			for (enum SectionType type = 0; type < SECTTYPE_INVALID; type++) {
				if (!strcmp(sectionTypeInfo[type].name, str)) {
					token.type = TOKEN_BANK;
					token.attr.secttype = type;
					break;
				}
			}
		}

		if (token.type == TOKEN_INVALID) {
			// Try to match an include token
			if (!strcmp("INCLUDE", str))
				token.type = TOKEN_INCLUDE;
		}

		if (token.type == TOKEN_INVALID) {
			// None of the strings matched, do we have a number?
			if (tryParseNumber(str, &token.attr.number))
				token.type = TOKEN_NUMBER;
			else
				errx("%s(%" PRIu32 "): Unknown token \"%s\"",
				     linkerScriptName, lineNo, str);
		}

		free(str);
	}

	return &token;
}

static void processCommand(enum LinkerScriptCommand command, uint16_t arg, uint16_t *pc)
{
	switch (command) {
	case COMMAND_INVALID:
		unreachable_();

	case COMMAND_ORG:
		break;

	case COMMAND_ALIGN:
		if (arg >= 16)
			arg = 0;
		else
			arg = (*pc + (1 << arg) - 1) & ~((1 << arg) - 1);
	}

	if (arg < *pc)
		errx("%s(%" PRIu32 "): `%s` cannot be used to go backwards (currently at $%x)",
		     linkerScriptName, lineNo, commands[command], *pc);
	*pc = arg;
}

enum LinkerScriptParserState {
	PARSER_FIRSTTIME,
	PARSER_LINESTART,
	PARSER_INCLUDE, // After an INCLUDE token
	PARSER_LINEEND
};

// Part of internal state, but has data that needs to be freed
static uint16_t *curaddr[SECTTYPE_INVALID];

// Put as global to ensure it's initialized only once
static enum LinkerScriptParserState parserState = PARSER_FIRSTTIME;

struct SectionPlacement *script_NextSection(void)
{
	static struct SectionPlacement placement;
	static uint32_t bank;
	static uint32_t bankID;

	if (parserState == PARSER_FIRSTTIME) {
		lineNo = 1;

		// Init PC for all banks
		for (enum SectionType i = 0; i < SECTTYPE_INVALID; i++) {
			curaddr[i] = malloc(sizeof(*curaddr[i]) * nbbanks(i));
			for (uint32_t b = 0; b < nbbanks(i); b++)
				curaddr[i][b] = sectionTypeInfo[i].startAddr;
		}

		placement.type = SECTTYPE_INVALID;

		parserState = PARSER_LINESTART;
	}

	for (;;) {
		struct LinkerScriptToken *token = nextToken();
		enum LinkerScriptTokenType tokType;
		union LinkerScriptTokenAttr attr;
		bool hasArg;
		uint32_t arg;

		if (placement.type != SECTTYPE_INVALID) {
			if (curaddr[placement.type][bankID] > endaddr(placement.type) + 1)
				errx("%s(%" PRIu32 "): Sections would extend past the end of %s ($%04" PRIx16 " > $%04" PRIx16 ")",
				     linkerScriptName, lineNo, sectionTypeInfo[placement.type].name,
				     curaddr[placement.type][bankID], endaddr(placement.type));
			if (curaddr[placement.type][bankID] < sectionTypeInfo[placement.type].startAddr)
				errx("%s(%" PRIu32 "): PC underflowed ($%04" PRIx16 " < $%04" PRIx16 ")",
				     linkerScriptName, lineNo,
				     curaddr[placement.type][bankID], sectionTypeInfo[placement.type].startAddr);
		}

		switch (parserState) {
		case PARSER_FIRSTTIME:
			unreachable_();

		case PARSER_LINESTART:
			switch (token->type) {
			case TOKEN_INVALID:
				unreachable_();

			case TOKEN_EOF:
				if (!popFile())
					return NULL;
				parserState = PARSER_LINEEND;
				break;

			case TOKEN_NUMBER:
				errx("%s(%" PRIu32 "): stray number \"%" PRIu32 "\"",
				     linkerScriptName, lineNo,
				     token->attr.number);

			case TOKEN_NEWLINE:
				lineNo++;
				break;

			// A stray string is a section name
			case TOKEN_STRING:
				parserState = PARSER_LINEEND;

				if (placement.type == SECTTYPE_INVALID)
					errx("%s(%" PRIu32 "): Didn't specify a location before the section",
					     linkerScriptName, lineNo);

				placement.section =
					sect_GetSection(token->attr.string);
				if (!placement.section)
					errx("%s(%" PRIu32 "): Unknown section \"%s\"",
					     linkerScriptName, lineNo,
					     token->attr.string);
				placement.org = curaddr[placement.type][bankID];
				placement.bank = bank;

				curaddr[placement.type][bankID] += placement.section->size;
				return &placement;

			case TOKEN_COMMAND:
			case TOKEN_BANK:
				tokType = token->type;
				attr = token->attr;

				token = nextToken();
				hasArg = token->type == TOKEN_NUMBER;
				// Leaving `arg` uninitialized when `!hasArg` causes GCC to warn
				// about its use as an argument to `processCommand`. This cannot
				// happen because `hasArg` has to be true, but silence the warning
				// anyways. I dislike doing this because it could swallow actual
				// errors, but I don't have a choice.
				arg = hasArg ? token->attr.number : 0;

				if (tokType == TOKEN_COMMAND) {
					if (placement.type == SECTTYPE_INVALID)
						errx("%s(%" PRIu32 "): Didn't specify a location before the command",
						     linkerScriptName, lineNo);
					if (!hasArg)
						errx("%s(%" PRIu32 "): Command specified without an argument",
						     linkerScriptName, lineNo);

					processCommand(attr.command, arg, &curaddr[placement.type][bankID]);
				} else { // TOKEN_BANK
					placement.type = attr.secttype;
					// If there's only one bank,
					// specifying the number is optional.
					if (!hasArg && nbbanks(placement.type) != 1)
						errx("%s(%" PRIu32 "): Didn't specify a bank number",
						     linkerScriptName, lineNo);
					else if (!hasArg)
						arg = sectionTypeInfo[placement.type].firstBank;
					else if (arg < sectionTypeInfo[placement.type].firstBank)
						errx("%s(%" PRIu32 "): specified bank number is too low (%" PRIu32 " < %" PRIu32 ")",
						     linkerScriptName, lineNo,
						     arg, sectionTypeInfo[placement.type].firstBank);
					else if (arg > sectionTypeInfo[placement.type].lastBank)
						errx("%s(%" PRIu32 "): specified bank number is too high (%" PRIu32 " > %" PRIu32 ")",
						     linkerScriptName, lineNo,
						     arg, sectionTypeInfo[placement.type].lastBank);
					bank = arg;
					bankID = arg - sectionTypeInfo[placement.type].firstBank;
				}

				// If we read a token we shouldn't have...
				if (token->type != TOKEN_NUMBER)
					goto lineend;
				break;

			case TOKEN_INCLUDE:
				parserState = PARSER_INCLUDE;
				break;
			}
			break;

		case PARSER_INCLUDE:
			if (token->type != TOKEN_STRING)
				errx("%s(%" PRIu32 "): Expected a file name after INCLUDE",
				     linkerScriptName, lineNo);

			// Switch to that file
			pushFile(token->attr.string);
			// The file stack took ownership of the string
			token->attr.string = NULL;

			parserState = PARSER_LINESTART;
			break;

		case PARSER_LINEEND:
lineend:
			lineNo++;
			parserState = PARSER_LINESTART;
			if (token->type == TOKEN_EOF) {
				if (!popFile())
					return NULL;
				parserState = PARSER_LINEEND;
			} else if (token->type != TOKEN_NEWLINE)
				errx("%s(%" PRIu32 "): Unexpected %s at the end of the line",
				     linkerScriptName, lineNo,
				     tokenTypes[token->type]);
			break;
		}
	}
}

void script_Cleanup(void)
{
	for (enum SectionType type = 0; type < SECTTYPE_INVALID; type++)
		free(curaddr[type]);
}
