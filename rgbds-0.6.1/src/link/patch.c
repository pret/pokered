/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2019, Eldred Habert and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#include <assert.h>
#include <inttypes.h>
#include <limits.h>
#include <stdlib.h>
#include <string.h>

#include "link/object.h"
#include "link/patch.h"
#include "link/section.h"
#include "link/symbol.h"

#include "error.h"
#include "linkdefs.h"
#include "opmath.h"

/*
 * This is an "empty"-type stack. Apart from the actual values, we also remember
 * whether the value is a placeholder inserted for error recovery. This allows
 * us to avoid cascading errors.
 *
 * The best way to think about this is a stack of (value, errorFlag) pairs.
 * They are only separated for reasons of memory efficiency.
 */
struct RPNStack {
	int32_t *values;
	bool *errorFlags;
	size_t size;
	size_t capacity;
} stack;

static void initRPNStack(void)
{
	stack.capacity = 64;
	stack.values = malloc(sizeof(*stack.values) * stack.capacity);
	stack.errorFlags = malloc(sizeof(*stack.errorFlags) * stack.capacity);
	if (!stack.values || !stack.errorFlags)
		err("Failed to init RPN stack");
}

static void clearRPNStack(void)
{
	stack.size = 0;
}

static void pushRPN(int32_t value, bool comesFromError)
{
	if (stack.size >= stack.capacity) {
		static const size_t increase_factor = 2;

		if (stack.capacity > SIZE_MAX / increase_factor)
			errx("Overflow in RPN stack resize");

		stack.capacity *= increase_factor;
		stack.values =
			realloc(stack.values, sizeof(*stack.values) * stack.capacity);
		stack.errorFlags =
			realloc(stack.errorFlags, sizeof(*stack.errorFlags) * stack.capacity);
		// Static analysis tools complain that the capacity might become
		// zero due to overflow, but fail to realize that it's caught by
		// the overflow check above. Hence the stringent check below.
		if (!stack.values || !stack.errorFlags || !stack.capacity)
			err("Failed to resize RPN stack");
	}

	stack.values[stack.size] = value;
	stack.errorFlags[stack.size] = comesFromError;
	stack.size++;
}

// This flag tracks whether the RPN op that is currently being evaluated
// has popped any values with the error flag set.
static bool isError = false;

static int32_t popRPN(struct FileStackNode const *node, uint32_t lineNo)
{
	if (stack.size == 0)
		fatal(node, lineNo, "Internal error, RPN stack empty");

	stack.size--;
	isError |= stack.errorFlags[stack.size];
	return stack.values[stack.size];
}

static void freeRPNStack(void)
{
	free(stack.values);
	free(stack.errorFlags);
}

// RPN operators

static uint32_t getRPNByte(uint8_t const **expression, int32_t *size,
			   struct FileStackNode const *node, uint32_t lineNo)
{
	if (!(*size)--)
		fatal(node, lineNo, "Internal error, RPN expression overread");

	return *(*expression)++;
}

static struct Symbol const *getSymbol(struct Symbol const * const *symbolList,
				      uint32_t index)
{
	assert(index != (uint32_t)-1); // PC needs to be handled specially, not here
	struct Symbol const *symbol = symbolList[index];

	// If the symbol is defined elsewhere...
	if (symbol->type == SYMTYPE_IMPORT)
		return sym_GetSymbol(symbol->name);

	return symbol;
}

/*
 * Compute a patch's value from its RPN string.
 * @param patch The patch to compute the value of
 * @param section The section the patch is contained in
 * @return The patch's value
 * @return isError Set if an error occurred during evaluation, and further
 *                 errors caused by the value should be suppressed.
 */
static int32_t computeRPNExpr(struct Patch const *patch,
			      struct Symbol const * const *fileSymbols)
{
// Small shortcut to avoid a lot of repetition
#define popRPN() popRPN(patch->src, patch->lineNo)

	uint8_t const *expression = patch->rpnExpression;
	int32_t size = patch->rpnSize;

