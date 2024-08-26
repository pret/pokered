/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2019, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

// Declarations that all modules use, as well as `main` and related
#ifndef RGBDS_LINK_MAIN_H
#define RGBDS_LINK_MAIN_H

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include "helpers.h"

// Variables related to CLI options
extern bool isDmgMode;
extern char       *linkerScriptName;
extern char const *mapFileName;
extern bool noSymInMap;
extern char const *symFileName;
extern char const *overlayFileName;
extern char const *outputFileName;
extern uint8_t padValue;
extern uint16_t scrambleROMX;
extern uint8_t scrambleWRAMX;
extern uint8_t scrambleSRAM;
extern bool is32kMode;
extern bool beVerbose;
extern bool isWRA0Mode;
extern bool disablePadding;

struct FileStackNode {
	struct FileStackNode *parent;
	// Line at which the parent context was exited; meaningless for the root level
	uint32_t lineNo;

	enum {
		NODE_REPT,
		NODE_FILE,
		NODE_MACRO,
	} type;
	union {
		char *name; // NODE_FILE, NODE_MACRO
		struct { // NODE_REPT
			uint32_t reptDepth;
			uint32_t *iters;
		};
	};
};

// Helper macro for printing verbose-mode messages
#define verbosePrint(...)   do { \
					if (beVerbose) \
						fprintf(stderr, __VA_ARGS__); \
				} while (0)

/*
 * Dump a file stack to stderr
 * @param node The leaf node to dump the context of
 */
char const *dumpFileStack(struct FileStackNode const *node);

void warning(struct FileStackNode const *where, uint32_t lineNo,
	     char const *fmt, ...) format_(printf, 3, 4);

void error(struct FileStackNode const *where, uint32_t lineNo,
	   char const *fmt, ...) format_(printf, 3, 4);

_Noreturn void fatal(struct FileStackNode const *where, uint32_t lineNo,
		     char const *fmt, ...) format_(printf, 3, 4);

/*
 * Opens a file if specified, and aborts on error.
 * @param fileName The name of the file to open; if NULL, no file will be opened
 * @param mode The mode to open the file with
 * @return A pointer to a valid FILE structure, or NULL if fileName was NULL
 */
FILE *openFile(char const *fileName, char const *mode);

#define closeFile(file) do { \
				FILE *tmp = file; \
				if (tmp) \
					fclose(tmp); \
			} while (0)

#endif // RGBDS_LINK_MAIN_H
