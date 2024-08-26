/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2017-2018, Antonio Nino Diaz and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#include <stdio.h>
#include <string.h>

#include "helpers.h"
#include "version.h"

// This variable is passed via `-D` from the Makefile, but not from CMake
// (in which `configure_file()` is used on this file to replace some syntax)
#ifndef BUILD_VERSION_STRING
// CMake-specific syntax here
#define BUILD_VERSION_STRING "@GIT_REV@"
#endif

char const *get_package_version_string(void)
{
	// The following conditional should be simplified by the compiler.
	if (strlen(BUILD_VERSION_STRING) == 0) {
		// Fallback if version string can't be obtained from Git
#ifndef PACKAGE_VERSION_RC
		return "v" EXPAND_AND_STR(PACKAGE_VERSION_MAJOR)
			"." EXPAND_AND_STR(PACKAGE_VERSION_MINOR)
			"." EXPAND_AND_STR(PACKAGE_VERSION_PATCH);
#else
		return "v" EXPAND_AND_STR(PACKAGE_VERSION_MAJOR)
			"." EXPAND_AND_STR(PACKAGE_VERSION_MINOR)
			"." EXPAND_AND_STR(PACKAGE_VERSION_PATCH)
			"-rc" EXPAND_AND_STR(PACKAGE_VERSION_RC);
#endif
	} else {
		return BUILD_VERSION_STRING;
	}
}
