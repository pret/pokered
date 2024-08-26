/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2022, RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#include <assert.h>
#include <errno.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "asm/fstack.h"
#include "asm/main.h"
#include "asm/output.h"
#include "asm/rpn.h"
#include "asm/section.h"
#include "asm/symbol.h"
#include "asm/warning.h"

#include "error.h"
#include "linkdefs.h"
#include "platform.h" // strdup

uint8_t fillByte;

struct UnionStackEntry {
	uint32_t start;
	uint32_t size;
	struct UnionStackEntry *next;
} *unionStack = NULL;

struct SectionStackEntry {
	struct Section *section;
	struct Section *loadSection;
	char const *scope; // Section's symbol scope
	uint32_t offset;
	int32_t loadOffset;
	struct UnionStackEntry *unionStack;
	struct SectionStackEntry *next;
};

struct SectionStackEntry *sectionStack;
uint32_t curOffset; // Offset into the current section (see sect_GetSymbolOffset)
struct Section *currentSection = NULL;
static struct Section *currentLoadSection = NULL;
int32_t loadOffset; // Offset into the LOAD section's parent (see sect_GetOutputOffset)

// A quick check to see if we have an initialized section
attr_(warn_unused_result) static bool checksection(void)
{
	if (currentSection)
		return true;

	error("Cannot output data outside of a SECTION\n");
	return false;
}

// A quick check to see if we have an initialized section that can contain
// this much initialized data
attr_(warn_unused_result) static bool checkcodesection(void)
{
	if (!checksection())
		return false;

	if (sect_HasData(currentSection->type))
		return true;

	error("Section '%s' cannot contain code or data (not ROM0 or ROMX)\n",
	      currentSection->name);
	return false;
}

attr_(warn_unused_result) static bool checkSectionSize(struct Section const *sect, uint32_t size)
{
	uint32_t maxSize = sectionTypeInfo[sect->type].size;

	// If the new size is reasonable, keep going
	if (size <= maxSize)
		return true;

	error("Section '%s' grew too big (max size = 0x%" PRIX32
	      " bytes, reached 0x%" PRIX32 ").\n", sect->name, maxSize, size);
	return false;
}

// Check if the section has grown too much.
attr_(warn_unused_result) static bool reserveSpace(uint32_t delta_size)
{
	// This check is here to trap broken code that generates sections that are too big and to
	// prevent the assembler from generating huge object files or trying to allocate too much
	// memory.
	// A check at the linking stage is still necessary.

	// If the section has already overflowed, skip the check to avoid erroring out ad nauseam
	if (currentSection->size != UINT32_MAX
	 && !checkSectionSize(currentSection, curOffset + loadOffset + delta_size))
		// Mark the section as overflowed, to avoid repeating the error
		currentSection->size = UINT32_MAX;

	if (currentLoadSection && currentLoadSection->size != UINT32_MAX
	 && !checkSectionSize(currentLoadSection, curOffset + delta_size))
		currentLoadSection->size = UINT32_MAX;

	return currentSection->size != UINT32_MAX
		&& (!currentLoadSection || currentLoadSection->size != UINT32_MAX);
}

struct Section *sect_FindSectionByName(char const *name)
{
	for (struct Section *sect = sectionList; sect; sect = sect->next) {
		if (strcmp(name, sect->name) == 0)
			return sect;
	}
	return NULL;
}

#define mask(align) ((1U << (align)) - 1)
#define fail(...) \
do { \
	error(__VA_ARGS__); \
	nbSectErrors++; \
} while (0)

