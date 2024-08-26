/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2018, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

// Controls RPN expressions for objectfiles

#include <assert.h>
#include <errno.h>
#include <inttypes.h>
#include <limits.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "asm/main.h"
#include "asm/output.h"
#include "asm/rpn.h"
#include "asm/section.h"
#include "asm/symbol.h"
#include "asm/warning.h"

#include "opmath.h"

// Makes an expression "not known", also setting its error message
#define makeUnknown(expr_, ...) do { \
	struct Expression *_expr = expr_; \
	_expr->isKnown = false; \
	/* If we had `asprintf` this would be great, but alas. */ \
	_expr->reason = malloc(128); /* Use an initial reasonable size */ \
	if (!_expr->reason) \
		fatalerror("Can't allocate err string: %s\n", strerror(errno)); \
	int size = snprintf(_expr->reason, 128, __VA_ARGS__); \
	if (size >= 128) { /* If this wasn't enough, try again */ \
		_expr->reason = realloc(_expr->reason, size + 1); \
		if (!_expr->reason) \
			fatalerror("Can't allocate err string: %s\n", strerror(errno)); \
		sprintf(_expr->reason, __VA_ARGS__); \
	} \
} while (0)

static uint8_t *reserveSpace(struct Expression *expr, uint32_t size)
{
	// This assumes the RPN length is always less than the capacity
	if (expr->rpnCapacity - expr->rpnLength < size) {
		// If there isn't enough room to reserve the space, realloc
		if (!expr->rpn)
			expr->rpnCapacity = 256; // Initial size
		while (expr->rpnCapacity - expr->rpnLength < size) {
			if (expr->rpnCapacity >= MAXRPNLEN)
				// To avoid generating humongous object files, cap the
				// size of RPN expressions
				fatalerror("RPN expression cannot grow larger than "
					   EXPAND_AND_STR(MAXRPNLEN) " bytes\n");
			else if (expr->rpnCapacity > MAXRPNLEN / 2)
				expr->rpnCapacity = MAXRPNLEN;
			else
				expr->rpnCapacity *= 2;
		}
		expr->rpn = realloc(expr->rpn, expr->rpnCapacity);

		if (!expr->rpn)
			fatalerror("Failed to grow RPN expression: %s\n", strerror(errno));
	}

	uint8_t *ptr = expr->rpn + expr->rpnLength;

	expr->rpnLength += size;
	return ptr;
}

// Init a RPN expression
static void rpn_Init(struct Expression *expr)
{
	expr->reason = NULL;
	expr->isKnown = true;
	expr->isSymbol = false;
	expr->rpn = NULL;
	expr->rpnCapacity = 0;
	expr->rpnLength = 0;
	expr->rpnPatchSize = 0;
}

// Free the RPN expression
void rpn_Free(struct Expression *expr)
{
	free(expr->rpn);
	free(expr->reason);
	rpn_Init(expr);
}

// Add symbols, constants and operators to expression
void rpn_Number(struct Expression *expr, uint32_t i)
{
	rpn_Init(expr);
	expr->val = i;
}

void rpn_Symbol(struct Expression *expr, char const *symName)
{
	struct Symbol *sym = sym_FindScopedSymbol(symName);

	if (sym_IsPC(sym) && !sect_GetSymbolSection()) {
		error("PC has no value outside a section\n");
		rpn_Number(expr, 0);
	} else if (!sym || !sym_IsConstant(sym)) {
		rpn_Init(expr);
		expr->isSymbol = true;

		makeUnknown(expr, sym_IsPC(sym) ? "PC is not constant at assembly time"
						: "'%s' is not constant at assembly time", symName);
		sym = sym_Ref(symName);
		expr->rpnPatchSize += 5; // 1-byte opcode + 4-byte symbol ID

		size_t nameLen = strlen(sym->name) + 1; // Don't forget NUL!
		uint8_t *ptr = reserveSpace(expr, nameLen + 1);
		*ptr++ = RPN_SYM;
		memcpy(ptr, sym->name, nameLen);
	} else {
		rpn_Number(expr, sym_GetConstantValue(symName));
	}
}

