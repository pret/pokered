/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2005-2021, Rich Felker and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#include <errno.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "error.h"
#include "platform.h"

static void vwarn(char const NONNULL(fmt), va_list ap)
{
	fprintf(stderr, "warning: ");
	vfprintf(stderr, fmt, ap);
	fputs(": ", stderr);
	perror(NULL);
}

static void vwarnx(char const NONNULL(fmt), va_list ap)
{
	fprintf(stderr, "warning");
	fputs(": ", stderr);
	vfprintf(stderr, fmt, ap);
	putc('\n', stderr);
}

_Noreturn static void verr(char const NONNULL(fmt), va_list ap)
{
	fprintf(stderr, "error: ");
	vfprintf(stderr, fmt, ap);
	fputs(": ", stderr);
	fputs(strerror(errno), stderr);
	putc('\n', stderr);
	exit(1);
}

_Noreturn static void verrx(char const NONNULL(fmt), va_list ap)
{
	fprintf(stderr, "error");
	fputs(": ", stderr);
	vfprintf(stderr, fmt, ap);
	putc('\n', stderr);
	exit(1);
}

void warn(char const NONNULL(fmt), ...)
{
	va_list ap;

	va_start(ap, fmt);
	vwarn(fmt, ap);
	va_end(ap);
}

void warnx(char const NONNULL(fmt), ...)
{
	va_list ap;

	va_start(ap, fmt);
	vwarnx(fmt, ap);
	va_end(ap);
}

_Noreturn void err(char const NONNULL(fmt), ...)
{
	va_list ap;

	va_start(ap, fmt);
	verr(fmt, ap);
	va_end(ap);
}

_Noreturn void errx(char const NONNULL(fmt), ...)
{
	va_list ap;

	va_start(ap, fmt);
	verrx(fmt, ap);
	va_end(ap);
}