static unsigned int mergeSectUnion(struct Section *sect, enum SectionType type, uint32_t org,
				   uint8_t alignment, uint16_t alignOffset)
{
	assert(alignment < 16); // Should be ensured by the caller
	unsigned int nbSectErrors = 0;

	// Unionized sections only need "compatible" constraints, and they end up with the strictest
	// combination of both.
	if (sect_HasData(type))
		fail("Cannot declare ROM sections as UNION\n");

	if (org != (uint32_t)-1) {
		// If both are fixed, they must be the same
		if (sect->org != (uint32_t)-1 && sect->org != org)
			fail("Section already declared as fixed at different address $%04"
			     PRIx32 "\n", sect->org);
		else if (sect->align != 0 && (mask(sect->align) & (org - sect->alignOfs)))
			fail("Section already declared as aligned to %u bytes (offset %"
				   PRIu16 ")\n", 1U << sect->align, sect->alignOfs);
		else
			// Otherwise, just override
			sect->org = org;

	} else if (alignment != 0) {
		// Make sure any fixed address given is compatible
		if (sect->org != (uint32_t)-1) {
			if ((sect->org - alignOffset) & mask(alignment))
				fail("Section already declared as fixed at incompatible address $%04"
				     PRIx32 "\n", sect->org);
		// Check if alignment offsets are compatible
		} else if ((alignOffset & mask(sect->align))
			   != (sect->alignOfs & mask(alignment))) {
			fail("Section already declared with incompatible %u"
			     "-byte alignment (offset %" PRIu16 ")\n",
			     1u << sect->align, sect->alignOfs);
		} else if (alignment > sect->align) {
			// If the section is not fixed, its alignment is the largest of both
			sect->align = alignment;
			sect->alignOfs = alignOffset;
		}
	}

	return nbSectErrors;
}

static unsigned int mergeFragments(struct Section *sect, enum SectionType type, uint32_t org,
				   uint8_t alignment, uint16_t alignOffset)
{
	(void)type;
	assert(alignment < 16); // Should be ensured by the caller
	unsigned int nbSectErrors = 0;

	// Fragments only need "compatible" constraints, and they end up with the strictest
	// combination of both.
	// The merging is however performed at the *end* of the original section!
	if (org != (uint32_t)-1) {
		uint16_t curOrg = org - sect->size;

		// If both are fixed, they must be the same
		if (sect->org != (uint32_t)-1 && sect->org != curOrg)
			fail("Section already declared as fixed at incompatible address $%04"
			     PRIx32 " (cur addr = %04" PRIx32 ")\n",
			     sect->org, sect->org + sect->size);
		else if (sect->align != 0 && (mask(sect->align) & (curOrg - sect->alignOfs)))
			fail("Section already declared as aligned to %u bytes (offset %"
			     PRIu16 ")\n", 1U << sect->align, sect->alignOfs);
		else
			// Otherwise, just override
			sect->org = curOrg;

	} else if (alignment != 0) {
		int32_t curOfs = (alignOffset - sect->size) % (1U << alignment);

		if (curOfs < 0)
			curOfs += 1U << alignment;

		// Make sure any fixed address given is compatible
		if (sect->org != (uint32_t)-1) {
			if ((sect->org - curOfs) & mask(alignment))
				fail("Section already declared as fixed at incompatible address $%04"
				     PRIx32 "\n", sect->org);
		// Check if alignment offsets are compatible
		} else if ((curOfs & mask(sect->align)) != (sect->alignOfs & mask(alignment))) {
			fail("Section already declared with incompatible %u"
			     "-byte alignment (offset %" PRIu16 ")\n",
			     1u << sect->align, sect->alignOfs);
		} else if (alignment > sect->align) {
			// If the section is not fixed, its alignment is the largest of both
			sect->align = alignment;
			sect->alignOfs = curOfs;
		}
	}

	return nbSectErrors;
}

static void mergeSections(struct Section *sect, enum SectionType type, uint32_t org, uint32_t bank,
			  uint8_t alignment, uint16_t alignOffset, enum SectionModifier mod)
{
	unsigned int nbSectErrors = 0;

	if (type != sect->type)
		fail("Section already exists but with type %s\n", sectionTypeInfo[sect->type].name);

	if (sect->modifier != mod) {
		fail("Section already declared as %s section\n", sectionModNames[sect->modifier]);
	} else {
		switch (mod) {
		case SECTION_UNION:
		case SECTION_FRAGMENT:
			nbSectErrors += (mod == SECTION_UNION ? mergeSectUnion : mergeFragments)
						(sect, type, org, alignment, alignOffset);

			// Common checks

			// If the section's bank is unspecified, override it
			if (sect->bank == (uint32_t)-1)
				sect->bank = bank;
			// If both specify a bank, it must be the same one
			else if (bank != (uint32_t)-1 && sect->bank != bank)
				fail("Section already declared with different bank %" PRIu32 "\n",
				     sect->bank);
			break;

		case SECTION_NORMAL:
			fail("Section already defined previously at ");
			fstk_Dump(sect->src, sect->fileLine);
			putc('\n', stderr);
			break;
		}
	}

	if (nbSectErrors)
		fatalerror("Cannot create section \"%s\" (%u error%s)\n",
			   sect->name, nbSectErrors, nbSectErrors == 1 ? "" : "s");
}