	clearRPNStack();

	while (size > 0) {
		enum RPNCommand command = getRPNByte(&expression, &size,
						     patch->src, patch->lineNo);
		int32_t value;

		isError = false;

		// Be VERY careful with two `popRPN` in the same expression.
		// C does not guarantee order of evaluation of operands!
		// So, if there are two `popRPN` in the same expression, make
		// sure the operation is commutative.
		switch (command) {
			struct Symbol const *symbol;
			char const *name;
			struct Section const *sect;

		case RPN_ADD:
			value = popRPN() + popRPN();
			break;
		case RPN_SUB:
			value = popRPN();
			value = popRPN() - value;
			break;
		case RPN_MUL:
			value = popRPN() * popRPN();
			break;
		case RPN_DIV:
			value = popRPN();
			if (value == 0) {
				if (!isError)
					error(patch->src, patch->lineNo, "Division by 0");
				isError = true;
				popRPN();
				value = INT32_MAX;
			} else {
				value = op_divide(popRPN(), value);
			}
			break;
		case RPN_MOD:
			value = popRPN();
			if (value == 0) {
				if (!isError)
					error(patch->src, patch->lineNo, "Modulo by 0");
				isError = true;
				popRPN();
				value = 0;
			} else {
				value = op_modulo(popRPN(), value);
			}
			break;
		case RPN_UNSUB:
			value = -popRPN();
			break;
		case RPN_EXP:
			value = popRPN();
			if (value < 0) {
				if (!isError)
					error(patch->src, patch->lineNo, "Exponent by negative");
				isError = true;
				popRPN();
				value = 0;
			} else {
				value = op_exponent(popRPN(), value);
			}
			break;

		case RPN_OR:
			value = popRPN() | popRPN();
			break;
		case RPN_AND:
			value = popRPN() & popRPN();
			break;
		case RPN_XOR:
			value = popRPN() ^ popRPN();
			break;
		case RPN_UNNOT:
			value = ~popRPN();
			break;

		case RPN_LOGAND:
			value = popRPN();
			value = popRPN() && value;
			break;
		case RPN_LOGOR:
			value = popRPN();
			value = popRPN() || value;
			break;
		case RPN_LOGUNNOT:
			value = !popRPN();
			break;

		case RPN_LOGEQ:
			value = popRPN() == popRPN();
			break;
		case RPN_LOGNE:
			value = popRPN() != popRPN();
			break;
		case RPN_LOGGT:
			value = popRPN();
			value = popRPN() > value;
			break;
		case RPN_LOGLT:
			value = popRPN();
			value = popRPN() < value;
			break;
		case RPN_LOGGE:
			value = popRPN();
			value = popRPN() >= value;
			break;
		case RPN_LOGLE:
			value = popRPN();
			value = popRPN() <= value;
			break;

		case RPN_SHL:
			value = popRPN();
			value = op_shift_left(popRPN(), value);
			break;
		case RPN_SHR:
			value = popRPN();
			value = op_shift_right(popRPN(), value);
			break;
		case RPN_USHR:
			value = popRPN();
			value = op_shift_right_unsigned(popRPN(), value);
			break;

		case RPN_BANK_SYM:
			value = 0;
			for (uint8_t shift = 0; shift < 32; shift += 8)
				value |= getRPNByte(&expression, &size,
						    patch->src, patch->lineNo) << shift;
			symbol = getSymbol(fileSymbols, value);

			if (!symbol) {
				error(patch->src, patch->lineNo,
				      "Requested BANK() of symbol \"%s\", which was not found",
				      fileSymbols[value]->name);
				isError = true;
				value = 1;
			} else if (!symbol->section) {
				error(patch->src, patch->lineNo,
				      "Requested BANK() of non-label symbol \"%s\"",
				      fileSymbols[value]->name);
				isError = true;
				value = 1;
			} else {
				value = symbol->section->bank;
			}
			break;

		case RPN_BANK_SECT:
			// `expression` is not guaranteed to be '\0'-terminated. If it is not,
			// `getRPNByte` will have a fatal internal error.
			// In either case, `getRPNByte` will not free `expression`.
			name = (char const *)expression;
			while (getRPNByte(&expression, &size, patch->src, patch->lineNo))
				;

			sect = sect_GetSection(name);

			if (!sect) {
				error(patch->src, patch->lineNo,
				      "Requested BANK() of section \"%s\", which was not found",
				      name);
				isError = true;
				value = 1;
			} else {
				value = sect->bank;
			}
			break;

		case RPN_BANK_SELF:
			if (!patch->pcSection) {
				error(patch->src, patch->lineNo,
				      "PC has no bank outside a section");
				isError = true;
				value = 1;
			} else {
				value = patch->pcSection->bank;
			}
			break;

		case RPN_SIZEOF_SECT:
			// This has assumptions commented in the `RPN_BANK_SECT` case above.
			name = (char const *)expression;
			while (getRPNByte(&expression, &size, patch->src, patch->lineNo))
				;

			sect = sect_GetSection(name);

			if (!sect) {
				error(patch->src, patch->lineNo,
				      "Requested SIZEOF() of section \"%s\", which was not found",
				      name);
				isError = true;
				value = 1;
			} else {
				value = sect->size;
			}
			break;

		case RPN_STARTOF_SECT:
			// This has assumptions commented in the `RPN_BANK_SECT` case above.
			name = (char const *)expression;
			while (getRPNByte(&expression, &size, patch->src, patch->lineNo))
				;

			sect = sect_GetSection(name);
			assert(sect->offset == 0);

			if (!sect) {
				error(patch->src, patch->lineNo,
				      "Requested STARTOF() of section \"%s\", which was not found",
				      name);
				isError = true;
				value = 1;
			} else {
				value = sect->org;
			}
			break;

		case RPN_HRAM:
			value = popRPN();
			if (!isError && (value < 0
				     || (value > 0xFF && value < 0xFF00)
				     || value > 0xFFFF)) {
				error(patch->src, patch->lineNo,
				      "Value %" PRId32 " is not in HRAM range", value);
				isError = true;
			}
			value &= 0xFF;
			break;

		case RPN_RST:
			value = popRPN();
			// Acceptable values are 0x00, 0x08, 0x10, ..., 0x38
			// They can be easily checked with a bitmask
			if (value & ~0x38) {
				if (!isError)
					error(patch->src, patch->lineNo,
					      "Value %" PRId32 " is not a RST vector", value);
				isError = true;
			}
			value |= 0xC7;
			break;

		case RPN_CONST:
			value = 0;
			for (uint8_t shift = 0; shift < 32; shift += 8)
				value |= getRPNByte(&expression, &size,
						    patch->src, patch->lineNo) << shift;
			break;

		case RPN_SYM:
			value = 0;
			for (uint8_t shift = 0; shift < 32; shift += 8)
				value |= getRPNByte(&expression, &size,
						    patch->src, patch->lineNo) << shift;

			if (value == -1) { // PC
				if (!patch->pcSection) {
					error(patch->src, patch->lineNo,
					      "PC has no value outside a section");
					value = 0;
					isError = true;
				} else {
					value = patch->pcOffset + patch->pcSection->org;
				}
			} else {
				symbol = getSymbol(fileSymbols, value);

				if (!symbol) {
					error(patch->src, patch->lineNo,
					      "Unknown symbol \"%s\"", fileSymbols[value]->name);
					isError = true;
				} else {
					value = symbol->value;
					// Symbols attached to sections have offsets
					if (symbol->section)
						value += symbol->section->org;
				}
			}
			break;
		}

		pushRPN(value, isError);
	}