void rpn_BankSelf(struct Expression *expr)
{
	rpn_Init(expr);

	if (!currentSection) {
		error("PC has no bank outside a section\n");
		expr->val = 1;
	} else if (currentSection->bank == (uint32_t)-1) {
		makeUnknown(expr, "Current section's bank is not known");
		expr->rpnPatchSize++;
		*reserveSpace(expr, 1) = RPN_BANK_SELF;
	} else {
		expr->val = currentSection->bank;
	}
}

void rpn_BankSymbol(struct Expression *expr, char const *symName)
{
	struct Symbol const *sym = sym_FindScopedSymbol(symName);

	// The @ symbol is treated differently.
	if (sym_IsPC(sym)) {
		rpn_BankSelf(expr);
		return;
	}

	rpn_Init(expr);
	if (sym && !sym_IsLabel(sym)) {
		error("BANK argument must be a label\n");
	} else {
		sym = sym_Ref(symName);
		assert(sym); // If the symbol didn't exist, it should have been created

		if (sym_GetSection(sym) && sym_GetSection(sym)->bank != (uint32_t)-1) {
			// Symbol's section is known and bank is fixed
			expr->val = sym_GetSection(sym)->bank;
		} else {
			makeUnknown(expr, "\"%s\"'s bank is not known", symName);
			expr->rpnPatchSize += 5; // opcode + 4-byte sect ID

			size_t nameLen = strlen(sym->name) + 1; // Room for NUL!
			uint8_t *ptr = reserveSpace(expr, nameLen + 1);
			*ptr++ = RPN_BANK_SYM;
			memcpy(ptr, sym->name, nameLen);
		}
	}
}

void rpn_BankSection(struct Expression *expr, char const *sectionName)
{
	rpn_Init(expr);

	struct Section *section = sect_FindSectionByName(sectionName);

	if (section && section->bank != (uint32_t)-1) {
		expr->val = section->bank;
	} else {
		makeUnknown(expr, "Section \"%s\"'s bank is not known", sectionName);

		size_t nameLen = strlen(sectionName) + 1; // Room for NUL!
		uint8_t *ptr = reserveSpace(expr, nameLen + 1);

		expr->rpnPatchSize += nameLen + 1;
		*ptr++ = RPN_BANK_SECT;
		memcpy(ptr, sectionName, nameLen);
	}
}

void rpn_SizeOfSection(struct Expression *expr, char const *sectionName)
{
	rpn_Init(expr);

	struct Section *section = sect_FindSectionByName(sectionName);

	if (section && sect_IsSizeKnown(section)) {
		expr->val = section->size;
	} else {
		makeUnknown(expr, "Section \"%s\"'s size is not known", sectionName);

		size_t nameLen = strlen(sectionName) + 1; // Room for NUL!
		uint8_t *ptr = reserveSpace(expr, nameLen + 1);

		expr->rpnPatchSize += nameLen + 1;
		*ptr++ = RPN_SIZEOF_SECT;
		memcpy(ptr, sectionName, nameLen);
	}
}

void rpn_StartOfSection(struct Expression *expr, char const *sectionName)
{
	rpn_Init(expr);

	struct Section *section = sect_FindSectionByName(sectionName);

	if (section && section->org != (uint32_t)-1) {
		expr->val = section->org;
	} else {
		makeUnknown(expr, "Section \"%s\"'s start is not known", sectionName);

		size_t nameLen = strlen(sectionName) + 1; // Room for NUL!
		uint8_t *ptr = reserveSpace(expr, nameLen + 1);

		expr->rpnPatchSize += nameLen + 1;
		*ptr++ = RPN_STARTOF_SECT;
		memcpy(ptr, sectionName, nameLen);
	}
}

void rpn_CheckHRAM(struct Expression *expr, const struct Expression *src)
{
	*expr = *src;
	expr->isSymbol = false;

	if (!rpn_isKnown(expr)) {
		expr->rpnPatchSize++;
		*reserveSpace(expr, 1) = RPN_HRAM;
	} else if (expr->val >= 0xFF00 && expr->val <= 0xFFFF) {
		// That range is valid, but only keep the lower byte
		expr->val &= 0xFF;
	} else if (expr->val < 0 || expr->val > 0xFF) {
		error("Source address $%" PRIx32 " not between $FF00 to $FFFF\n", expr->val);
	}
}