#undef fail

// Create a new section, not yet in the list.
static struct Section *createSection(char const *name, enum SectionType type,
				     uint32_t org, uint32_t bank, uint8_t alignment,
				     uint16_t alignOffset, enum SectionModifier mod)
{
	struct Section *sect = malloc(sizeof(*sect));

	if (sect == NULL)
		fatalerror("Not enough memory for section: %s\n", strerror(errno));

	sect->name = strdup(name);
	if (sect->name == NULL)
		fatalerror("Not enough memory for section name: %s\n", strerror(errno));

	sect->type = type;
	sect->modifier = mod;
	sect->src = fstk_GetFileStack();
	sect->fileLine = lexer_GetLineNo();
	sect->size = 0;
	sect->org = org;
	sect->bank = bank;
	sect->align = alignment;
	sect->alignOfs = alignOffset;
	sect->next = NULL;
	sect->patches = NULL;

	// It is only needed to allocate memory for ROM sections.
	if (sect_HasData(type)) {
		sect->data = malloc(sectionTypeInfo[type].size);
		if (sect->data == NULL)
			fatalerror("Not enough memory for section: %s\n", strerror(errno));
	} else {
		sect->data = NULL;
	}

	return sect;
}

// Find a section by name and type. If it doesn't exist, create it.
static struct Section *getSection(char const *name, enum SectionType type, uint32_t org,
				  struct SectionSpec const *attrs, enum SectionModifier mod)
{
	uint32_t bank = attrs->bank;
	uint8_t alignment = attrs->alignment;
	uint16_t alignOffset = attrs->alignOfs;

	// First, validate parameters, and normalize them if applicable

	if (bank != (uint32_t)-1) {
		if (type != SECTTYPE_ROMX && type != SECTTYPE_VRAM
		 && type != SECTTYPE_SRAM && type != SECTTYPE_WRAMX)
			error("BANK only allowed for ROMX, WRAMX, SRAM, or VRAM sections\n");
		else if (bank < sectionTypeInfo[type].firstBank || bank > sectionTypeInfo[type].lastBank)
			error("%s bank value $%04" PRIx32 " out of range ($%04" PRIx32 " to $%04"
				PRIx32 ")\n", sectionTypeInfo[type].name, bank,
				sectionTypeInfo[type].firstBank, sectionTypeInfo[type].lastBank);
	} else if (nbbanks(type) == 1) {
		// If the section type only has a single bank, implicitly force it
		bank = sectionTypeInfo[type].firstBank;
	}

	if (alignOffset >= 1 << alignment) {
		error("Alignment offset (%" PRIu16 ") must be smaller than alignment size (%u)\n",
		      alignOffset, 1U << alignment);
		alignOffset = 0;
	}

	if (org != (uint32_t)-1) {
		if (org < sectionTypeInfo[type].startAddr || org > endaddr(type))
			error("Section \"%s\"'s fixed address %#" PRIx32
				" is outside of range [%#" PRIx16 "; %#" PRIx16 "]\n",
				name, org, sectionTypeInfo[type].startAddr, endaddr(type));
	}

	if (alignment != 0) {
		if (alignment > 16) {
			error("Alignment must be between 0 and 16, not %u\n", alignment);
			alignment = 16;
		}
		// It doesn't make sense to have both alignment and org set
		uint32_t mask = mask(alignment);

		if (org != (uint32_t)-1) {
			if ((org - alignOffset) & mask)
				error("Section \"%s\"'s fixed address doesn't match its alignment\n",
					name);
			alignment = 0; // Ignore it if it's satisfied
		} else if (sectionTypeInfo[type].startAddr & mask) {
			error("Section \"%s\"'s alignment cannot be attained in %s\n",
				name, sectionTypeInfo[type].name);
			alignment = 0; // Ignore it if it's unattainable
			org = 0;
		} else if (alignment == 16) {
			// Treat an alignment of 16 as being fixed at address 0
			alignment = 0;
			org = 0;
			// The address is known to be valid, since the alignment is
		}
	}

	// Check if another section exists with the same name; merge if yes, otherwise create one

	struct Section *sect = sect_FindSectionByName(name);