	if (stack.size > 1)
		error(patch->src, patch->lineNo,
		      "RPN stack has %zu entries on exit, not 1", stack.size);

	isError = false;
	return popRPN();

#undef popRPN
}

void patch_CheckAssertions(struct Assertion *assert)
{
	verbosePrint("Checking assertions...\n");
	initRPNStack();

	while (assert) {
		int32_t value = computeRPNExpr(&assert->patch,
			(struct Symbol const * const *)assert->fileSymbols);
		enum AssertionType type = (enum AssertionType)assert->patch.type;

		if (!isError && !value) {
			switch (type) {
			case ASSERT_FATAL:
				fatal(assert->patch.src, assert->patch.lineNo, "%s",
				      assert->message[0] ? assert->message
							 : "assert failure");
				// Not reached
				break; // Here so checkpatch doesn't complain
			case ASSERT_ERROR:
				error(assert->patch.src, assert->patch.lineNo, "%s",
				      assert->message[0] ? assert->message
							 : "assert failure");
				break;
			case ASSERT_WARN:
				warning(assert->patch.src, assert->patch.lineNo, "%s",
					assert->message[0] ? assert->message
							   : "assert failure");
				break;
			}
		} else if (isError && type == ASSERT_FATAL) {
			fatal(assert->patch.src, assert->patch.lineNo,
			      "couldn't evaluate assertion%s%s",
			      assert->message[0] ? ": " : "",
			      assert->message);
		}
		struct Assertion *next = assert->next;

		free(assert->patch.rpnExpression);
		free(assert->message);
		free(assert);
		assert = next;
	}

	freeRPNStack();
}