void rpn_CheckRST(struct Expression *expr, const struct Expression *src)
{
	*expr = *src;

	if (rpn_isKnown(expr)) {
		// A valid RST address must be masked with 0x38
		if (expr->val & ~0x38)
			error("Invalid address $%" PRIx32 " for RST\n", expr->val);
		// The target is in the "0x38" bits, all other bits are set
		expr->val |= 0xC7;
	} else {
		expr->rpnPatchSize++;
		*reserveSpace(expr, 1) = RPN_RST;
	}
}

// Checks that an RPN expression's value fits within N bits (signed or unsigned)
void rpn_CheckNBit(struct Expression const *expr, uint8_t n)
{
	assert(n != 0); // That doesn't make sense
	assert(n < CHAR_BIT * sizeof(int)); // Otherwise `1 << n` is UB

	if (rpn_isKnown(expr)) {
		int32_t val = expr->val;

		if (val <= -(1 << n) || val >= 1 << n)
			warning(WARNING_TRUNCATION_1, "Expression must be %u-bit\n", n);
		else if (val < -(1 << (n - 1)))
			warning(WARNING_TRUNCATION_2, "Expression must be %u-bit\n", n);
	}
}

int32_t rpn_GetConstVal(struct Expression const *expr)
{
	if (!rpn_isKnown(expr)) {
		error("Expected constant expression: %s\n", expr->reason);
		return 0;
	}
	return expr->val;
}

void rpn_LOGNOT(struct Expression *expr, const struct Expression *src)
{
	*expr = *src;
	expr->isSymbol = false;

	if (rpn_isKnown(expr)) {
		expr->val = !expr->val;
	} else {
		expr->rpnPatchSize++;
		*reserveSpace(expr, 1) = RPN_LOGUNNOT;
	}
}

struct Symbol const *rpn_SymbolOf(struct Expression const *expr)
{
	if (!rpn_isSymbol(expr))
		return NULL;
	return sym_FindScopedSymbol((char const *)expr->rpn + 1);
}

bool rpn_IsDiffConstant(struct Expression const *src, struct Symbol const *sym)
{
	// Check if both expressions only refer to a single symbol
	struct Symbol const *sym1 = rpn_SymbolOf(src);

	if (!sym1 || !sym || sym1->type != SYM_LABEL || sym->type != SYM_LABEL)
		return false;

	struct Section const *section1 = sym_GetSection(sym1);
	struct Section const *section2 = sym_GetSection(sym);
	return section1 && (section1 == section2);
}

static bool isDiffConstant(struct Expression const *src1,
			   struct Expression const *src2)
{
	return rpn_IsDiffConstant(src1, rpn_SymbolOf(src2));
}

/*
 * Attempts to compute a constant binary AND from non-constant operands
 * This is possible if one operand is a symbol belonging to an `ALIGN[N]` section, and the other is
 * a constant that only keeps (some of) the lower N bits.
 *
 * @return The constant result if it can be computed, or -1 otherwise.
 */
static int32_t tryConstMask(struct Expression const *lhs, struct Expression const *rhs)
{
	struct Symbol const *sym = rpn_SymbolOf(lhs);
	struct Expression const *expr = rhs;

	if (!sym || !sym_GetSection(sym)) {
		// If the lhs isn't a symbol, try again the other way around
		sym = rpn_SymbolOf(rhs);
		expr = lhs;

		if (!sym || !sym_GetSection(sym))
			return -1;
	}
	assert(sym_IsNumeric(sym));

	if (!rpn_isKnown(expr))
		return -1;
	// We can now safely use `expr->val`
	struct Section const *sect = sym_GetSection(sym);
	int32_t unknownBits = (1 << 16) - (1 << sect->align); // The max alignment is 16

	// The mask must ignore all unknown bits
	if ((expr->val & unknownBits) != 0)
		return -1;

	// `sym_GetValue()` attempts to add the section's address,
	// but that's "-1" because the section is floating (otherwise we wouldn't be here)
	assert(sect->org == (uint32_t)-1);
	int32_t symbolOfs = sym_GetValue(sym) + 1;

	return (symbolOfs + sect->alignOfs) & ~unknownBits;
}