	if (sect) {
		mergeSections(sect, type, org, bank, alignment, alignOffset, mod);
	} else {
		sect = createSection(name, type, org, bank, alignment, alignOffset, mod);
		// Add the new section to the list (order doesn't matter)
		sect->next = sectionList;
		sectionList = sect;
	}

	return sect;
}

// Set the current section
static void changeSection(void)
{
	if (unionStack)
		fatalerror("Cannot change the section within a UNION\n");

	sym_SetCurrentSymbolScope(NULL);
}

// Set the current section by name and type
void sect_NewSection(char const *name, uint32_t type, uint32_t org,
		     struct SectionSpec const *attribs, enum SectionModifier mod)
{
	if (currentLoadSection)
		fatalerror("Cannot change the section within a `LOAD` block\n");

	for (struct SectionStackEntry *stack = sectionStack; stack; stack = stack->next) {
		if (stack->section && !strcmp(name, stack->section->name))
			fatalerror("Section '%s' is already on the stack\n", name);
	}

	struct Section *sect = getSection(name, type, org, attribs, mod);

	changeSection();
	curOffset = mod == SECTION_UNION ? 0 : sect->size;
	loadOffset = 0; // This is still used when checking for section size overflow!
	currentSection = sect;
}

// Set the current section by name and type
void sect_SetLoadSection(char const *name, uint32_t type, uint32_t org,
			 struct SectionSpec const *attribs, enum SectionModifier mod)
{
	// Important info: currently, UNION and LOAD cannot interact, since UNION is prohibited in
	// "code" sections, whereas LOAD is restricted to them.
	// Therefore, any interactions are NOT TESTED, so lift either of those restrictions at
	// your own peril! ^^

	if (!checkcodesection())
		return;

	if (currentLoadSection) {
		error("`LOAD` blocks cannot be nested\n");
		return;
	}

	if (sect_HasData(type)) {
		error("`LOAD` blocks cannot create a ROM section\n");
		return;
	}

	if (mod == SECTION_FRAGMENT) {
		error("`LOAD FRAGMENT` is not allowed\n");
		return;
	}

	struct Section *sect = getSection(name, type, org, attribs, mod);

	changeSection();
	loadOffset = curOffset - (mod == SECTION_UNION ? 0 : sect->size);
	curOffset -= loadOffset;
	currentLoadSection = sect;
}

void sect_EndLoadSection(void)
{
	if (!currentLoadSection) {
		error("Found `ENDL` outside of a `LOAD` block\n");
		return;
	}

	changeSection();
	curOffset += loadOffset;
	loadOffset = 0;
	currentLoadSection = NULL;
}

struct Section *sect_GetSymbolSection(void)
{
	return currentLoadSection ? currentLoadSection : currentSection;
}

// The offset into the section above
uint32_t sect_GetSymbolOffset(void)
{
	return curOffset;
}

uint32_t sect_GetOutputOffset(void)
{
	return curOffset + loadOffset;
}

void sect_AlignPC(uint8_t alignment, uint16_t offset)
{
	if (!checksection())
		return;

	struct Section *sect = sect_GetSymbolSection();
	uint16_t alignSize = 1 << alignment; // Size of an aligned "block"

	if (sect->org != (uint32_t)-1) {
		if ((sym_GetPCValue() - offset) % alignSize)
			error("Section's fixed address fails required alignment (PC = $%04" PRIx32
			      ")\n", sym_GetPCValue());
	} else if (sect->align != 0) {
		if ((((sect->alignOfs + curOffset) % (1 << sect->align)) - offset) % alignSize) {
			error("Section's alignment fails required alignment (offset from section start = $%04"
				PRIx32 ")\n", curOffset);
		} else if (alignment > sect->align) {
			sect->align = alignment;
			sect->alignOfs = (offset - curOffset) % alignSize;
		}
	} else {
		sect->align = alignment;
		// We need `(sect->alignOfs + curOffset) % alignSize == offset
		sect->alignOfs = (offset - curOffset) % alignSize;
	}
}

static void growSection(uint32_t growth)
{
	curOffset += growth;
	if (curOffset + loadOffset > currentSection->size)
		currentSection->size = curOffset + loadOffset;
	if (currentLoadSection && curOffset > currentLoadSection->size)
		currentLoadSection->size = curOffset;
}

