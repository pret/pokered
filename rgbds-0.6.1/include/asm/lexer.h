/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2018, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#ifndef RGBDS_ASM_LEXER_H
#define RGBDS_ASM_LEXER_H

#include <stdbool.h>

#define MAXSTRLEN 255

struct LexerState;
extern struct LexerState *lexerState;
extern struct LexerState *lexerStateEOL;

static inline struct LexerState *lexer_GetState(void)
{
	return lexerState;
}

static inline void lexer_SetState(struct LexerState *state)
{
	lexerState = state;
}

static inline void lexer_SetStateAtEOL(struct LexerState *state)
{
	lexerStateEOL = state;
}

extern char binDigits[2];
extern char gfxDigits[4];

static inline void lexer_SetBinDigits(char const digits[2])
{
	binDigits[0] = digits[0];
	binDigits[1] = digits[1];
}

static inline void lexer_SetGfxDigits(char const digits[4])
{
	gfxDigits[0] = digits[0];
	gfxDigits[1] = digits[1];
	gfxDigits[2] = digits[2];
	gfxDigits[3] = digits[3];
}

// `path` is referenced, but not held onto..!
struct LexerState *lexer_OpenFile(char const *path);
struct LexerState *lexer_OpenFileView(char const *path, char *buf, size_t size, uint32_t lineNo);
void lexer_RestartRept(uint32_t lineNo);
void lexer_DeleteState(struct LexerState *state);
void lexer_Init(void);

enum LexerMode {
	LEXER_NORMAL,
	LEXER_RAW,
	LEXER_SKIP_TO_ELIF,
	LEXER_SKIP_TO_ENDC,
	LEXER_SKIP_TO_ENDR
};

void lexer_SetMode(enum LexerMode mode);
void lexer_ToggleStringExpansion(bool enable);

uint32_t lexer_GetIFDepth(void);
void lexer_IncIFDepth(void);
void lexer_DecIFDepth(void);
bool lexer_RanIFBlock(void);
bool lexer_ReachedELSEBlock(void);
void lexer_RunIFBlock(void);
void lexer_ReachELSEBlock(void);

struct CaptureBody {
	uint32_t lineNo;
	char *body;
	size_t size;
};

void lexer_CheckRecursionDepth(void);
char const *lexer_GetFileName(void);
uint32_t lexer_GetLineNo(void);
uint32_t lexer_GetColNo(void);
void lexer_DumpStringExpansions(void);
int yylex(void);
bool lexer_CaptureRept(struct CaptureBody *capture);
bool lexer_CaptureMacroBody(struct CaptureBody *capture);

#define INITIAL_DS_ARG_SIZE 2
struct DsArgList {
	size_t nbArgs;
	size_t capacity;
	struct Expression *args;
};

#endif // RGBDS_ASM_LEXER_H
