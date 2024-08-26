/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2018, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#ifndef RGBDS_ASM_RPN_H
#define RGBDS_ASM_RPN_H

#include <stdint.h>
#include <stdbool.h>

#include "linkdefs.h"

#define MAXRPNLEN 1048576

struct Expression {
	int32_t  val;          // If the expression's value is known, it's here
	char     *reason;      // Why the expression is not known, if it isn't
	bool     isKnown;      // Whether the expression's value is known
	bool     isSymbol;     // Whether the expression represents a symbol
	uint8_t  *rpn;         // Array of bytes serializing the RPN expression
	uint32_t rpnCapacity;  // Size of the `rpn` buffer
	uint32_t rpnLength;    // Used size of the `rpn` buffer
	uint32_t rpnPatchSize; // Size the expression will take in the object file
};

// Determines if an expression is known at assembly time
static inline bool rpn_isKnown(struct Expression const *expr)
{
	return expr->isKnown;
}

// Determines if an expression is a symbol suitable for const diffing
static inline bool rpn_isSymbol(const struct Expression *expr)
{
	return expr->isSymbol;
}

void rpn_Symbol(struct Expression *expr, char const *symName);
void rpn_Number(struct Expression *expr, uint32_t i);
void rpn_LOGNOT(struct Expression *expr, const struct Expression *src);
struct Symbol const *rpn_SymbolOf(struct Expression const *expr);
bool rpn_IsDiffConstant(struct Expression const *src, struct Symbol const *symName);
void rpn_BinaryOp(enum RPNCommand op, struct Expression *expr,
		  const struct Expression *src1,
		  const struct Expression *src2);
void rpn_HIGH(struct Expression *expr, const struct Expression *src);
void rpn_LOW(struct Expression *expr, const struct Expression *src);
void rpn_ISCONST(struct Expression *expr, const struct Expression *src);
void rpn_UNNEG(struct Expression *expr, const struct Expression *src);
void rpn_UNNOT(struct Expression *expr, const struct Expression *src);
void rpn_BankSymbol(struct Expression *expr, char const *symName);
void rpn_BankSection(struct Expression *expr, char const *sectionName);
void rpn_BankSelf(struct Expression *expr);
void rpn_SizeOfSection(struct Expression *expr, char const *sectionName);
void rpn_StartOfSection(struct Expression *expr, char const *sectionName);
void rpn_Free(struct Expression *expr);
void rpn_CheckHRAM(struct Expression *expr, const struct Expression *src);
void rpn_CheckRST(struct Expression *expr, const struct Expression *src);
void rpn_CheckNBit(struct Expression const *expr, uint8_t n);
int32_t rpn_GetConstVal(struct Expression const *expr);

#endif // RGBDS_ASM_RPN_H