static void writebyte(uint8_t byte)
{
	currentSection->data[sect_GetOutputOffset()] = byte;
	growSection(1);
}

static void writeword(uint16_t b)
{
	writebyte(b & 0xFF);
	writebyte(b >> 8);
}

static void writelong(uint32_t b)
{
	writebyte(b & 0xFF);
	writebyte(b >> 8);
	writebyte(b >> 16);
	writebyte(b >> 24);
}

static void createPatch(enum PatchType type, struct Expression const *expr, uint32_t pcShift)
{
	out_CreatePatch(type, expr, sect_GetOutputOffset(), pcShift);
}

void sect_StartUnion(void)
{
	// Important info: currently, UNION and LOAD cannot interact, since UNION is prohibited in
	// "code" sections, whereas LOAD is restricted to them.
	// Therefore, any interactions are NOT TESTED, so lift either of those restrictions at
	// your own peril! ^^

	if (!currentSection) {
		error("UNIONs must be inside a SECTION\n");
		return;
	}
	if (sect_HasData(currentSection->type)) {
		error("Cannot use UNION inside of ROM0 or ROMX sections\n");
		return;
	}
	struct UnionStackEntry *entry = malloc(sizeof(*entry));

	if (!entry)
		fatalerror("Failed to allocate new union stack entry: %s\n", strerror(errno));
	entry->start = curOffset;
	entry->size = 0;
	entry->next = unionStack;
	unionStack = entry;
}

static void endUnionMember(void)
{
	uint32_t memberSize = curOffset - unionStack->start;

	if (memberSize > unionStack->size)
		unionStack->size = memberSize;
	curOffset = unionStack->start;
}

void sect_NextUnionMember(void)
{
	if (!unionStack) {
		error("Found NEXTU outside of a UNION construct\n");
		return;
	}
	endUnionMember();
}

void sect_EndUnion(void)
{
	if (!unionStack) {
		error("Found ENDU outside of a UNION construct\n");
		return;
	}
	endUnionMember();
	curOffset += unionStack->size;
	struct UnionStackEntry *next = unionStack->next;

	free(unionStack);
	unionStack = next;
}

void sect_CheckUnionClosed(void)
{
	if (unionStack)
		error("Unterminated UNION construct!\n");
}

// Output an absolute byte
void sect_AbsByte(uint8_t b)
{
	if (!checkcodesection())
		return;
	if (!reserveSpace(1))
		return;

	writebyte(b);
}

void sect_AbsByteGroup(uint8_t const *s, size_t length)
{
	if (!checkcodesection())
		return;
	if (!reserveSpace(length))
		return;

	while (length--)
		writebyte(*s++);
}

void sect_AbsWordGroup(uint8_t const *s, size_t length)
{
	if (!checkcodesection())
		return;
	if (!reserveSpace(length * 2))
		return;

	while (length--)
		writeword(*s++);
}

void sect_AbsLongGroup(uint8_t const *s, size_t length)
{
	if (!checkcodesection())
		return;
	if (!reserveSpace(length * 4))
		return;

	while (length--)
		writelong(*s++);
}

// Skip this many bytes
void sect_Skip(uint32_t skip, bool ds)
{
	if (!checksection())
		return;
	if (!reserveSpace(skip))
		return;

	if (!sect_HasData(currentSection->type)) {
		growSection(skip);
	} else {
		if (!ds)
			warning(WARNING_EMPTY_DATA_DIRECTIVE, "%s directive without data in ROM\n",
				(skip == 4) ? "DL" : (skip == 2) ? "DW" : "DB");
		// We know we're in a code SECTION
		while (skip--)
			writebyte(fillByte);
	}
}

// Output a NULL terminated string (excluding the NULL-character)
void sect_String(char const *s)
{
	if (!checkcodesection())
		return;
	if (!reserveSpace(strlen(s)))
		return;

	while (*s)
		writebyte(*s++);
}

// Output a relocatable byte. Checking will be done to see if it
// is an absolute value in disguise.
void sect_RelByte(struct Expression *expr, uint32_t pcShift)
{
	if (!checkcodesection())
		return;
	if (!reserveSpace(1))
		return;

	if (!rpn_isKnown(expr)) {
		createPatch(PATCHTYPE_BYTE, expr, pcShift);
		writebyte(0);
	} else {
		writebyte(expr->val);
	}
	rpn_Free(expr);
}