/*
 * Applies all of a section's patches
 * @param section The section to patch
 * @param arg Ignored callback arg
 */
static void applyFilePatches(struct Section *section, struct Section *dataSection)
{
	verbosePrint("Patching section \"%s\"...\n", section->name);
	for (uint32_t patchID = 0; patchID < section->nbPatches; patchID++) {
		struct Patch *patch = &section->patches[patchID];
		int32_t value = computeRPNExpr(patch,
					       (struct Symbol const * const *)
							section->fileSymbols);
		uint16_t offset = patch->offset + section->offset;

		// `jr` is quite unlike the others...
		if (patch->type == PATCHTYPE_JR) {
			// Offset is relative to the byte *after* the operand
			// PC as operand to `jr` is lower than reference PC by 2
			uint16_t address = patch->pcSection->org + patch->pcOffset + 2;
			int16_t jumpOffset = value - address;

			if (!isError && (jumpOffset < -128 || jumpOffset > 127))
				error(patch->src, patch->lineNo,
				      "jr target out of reach (expected -129 < %" PRId16 " < 128)",
				      jumpOffset);
			dataSection->data[offset] = jumpOffset & 0xFF;
		} else {
			// Patch a certain number of bytes
			struct {
				uint8_t size;
				int32_t min;
				int32_t max;
			} const types[] = {
				[PATCHTYPE_BYTE] = {1,      -128,       255},
				[PATCHTYPE_WORD] = {2,    -32768,     65536},
				[PATCHTYPE_LONG] = {4, INT32_MIN, INT32_MAX}
			};

			if (!isError && (value < types[patch->type].min
				      || value > types[patch->type].max))
				error(patch->src, patch->lineNo,
				      "Value %#" PRIx32 "%s is not %u-bit",
				      value, value < 0 ? " (maybe negative?)" : "",
				      types[patch->type].size * 8U);
			for (uint8_t i = 0; i < types[patch->type].size; i++) {
				dataSection->data[offset + i] = value & 0xFF;
				value >>= 8;
			}
		}
	}
}

/*
 * Applies all of a section's patches, iterating over "components" of
 * unionized sections
 * @param section The section to patch
 * @param arg Ignored callback arg
 */
static void applyPatches(struct Section *section, void *arg)
{
	if (!sect_HasData(section->type))
		return;

	(void)arg;
	struct Section *dataSection = section;

	do {
		applyFilePatches(section, dataSection);
		section = section->nextu;
	} while (section);
}

void patch_ApplyPatches(void)
{
	initRPNStack();
	sect_ForEach(applyPatches, NULL);
	freeRPNStack();
}