void rpn_BinaryOp(enum RPNCommand op, struct Expression *expr,
		  const struct Expression *src1, const struct Expression *src2)
{
	expr->isSymbol = false;
	int32_t constMaskVal;

	// First, check if the expression is known
	expr->isKnown = src1->isKnown && src2->isKnown;
	if (expr->isKnown) {
		rpn_Init(expr); // Init the expression to something sane

		// If both expressions are known, just compute the value
		uint32_t uleft = src1->val, uright = src2->val;

		switch (op) {
		case RPN_LOGOR:
			expr->val = src1->val || src2->val;
			break;
		case RPN_LOGAND:
			expr->val = src1->val && src2->val;
			break;
		case RPN_LOGEQ:
			expr->val = src1->val == src2->val;
			break;
		case RPN_LOGGT:
			expr->val = src1->val > src2->val;
			break;
		case RPN_LOGLT:
			expr->val = src1->val < src2->val;
			break;
		case RPN_LOGGE:
			expr->val = src1->val >= src2->val;
			break;
		case RPN_LOGLE:
			expr->val = src1->val <= src2->val;
			break;
		case RPN_LOGNE:
			expr->val = src1->val != src2->val;
			break;
		case RPN_ADD:
			expr->val = uleft + uright;
			break;
		case RPN_SUB:
			expr->val = uleft - uright;
			break;
		case RPN_XOR:
			expr->val = src1->val ^ src2->val;
			break;
		case RPN_OR:
			expr->val = src1->val | src2->val;
			break;
		case RPN_AND:
			expr->val = src1->val & src2->val;
			break;
		case RPN_SHL:
			if (src2->val < 0)
				warning(WARNING_SHIFT_AMOUNT,
					"Shifting left by negative amount %" PRId32 "\n",
					src2->val);

			if (src2->val >= 32)
				warning(WARNING_SHIFT_AMOUNT,
					"Shifting left by large amount %" PRId32 "\n", src2->val);

			expr->val = op_shift_left(src1->val, src2->val);
			break;
		case RPN_SHR:
			if (src1->val < 0)
				warning(WARNING_SHIFT,
					"Shifting right negative value %" PRId32 "\n", src1->val);

			if (src2->val < 0)
				warning(WARNING_SHIFT_AMOUNT,
					"Shifting right by negative amount %" PRId32 "\n",
					src2->val);

			if (src2->val >= 32)
				warning(WARNING_SHIFT_AMOUNT,
					"Shifting right by large amount %" PRId32 "\n",
					src2->val);

			expr->val = op_shift_right(src1->val, src2->val);
			break;
		case RPN_USHR:
			if (src2->val < 0)
				warning(WARNING_SHIFT_AMOUNT,
					"Shifting right by negative amount %" PRId32 "\n",
					src2->val);

			if (src2->val >= 32)
				warning(WARNING_SHIFT_AMOUNT,
					"Shifting right by large amount %" PRId32 "\n",
					src2->val);

			expr->val = op_shift_right_unsigned(src1->val, src2->val);
			break;
		case RPN_MUL:
			expr->val = uleft * uright;
			break;
		case RPN_DIV:
			if (src2->val == 0)
				fatalerror("Division by zero\n");

			if (src1->val == INT32_MIN && src2->val == -1) {
				warning(WARNING_DIV,
					"Division of %" PRId32 " by -1 yields %" PRId32 "\n",
					INT32_MIN, INT32_MIN);
				expr->val = INT32_MIN;
			} else {
				expr->val = op_divide(src1->val, src2->val);
			}
			break;
		case RPN_MOD:
			if (src2->val == 0)
				fatalerror("Modulo by zero\n");

			if (src1->val == INT32_MIN && src2->val == -1)
				expr->val = 0;
			else
				expr->val = op_modulo(src1->val, src2->val);
			break;
		case RPN_EXP:
			if (src2->val < 0)
				fatalerror("Exponentiation by negative power\n");

			if (src1->val == INT32_MIN && src2->val == -1)
				expr->val = 0;
			else
				expr->val = op_exponent(src1->val, src2->val);
			break;

		case RPN_UNSUB:
		case RPN_UNNOT:
		case RPN_LOGUNNOT:
		case RPN_BANK_SYM:
		case RPN_BANK_SECT:
		case RPN_BANK_SELF:
		case RPN_SIZEOF_SECT:
		case RPN_STARTOF_SECT:
		case RPN_HRAM:
		case RPN_RST:
		case RPN_CONST:
		case RPN_SYM:
			fatalerror("%d is not a binary operator\n", op);
		}

	} else if (op == RPN_SUB && isDiffConstant(src1, src2)) {
		struct Symbol const *symbol1 = rpn_SymbolOf(src1);
		struct Symbol const *symbol2 = rpn_SymbolOf(src2);

		expr->val = sym_GetValue(symbol1) - sym_GetValue(symbol2);
		expr->isKnown = true;
	} else if (op == RPN_AND && (constMaskVal = tryConstMask(src1, src2)) != -1) {
		expr->val = constMaskVal;
		expr->isKnown = true;
	} else {
		// If it's not known, start computing the RPN expression

		// Convert the left-hand expression if it's constant
		if (src1->isKnown) {
			uint32_t lval = src1->val;
			uint8_t bytes[] = {RPN_CONST, lval, lval >> 8,
					   lval >> 16, lval >> 24};
			expr->rpnPatchSize = sizeof(bytes);
			expr->rpn = NULL;
			expr->rpnCapacity = 0;
			expr->rpnLength = 0;
			memcpy(reserveSpace(expr, sizeof(bytes)), bytes,
			       sizeof(bytes));

			// Use the other expression's un-const reason
			expr->reason = src2->reason;
			free(src1->reason);
		} else {
			// Otherwise just reuse its RPN buffer
			expr->rpnPatchSize = src1->rpnPatchSize;
			expr->rpn = src1->rpn;
			expr->rpnCapacity = src1->rpnCapacity;
			expr->rpnLength = src1->rpnLength;
			expr->reason = src1->reason;
			free(src2->reason);
		}

		// Now, merge the right expression into the left one
		uint8_t *ptr = src2->rpn; // Pointer to the right RPN
		uint32_t len = src2->rpnLength; // Size of the right RPN
		uint32_t patchSize = src2->rpnPatchSize;

		// If the right expression is constant, merge a shim instead
		uint32_t rval = src2->val;
		uint8_t bytes[] = {RPN_CONST, rval, rval >> 8, rval >> 16,
				   rval >> 24};
		if (src2->isKnown) {
			ptr = bytes;
			len = sizeof(bytes);
			patchSize = sizeof(bytes);
		}
		// Copy the right RPN and append the operator
		uint8_t *buf = reserveSpace(expr, len + 1);

		memcpy(buf, ptr, len);
		buf[len] = op;

		free(src2->rpn); // If there was none, this is `free(NULL)`
		expr->rpnPatchSize += patchSize + 1;
	}
}

