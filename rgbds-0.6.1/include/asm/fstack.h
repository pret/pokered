/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2018, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

// Contains some assembler-wide defines and externs

#ifndef RGBDS_ASM_FSTACK_H
#define RGBDS_ASM_FSTACK_H

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

#include "asm/lexer.h"


struct FileStackNode {
	struct FileStackNode *parent; // Pointer to parent node, for error reporting
	// Line at which the parent context was exited; meaningless for the root level
	uint32_t lineNo;

	struct FileStackNode *next; // Next node in the output linked list
	bool referenced; // If referenced, don't free!
	uint32_t ID; // Set only if referenced: ID within the object file, -1 if not output yet

	enum {
		NODE_REPT,
		NODE_FILE,
		NODE_MACRO,
	} type;
};

struct FileStackReptNode { // NODE_REPT
	struct FileStackNode node;
	uint32_t reptDepth;
	// WARNING: if changing this type, change overflow check in `fstk_Init`
	uint32_t iters[]; // REPT iteration counts since last named node, in reverse depth order
};

struct FileStackNamedNode { // NODE_FILE, NODE_MACRO
	struct FileStackNode node;
	char name[]; // File name for files, file::macro name for macros
};

#define DEFAULT_MAX_DEPTH 64
extern size_t maxRecursionDepth;

struct MacroArgs;

void fstk_Dump(struct FileStackNode const *node, uint32_t lineNo);
void fstk_DumpCurrent(void);
struct FileStackNode *fstk_GetFileStack(void);
// The lifetime of the returned chars is until reaching the end of that file
char const *fstk_GetFileName(void);

void fstk_AddIncludePath(char const *s);
void fstk_SetPreIncludeFile(char const *s);
/*
 * @param path The user-provided file name
 * @param fullPath The address of a pointer, which will be made to point at the full path
 *                 The pointer's value must be a valid argument to `realloc`, including NULL
 * @param size Current size of the buffer, or 0 if the pointer is NULL
 * @return True if the file was found, false if no path worked
 */
bool fstk_FindFile(char const *path, char **fullPath, size_t *size);

bool yywrap(void);
void fstk_RunInclude(char const *path);
void fstk_RunMacro(char const *macroName, struct MacroArgs *args);
void fstk_RunRept(uint32_t count, int32_t reptLineNo, char *body, size_t size);
void fstk_RunFor(char const *symName, int32_t start, int32_t stop, int32_t step,
		     int32_t reptLineNo, char *body, size_t size);
void fstk_StopRept(void);
bool fstk_Break(void);

void fstk_NewRecursionDepth(size_t newDepth);
void fstk_Init(char const *mainPath, size_t maxDepth);

#endif // RGBDS_ASM_FSTACK_H
