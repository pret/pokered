/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2020, RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#include <assert.h>
#include <inttypes.h>
#include <math.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "asm/fixpoint.h"
#include "asm/format.h"
#include "asm/warning.h"

struct FormatSpec fmt_NewSpec(void)
{
	struct FormatSpec fmt = {0};

	return fmt;
}

bool fmt_IsEmpty(struct FormatSpec const *fmt)
{
	return !fmt->state;
}

bool fmt_IsValid(struct FormatSpec const *fmt)
{
	return fmt->valid || fmt->state == FORMAT_DONE;
}

bool fmt_IsFinished(struct FormatSpec const *fmt)
{
	return fmt->state >= FORMAT_DONE;
}

void fmt_UseCharacter(struct FormatSpec *fmt, int c)
{
	if (fmt->state == FORMAT_INVALID)
		return;

	switch (c) {
	// sign
	case ' ':
	case '+':
		if (fmt->state > FORMAT_SIGN)
			goto invalid;
		fmt->state = FORMAT_PREFIX;
		fmt->sign = c;
		break;

	// prefix
	case '#':
		if (fmt->state > FORMAT_PREFIX)
			goto invalid;
		fmt->state = FORMAT_ALIGN;
		fmt->prefix = true;
		break;

	// align
	case '-':
		if (fmt->state > FORMAT_ALIGN)
			goto invalid;
		fmt->state = FORMAT_WIDTH;
		fmt->alignLeft = true;
		break;

	// pad and width
	case '0':
		if (fmt->state < FORMAT_WIDTH)
			fmt->padZero = true;
		// fallthrough
	case '1':
	case '2':
	case '3':
	case '4':
	case '5':
	case '6':
	case '7':
	case '8':
	case '9':
		if (fmt->state < FORMAT_WIDTH) {
			fmt->state = FORMAT_WIDTH;
			fmt->width = c - '0';
		} else if (fmt->state == FORMAT_WIDTH) {
			fmt->width = fmt->width * 10 + (c - '0');
		} else if (fmt->state == FORMAT_FRAC) {
			fmt->fracWidth = fmt->fracWidth * 10 + (c - '0');
		} else {
			goto invalid;
		}
		break;

	case '.':
		if (fmt->state > FORMAT_WIDTH)
			goto invalid;
		fmt->state = FORMAT_FRAC;
		fmt->hasFrac = true;
		break;

	// type
	case 'd':
	case 'u':
	case 'X':
	case 'x':
	case 'b':
	case 'o':
	case 'f':
	case 's':
		if (fmt->state >= FORMAT_DONE)
			goto invalid;
		fmt->state = FORMAT_DONE;
		fmt->valid = true;
		fmt->type = c;
		break;

	default:
invalid:
		fmt->state = FORMAT_INVALID;
		fmt->valid = false;
	}
}

void fmt_FinishCharacters(struct FormatSpec *fmt)
{
	if (!fmt_IsValid(fmt))
		fmt->state = FORMAT_INVALID;
}

void fmt_PrintString(char *buf, size_t bufLen, struct FormatSpec const *fmt, char const *value)
{
	if (fmt->sign)
		error("Formatting string with sign flag '%c'\n", fmt->sign);
	if (fmt->prefix)
		error("Formatting string with prefix flag '#'\n");
	if (fmt->padZero)
		error("Formatting string with padding flag '0'\n");
	if (fmt->hasFrac)
		error("Formatting string with fractional width\n");
	if (fmt->type != 's')
		error("Formatting string as type '%c'\n", fmt->type);

	size_t len = strlen(value);
	size_t totalLen = fmt->width > len ? fmt->width : len;

	if (totalLen > bufLen - 1) { // bufLen includes terminator
		error("Formatted string value too long\n");
		totalLen = bufLen - 1;
		if (len > totalLen)
			len = totalLen;
	}
	assert(len < bufLen && totalLen < bufLen && len <= totalLen);

	size_t padLen = totalLen - len;

	if (fmt->alignLeft) {
		memcpy(buf, value, len);
		for (size_t i = len; i < totalLen; i++)
			buf[i] = ' ';
	} else {
		for (size_t i = 0; i < padLen; i++)
			buf[i] = ' ';
		memcpy(buf + padLen, value, len);
	}

	buf[totalLen] = '\0';
}