void rpn_HIGH(struct Expression *expr, const struct Expression *src)
{
	*expr = *src;
	expr->isSymbol = false;

	if (rpn_isKnown(expr)) {
		expr->val = (uint32_t)expr->val >> 8 & 0xFF;
	} else {
		uint8_t bytes[] = {RPN_CONST,    8, 0, 0, 0, RPN_SHR,
				   RPN_CONST, 0xFF, 0, 0, 0, RPN_AND};
		expr->rpnPatchSize += sizeof(bytes);
		memcpy(reserveSpace(expr, sizeof(bytes)), bytes, sizeof(bytes));
	}
}

void rpn_LOW(struct Expression *expr, const struct Expression *src)
{
	*expr = *src;
	expr->isSymbol = false;

	if (rpn_isKnown(expr)) {
		expr->val = expr->val & 0xFF;
	} else {
		uint8_t bytes[] = {RPN_CONST, 0xFF, 0, 0, 0, RPN_AND};

		expr->rpnPatchSize += sizeof(bytes);
		memcpy(reserveSpace(expr, sizeof(bytes)), bytes, sizeof(bytes));
	}
}

void rpn_ISCONST(struct Expression *expr, const struct Expression *src)
{
	rpn_Init(expr);
	expr->val = rpn_isKnown(src);
	expr->isKnown = true;
	expr->isSymbol = false;
}

void rpn_UNNEG(struct Expression *expr, const struct Expression *src)
{
	*expr = *src;
	expr->isSymbol = false;

	if (rpn_isKnown(expr)) {
		expr->val = -(uint32_t)expr->val;
	} else {
		expr->rpnPatchSize++;
		*reserveSpace(expr, 1) = RPN_UNSUB;
	}
}

void rpn_UNNOT(struct Expression *expr, const struct Expression *src)
{
	*expr = *src;
	expr->isSymbol = false;

	if (rpn_isKnown(expr)) {
		expr->val = ~expr->val;
	} else {
		expr->rpnPatchSize++;
		*reserveSpace(expr, 1) = RPN_UNNOT;
	}
}
