/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2020, RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#ifndef RGBDS_FORMAT_SPEC_H
#define RGBDS_FORMAT_SPEC_H

#include <stdbool.h>
#include <stdint.h>

enum FormatState {
	FORMAT_SIGN,    // expects '+' or ' ' (optional)
	FORMAT_PREFIX,  // expects '#' (optional)
	FORMAT_ALIGN,   // expects '-' (optional)
	FORMAT_WIDTH,   // expects '0'-'9', max 255 (optional) (leading '0' indicates pad)
	FORMAT_FRAC,    // got '.', expects '0'-'9', max 255 (optional)
	FORMAT_DONE,    // got [duXxbofs] (required)
	FORMAT_INVALID, // got unexpected character
};

struct FormatSpec {
	enum FormatState state;
	int sign;
	bool prefix;
	bool alignLeft;
	bool padZero;
	size_t width;
	bool hasFrac;
	size_t fracWidth;
	int type;
	bool valid;
};

struct StrFmtArg {
	union {
		uint32_t number;
		char *string;
	};
	bool isNumeric;
};

#define INITIAL_STRFMT_ARG_SIZE 4
struct StrFmtArgList {
	char *format;
	size_t nbArgs;
	size_t capacity;
	struct StrFmtArg *args;
};

struct FormatSpec fmt_NewSpec(void);
bool fmt_IsEmpty(struct FormatSpec const *fmt);
bool fmt_IsValid(struct FormatSpec const *fmt);
bool fmt_IsFinished(struct FormatSpec const *fmt);
void fmt_UseCharacter(struct FormatSpec *fmt, int c);
void fmt_FinishCharacters(struct FormatSpec *fmt);
void fmt_PrintString(char *buf, size_t bufLen, struct FormatSpec const *fmt, char const *value);
void fmt_PrintNumber(char *buf, size_t bufLen, struct FormatSpec const *fmt, uint32_t value);

#endif // RGBDS_FORMAT_SPEC_H