void fmt_PrintNumber(char *buf, size_t bufLen, struct FormatSpec const *fmt, uint32_t value)
{
	if (fmt->type != 'X' && fmt->type != 'x' && fmt->type != 'b' && fmt->type != 'o'
	    && fmt->prefix)
		error("Formatting type '%c' with prefix flag '#'\n", fmt->type);
	if (fmt->type != 'f' && fmt->hasFrac)
		error("Formatting type '%c' with fractional width\n", fmt->type);
	if (fmt->type == 's')
		error("Formatting number as type 's'\n");

	char sign = fmt->sign; // 0 or ' ' or '+'

	if (fmt->type == 'd' || fmt->type == 'f') {
		int32_t v = value;

		if (v < 0 && v != INT32_MIN) {
			sign = '-';
			value = -v;
		}
	}

	char prefix = !fmt->prefix ? 0
		: fmt->type == 'X' ? '$'
		: fmt->type == 'x' ? '$'
		: fmt->type == 'b' ? '%'
		: fmt->type == 'o' ? '&'
		: 0;

	char valueBuf[262]; // Max 5 digits + decimal + 255 fraction digits + terminator

	if (fmt->type == 'b') {
		// Special case for binary
		char *ptr = valueBuf;

		do {
			*ptr++ = (value & 1) + '0';
			value >>= 1;
		} while (value);

		*ptr = '\0';

		// Reverse the digits
		size_t valueLen = ptr - valueBuf;

		for (size_t i = 0, j = valueLen - 1; i < j; i++, j--) {
			char c = valueBuf[i];

			valueBuf[i] = valueBuf[j];
			valueBuf[j] = c;
		}
	} else if (fmt->type == 'f') {
		// Special case for fixed-point

		// Default fractional width (C's is 6 for "%f"; here 5 is enough for Q16.16)
		size_t fracWidth = fmt->hasFrac ? fmt->fracWidth : 5;

		if (fracWidth > 255) {
			error("Fractional width %zu too long, limiting to 255\n",
			      fracWidth);
			fracWidth = 255;
		}

		snprintf(valueBuf, sizeof(valueBuf), "%.*f", (int)fracWidth,
			 value / fix_PrecisionFactor());
	} else {
		char const *spec = fmt->type == 'd' ? "%" PRId32
				 : fmt->type == 'u' ? "%" PRIu32
				 : fmt->type == 'X' ? "%" PRIX32
				 : fmt->type == 'x' ? "%" PRIx32
				 : fmt->type == 'o' ? "%" PRIo32
				 : "%" PRId32;

		snprintf(valueBuf, sizeof(valueBuf), spec, value);
	}

	size_t len = strlen(valueBuf);
	size_t numLen = (sign != 0) + (prefix != 0) + len;
	size_t totalLen = fmt->width > numLen ? fmt->width : numLen;

	if (totalLen > bufLen - 1) { // bufLen includes terminator
		error("Formatted numeric value too long\n");
		totalLen = bufLen - 1;
		if (numLen > totalLen) {
			len -= numLen - totalLen;
			numLen = totalLen;
		}
	}
	assert(numLen < bufLen && totalLen < bufLen && numLen <= totalLen && len <= numLen);

	size_t padLen = totalLen - numLen;
	size_t pos = 0;

	if (fmt->alignLeft) {
		if (sign)
			buf[pos++] = sign;
		if (prefix)
			buf[pos++] = prefix;
		memcpy(buf + pos, valueBuf, len);
		for (size_t i = pos + len; i < totalLen; i++)
			buf[i] = ' ';
	} else {
		if (fmt->padZero) {
			// sign, then prefix, then zero padding
			if (sign)
				buf[pos++] = sign;
			if (prefix)
				buf[pos++] = prefix;
			for (size_t i = 0; i < padLen; i++)
				buf[pos++] = '0';
		} else {
			// space padding, then sign, then prefix
			for (size_t i = 0; i < padLen; i++)
				buf[pos++] = ' ';
			if (sign)
				buf[pos++] = sign;
			if (prefix)
				buf[pos++] = prefix;
		}
		memcpy(buf + pos, valueBuf, len);
	}

	buf[totalLen] = '\0';
}