// Output several copies of a relocatable byte. Checking will be done to see if
// it is an absolute value in disguise.
void sect_RelBytes(uint32_t n, struct Expression *exprs, size_t size)
{
	if (!checkcodesection())
		return;
	if (!reserveSpace(n))
		return;

	for (uint32_t i = 0; i < n; i++) {
		struct Expression *expr = &exprs[i % size];

		if (!rpn_isKnown(expr)) {
			createPatch(PATCHTYPE_BYTE, expr, i);
			writebyte(0);
		} else {
			writebyte(expr->val);
		}
	}

	for (size_t i = 0; i < size; i++)
		rpn_Free(&exprs[i]);
}

// Output a relocatable word. Checking will be done to see if
// it's an absolute value in disguise.
void sect_RelWord(struct Expression *expr, uint32_t pcShift)
{
	if (!checkcodesection())
		return;
	if (!reserveSpace(2))
		return;

	if (!rpn_isKnown(expr)) {
		createPatch(PATCHTYPE_WORD, expr, pcShift);
		writeword(0);
	} else {
		writeword(expr->val);
	}
	rpn_Free(expr);
}

// Output a relocatable longword. Checking will be done to see if
// is an absolute value in disguise.
void sect_RelLong(struct Expression *expr, uint32_t pcShift)
{
	if (!checkcodesection())
		return;
	if (!reserveSpace(2))
		return;

	if (!rpn_isKnown(expr)) {
		createPatch(PATCHTYPE_LONG, expr, pcShift);
		writelong(0);
	} else {
		writelong(expr->val);
	}
	rpn_Free(expr);
}

// Output a PC-relative relocatable byte. Checking will be done to see if it
// is an absolute value in disguise.
void sect_PCRelByte(struct Expression *expr, uint32_t pcShift)
{
	if (!checkcodesection())
		return;
	if (!reserveSpace(1))
		return;
	struct Symbol const *pc = sym_GetPC();

	if (!rpn_IsDiffConstant(expr, pc)) {
		createPatch(PATCHTYPE_JR, expr, pcShift);
		writebyte(0);
	} else {
		struct Symbol const *sym = rpn_SymbolOf(expr);
		// The offset wraps (jump from ROM to HRAM, for example)
		int16_t offset;

		// Offset is relative to the byte *after* the operand
		if (sym == pc)
			offset = -2; // PC as operand to `jr` is lower than reference PC by 2
		else
			offset = sym_GetValue(sym) - (sym_GetValue(pc) + 1);

		if (offset < -128 || offset > 127) {
			error("jr target out of reach (expected -129 < %" PRId16 " < 128)\n",
				offset);
			writebyte(0);
		} else {
			writebyte(offset);
		}
	}
	rpn_Free(expr);
}

// Output a binary file
void sect_BinaryFile(char const *s, int32_t startPos)
{
	if (startPos < 0) {
		error("Start position cannot be negative (%" PRId32 ")\n", startPos);
		startPos = 0;
	}
	if (!checkcodesection())
		return;

	char *fullPath = NULL;
	size_t size = 0;
	FILE *f = NULL;

	if (fstk_FindFile(s, &fullPath, &size))
		f = fopen(fullPath, "rb");
	free(fullPath);

	if (!f) {
		if (generatedMissingIncludes) {
			if (verbose)
				printf("Aborting (-MG) on INCBIN file '%s' (%s)\n", s, strerror(errno));
			failedOnMissingInclude = true;
			return;
		}
		error("Error opening INCBIN file '%s': %s\n", s, strerror(errno));
		return;
	}

	int32_t fsize = -1;
	int byte;

	if (fseek(f, 0, SEEK_END) != -1) {
		fsize = ftell(f);

		if (startPos > fsize) {
			error("Specified start position is greater than length of file\n");
			goto cleanup;
		}

		fseek(f, startPos, SEEK_SET);
		if (!reserveSpace(fsize - startPos))
			goto cleanup;
	} else {
		if (errno != ESPIPE)
			error("Error determining size of INCBIN file '%s': %s\n",
			      s, strerror(errno));
		// The file isn't seekable, so we'll just skip bytes
		while (startPos--)
			(void)fgetc(f);
	}

	while ((byte = fgetc(f)) != EOF) {
		if (fsize == -1)
			growSection(1);
		writebyte(byte);
	}

	if (ferror(f))
		error("Error reading INCBIN file '%s': %s\n", s, strerror(errno));

cleanup:
	fclose(f);
}

void sect_BinaryFileSlice(char const *s, int32_t start_pos, int32_t length)
{
	if (start_pos < 0) {
		error("Start position cannot be negative (%" PRId32 ")\n", start_pos);
		start_pos = 0;
	}

	if (length < 0) {
		error("Number of bytes to read cannot be negative (%" PRId32 ")\n", length);
		length = 0;
	}

	if (!checkcodesection())
		return;
	if (length == 0) // Don't even bother with 0-byte slices
		return;
	if (!reserveSpace(length))
		return;

	char *fullPath = NULL;
	size_t size = 0;
	FILE *f = NULL;

	if (fstk_FindFile(s, &fullPath, &size))
		f = fopen(fullPath, "rb");
	free(fullPath);

	if (!f) {
		if (generatedMissingIncludes) {
			if (verbose)
				printf("Aborting (-MG) on INCBIN file '%s' (%s)\n", s, strerror(errno));
			failedOnMissingInclude = true;
		} else {
			error("Error opening INCBIN file '%s': %s\n", s, strerror(errno));
		}
		return;
	}

	int32_t fsize;

	if (fseek(f, 0, SEEK_END) != -1) {
		fsize = ftell(f);

		if (start_pos > fsize) {
			error("Specified start position is greater than length of file\n");
			goto cleanup;
		}

		if ((start_pos + length) > fsize) {
			error("Specified range in INCBIN is out of bounds (%" PRIu32 " + %" PRIu32
			      " > %" PRIu32 ")\n", start_pos, length, fsize);
			goto cleanup;
		}

		fseek(f, start_pos, SEEK_SET);
	} else {
		if (errno != ESPIPE)
			error("Error determining size of INCBIN file '%s': %s\n",
				s, strerror(errno));
		// The file isn't seekable, so we'll just skip bytes
		while (start_pos--)
			(void)fgetc(f);
	}

	while (length--) {
		int byte = fgetc(f);

		if (byte != EOF) {
			writebyte(byte);
		} else if (ferror(f)) {
			error("Error reading INCBIN file '%s': %s\n", s, strerror(errno));
		} else {
			error("Premature end of file (%" PRId32 " bytes left to read)\n",
				length + 1);
		}
	}

cleanup:
	fclose(f);
}

// Section stack routines
void sect_PushSection(void)
{
	struct SectionStackEntry *entry = malloc(sizeof(*entry));

	if (entry == NULL)
		fatalerror("No memory for section stack: %s\n",  strerror(errno));
	entry->section = currentSection;
	entry->loadSection = currentLoadSection;
	entry->scope = sym_GetCurrentSymbolScope();
	entry->offset = curOffset;
	entry->loadOffset = loadOffset;
	entry->unionStack = unionStack;
	entry->next = sectionStack;
	sectionStack = entry;

	// Reset the section scope
	currentSection = NULL;
	currentLoadSection = NULL;
	sym_SetCurrentSymbolScope(NULL);
	unionStack = NULL;
}

void sect_PopSection(void)
{
	if (!sectionStack)
		fatalerror("No entries in the section stack\n");

	if (currentLoadSection)
		fatalerror("Cannot change the section within a `LOAD` block!\n");

	struct SectionStackEntry *entry = sectionStack;

	changeSection();
	currentSection = entry->section;
	currentLoadSection = entry->loadSection;
	sym_SetCurrentSymbolScope(entry->scope);
	curOffset = entry->offset;
	loadOffset = entry->loadOffset;
	unionStack = entry->unionStack;

	sectionStack = entry->next;
	free(entry);
}

bool sect_IsSizeKnown(struct Section const NONNULL(sect))
{
	// SECTION UNION and SECTION FRAGMENT can still grow
	if (sect->modifier != SECTION_NORMAL)
		return false;

	// The current section (or current load section if within one) is still growing
	if (sect == currentSection || sect == currentLoadSection)
		return false;

	// Any section on the stack is still growing
	for (struct SectionStackEntry *stack = sectionStack; stack; stack = stack->next) {
		if (stack->section && !strcmp(sect->name, stack->section->name))
			return false;
	}

	return true;
}
