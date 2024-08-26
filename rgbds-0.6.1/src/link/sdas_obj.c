/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2022, Eldred Habert and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "linkdefs.h"
#include "platform.h"

#include "link/assign.h"
#include "link/main.h"
#include "link/sdas_obj.h"
#include "link/section.h"
#include "link/symbol.h"

enum NumberType {
	HEX = 16, // X
	DEC = 10, // D
	OCT = 8, // Q
};

static void consumeLF(struct FileStackNode const *where, uint32_t lineNo, FILE *file) {
	if (getc(file) != '\n')
		fatal(where, lineNo, "Bad line ending (CR without LF)");
}

static char const *delim = " \f\n\r\t\v"; // Whitespace according to the C and POSIX locales

static int nextLine(char **restrict lineBuf, size_t *restrict bufLen, uint32_t *restrict lineNo, struct FileStackNode const *where, FILE *file) {
retry:
	++*lineNo;
	int firstChar = getc(file);

	switch (firstChar) {
	case EOF:
		return EOF;
	case ';':
		// Discard comment line
		// TODO: if `;!FILE [...]` on the first line (`lineNo`), return it
		do {
			firstChar = getc(file);
		} while (firstChar != EOF && firstChar != '\r' && firstChar != '\n');
		// fallthrough
	case '\r':
		if (firstChar == '\r' && getc(file) != '\n')
			consumeLF(where, *lineNo, file);
		// fallthrough
	case '\n':
		goto retry;
	}

	size_t i = 0;

	for (;;) {
		if (i >= *bufLen) {
			assert(*bufLen != 0);
			*bufLen *= 2;
			*lineBuf = realloc(*lineBuf, *bufLen);
			if (!*lineBuf)
				fatal(where, *lineNo, "Failed to realloc: %s", strerror(errno));
		}

		int c = getc(file);

		switch (c) {
		case '\r':
			consumeLF(where, *lineNo, file);
			// fallthrough
		case '\n':
		case EOF:
			(*lineBuf)[i] = '\0'; // Terminate the string (space was ensured above)
			return firstChar;
		}
		(*lineBuf)[i] = c;
		++i;
	}
}

static uint32_t readNumber(char const *restrict str, char const **endptr, enum NumberType base) {
	uint32_t res = 0;

	for (;;) {
		static char const *digits = "0123456789ABCDEF";
		char const *ptr = strchr(digits, toupper(*str));

		if (!ptr || ptr - digits >= base) {
			*endptr = str;
			return res;
		}
		++str;
		res = res * base + (ptr - digits);
	}
}

static uint32_t parseNumber(struct FileStackNode const *where, uint32_t lineNo, char const *restrict str, enum NumberType base) {
	if (str[0] == '\0')
		fatal(where, lineNo, "Expected number, got empty string");

	char const *endptr;
	uint32_t res = readNumber(str, &endptr, base);

	if (*endptr != '\0')
		fatal(where, lineNo, "Expected number, got \"%s\"", str);
	return res;
}

static uint8_t parseByte(struct FileStackNode const *where, uint32_t lineNo, char const *restrict str, enum NumberType base) {
	uint32_t num = parseNumber(where, lineNo, str, base);

	if (num > UINT8_MAX)
		fatal(where, lineNo, "\"%s\" is not a byte", str);
	return num;
}

enum AreaFlags {
	AREA_TYPE = 2, // 0: Concatenate, 1: overlay
	AREA_ISABS, // 0: Relative (???) address, 1: absolute address
	AREA_PAGING, // Unsupported

	AREA_ALL_FLAGS = 1 << AREA_TYPE | 1 << AREA_ISABS | 1 << AREA_PAGING,
};

enum RelocFlags {
	RELOC_SIZE, // 0: 16-bit, 1: 8-bit
	RELOC_ISSYM, // 0: Area, 1: Symbol
	RELOC_ISPCREL, // 0: Normal, 1: PC-relative
	RELOC_EXPR16, // Only for 8-bit size; 0: 8-bit expr, 1: 16-bit expr
	RELOC_SIGNED, // 0: signed, 1: unsigned
	RELOC_ZPAGE, // Unsupported
	RELOC_NPAGE, // Unsupported
	RELOC_WHICHBYTE, // 8-bit size with 16-bit expr only; 0: LOW(), 1: HIGH()
	RELOC_EXPR24, // Only for 8-bit size; 0: follow RELOC_EXPR16, 1: 24-bit expr
	RELOC_BANKBYTE, // 8-bit size with 24-bit expr only; 0: follow RELOC_WHICHBYTE, 1: BANK()

	RELOC_ALL_FLAGS = 1 << RELOC_SIZE | 1 << RELOC_ISSYM | 1 << RELOC_ISPCREL | 1 << RELOC_EXPR16
		| 1 << RELOC_SIGNED | 1 << RELOC_ZPAGE | 1 << RELOC_NPAGE | 1 << RELOC_WHICHBYTE
		| 1 << RELOC_EXPR24 | 1 << RELOC_BANKBYTE,
};

void sdobj_ReadFile(struct FileStackNode const *where, FILE *file) {
	size_t bufLen = 256;
	char *line = malloc(bufLen);
	char const *token;

#define getToken(ptr, ...) do { \
	token = strtok((ptr), delim); \
	if (!token) \
		fatal(where, lineNo, __VA_ARGS__); \
} while (0)
#define expectEol(...) do { \
	token = strtok(NULL, delim); \
	if (token) \
		fatal(where, lineNo, __VA_ARGS__); \
} while (0)
#define expectToken(expected, lineType) do { \
	getToken(NULL, "'%c' line is too short", (lineType)); \
	if (strcasecmp(token, (expected)) != 0) \
		fatal(where, lineNo, "Malformed '%c' line: expected \"%s\", got \"%s\"", (lineType), (expected), token); \
} while (0)

	if (!line)
		fatal(where, 0, "Failed to alloc a line buffer: %s", strerror(errno));
	uint32_t lineNo = 0;
	int lineType = nextLine(&line, &bufLen, &lineNo, where, file);
	enum NumberType numberType;

	// The first letter (thus, the line type) identifies the integer type
	switch (lineType) {
	case EOF:
		fatal(where, lineNo, "SDCC object only contains comments and empty lines");
	case 'X':
		numberType = HEX;
		break;
	case 'D':
		numberType = DEC;
		break;
	case 'Q':
		numberType = OCT;
		break;
	default:
		fatal(where, lineNo, "This does not look like a SDCC object file (unknown integer format '%c')", lineType);
	}

	switch (line[0]) {
	case 'L':
		break;
	case 'H':
		fatal(where, lineNo, "Big-endian SDCC object files are not supported");
	default:
		fatal(where, lineNo, "Unknown endianness type '%c'", line[0]);
	}

#define ADDR_SIZE 3
	if (line[1] != '0' + ADDR_SIZE)
		fatal(where, lineNo, "Unknown or unsupported address size '%c'", line[1]);

	if (line[2] != '\0')
		warning(where, lineNo, "Ignoring unknown characters (\"%s\") in first line", &line[2]);

	// Header line

	lineType = nextLine(&line, &bufLen, &lineNo, where, file);
	if (lineType != 'H')
		fatal(where, lineNo, "Expected header line, got '%c' line", lineType);
	// Expected format: "A areas S global symbols"

	getToken(line, "Empty 'H' line");
	uint32_t expectedNbAreas = parseNumber(where, lineNo, token, numberType);

	expectToken("areas", 'H');

	getToken(NULL, "'H' line is too short");
	uint32_t expectedNbSymbols = parseNumber(where, lineNo, token, numberType);

	expectToken("global", 'H');

	expectToken("symbols", 'H');

	expectEol("'H' line is too long");

	// Now, let's parse the rest of the lines as they come!

	struct {
		struct Section *section;
		uint16_t writeIndex;
	} *fileSections = NULL;
	struct Symbol **fileSymbols = malloc(sizeof(*fileSymbols) * expectedNbSymbols);
	size_t nbSections = 0, nbSymbols = 0;

	if (!fileSymbols)
		fatal(where, lineNo, "Failed to alloc file symbols table: %s", strerror(errno));
	size_t nbBytes = 0; // How many bytes are in `data`, including the ADDR_SIZE "header" bytes
	size_t dataCapacity = 16 + ADDR_SIZE; // SDCC object files usually contain 16 bytes per T line
	uint8_t *data = malloc(sizeof(*data) * dataCapacity);

	if (!data)
		fatal(where, lineNo, "Failed to alloc data buffer: %s", strerror(errno));
	for (;;) {
		lineType = nextLine(&line, &bufLen, &lineNo, where, file);
		if (lineType == EOF)
			break;
		switch (lineType) {
			uint32_t tmp;

		case 'M': // Module name
		case 'O': // Assembler flags
			// Ignored
			break;

		case 'A':
			if (nbSections == expectedNbAreas)
				warning(where, lineNo, "Got more 'A' lines than the expected %" PRIu32, expectedNbAreas);
			fileSections = realloc(fileSections, sizeof(*fileSections) * (nbSections + 1));
			if (!fileSections)
				fatal(where, lineNo, "Failed to realloc file areas: %s", strerror(errno));
			fileSections[nbSections].writeIndex = 0;
#define curSection (fileSections[nbSections].section)
			curSection = malloc(sizeof(*curSection));
			if (!curSection)
				fatal(where, lineNo, "Failed to alloc new area: %s", strerror(errno));

			getToken(line, "'A' line is too short");
			assert(strlen(token) != 0); // This should be impossible, tokens are non-empty
			// The following is required for fragment offsets to be reliably predicted
			for (size_t i = 0; i < nbSections; ++i) {
				if (!strcmp(token, fileSections[i].section->name))
					fatal(where, lineNo, "Area \"%s\" already defined earlier", token);
			}
			char const *sectionName = token; // We'll deal with the section's name depending on type

			expectToken("size", 'A');

			getToken(NULL, "'A' line is too short");
			tmp = parseNumber(where, lineNo, token, numberType);
			if (tmp > UINT16_MAX)
				fatal(where, lineNo, "Area \"%s\" is larger than the GB address space!?", curSection->name);
			curSection->size = tmp;

			expectToken("flags", 'A');

			getToken(NULL, "'A' line is too short");
			tmp = parseNumber(where, lineNo, token, numberType);
			if (tmp & (1 << AREA_PAGING))
				fatal(where, lineNo, "Internal error: paging is not supported");
			curSection->isAddressFixed = tmp & (1 << AREA_ISABS);
			curSection->isBankFixed = curSection->isAddressFixed;
			curSection->modifier = curSection->isAddressFixed || (tmp & (1 << AREA_TYPE))
				? SECTION_NORMAL : SECTION_FRAGMENT;
			// If the section is absolute, its name might not be unique; thus, mangle the name
			if (curSection->modifier == SECTION_NORMAL) {
				size_t len = strlen(where->name) + 1 + strlen(token);

				curSection->name = malloc(len + 1);
				if (!curSection->name)
					fatal(where, lineNo, "Failed to alloc new area's name: %s", strerror(errno));
				sprintf(curSection->name, "%s %s", where->name, sectionName);
			} else {
				curSection->name = strdup(sectionName); // We need a pointer that will live longer
				if (!curSection->name)
					fatal(where, lineNo, "Failed to alloc new area's name: %s", strerror(errno));
			}

			expectToken("addr", 'A');

			getToken(NULL, "'A' line is too short");
			tmp = parseNumber(where, lineNo, token, numberType);
			curSection->org = tmp; // Truncation keeps the address portion only
			curSection->bank = tmp >> 16;

			expectEol("'A' line is too long");

			// Init the rest of the members
			curSection->offset = 0;
			if (curSection->isAddressFixed) {
				uint8_t high = curSection->org >> 8;

				if (high < 0x40) {
					curSection->type = SECTTYPE_ROM0;
				} else if (high < 0x80) {
					curSection->type = SECTTYPE_ROMX;
				} else if (high < 0xA0) {
					curSection->type = SECTTYPE_VRAM;
				} else if (high < 0xC0) {
					curSection->type = SECTTYPE_SRAM;
				} else if (high < 0xD0) {
					curSection->type = SECTTYPE_WRAM0;
				} else if (high < 0xE0) {
					curSection->type = SECTTYPE_WRAMX;
				} else if (high < 0xFE) {
					fatal(where, lineNo, "Areas in echo RAM are not supported");
				} else if (high < 0xFF) {
					curSection->type = SECTTYPE_OAM;
				} else {
					curSection->type = SECTTYPE_HRAM;
				}
			} else {
				curSection->type = SECTTYPE_INVALID; // This means "indeterminate"
			}
			curSection->isAlignFixed = false; // No such concept!
			// The array will be allocated if the section does contain data
			curSection->data = NULL;
			curSection->nbPatches = 0;
			curSection->patches = NULL; // Same as `data`
			curSection->fileSymbols = fileSymbols; // IDs are instead per-section
			curSection->nbSymbols = 0;
			curSection->symbols = NULL; // Will be allocated on demand as well
			curSection->nextu = NULL;
#undef curSection
			++nbSections;
			break;

		case 'S':
			if (nbSymbols == expectedNbSymbols)
				warning(where, lineNo, "Got more 'S' lines than the expected %" PRIu32, expectedNbSymbols);
			// `realloc` is dangerous, as sections contain a pointer to `fileSymbols`.
			// We can try to be nice, but if the pointer moves, it's game over!
			if (nbSymbols >= expectedNbSymbols) {
				struct Symbol **newFileSymbols = realloc(fileSymbols, sizeof(*fileSymbols) * (nbSymbols + 1));

				if (!newFileSymbols)
					fatal(where, lineNo, "Failed to alloc extra symbols: %s", strerror(errno));
				if (newFileSymbols != fileSymbols)
					fatal(where, lineNo, "Couldn't handle extra 'S' lines (pointer moved)");
				// No need to assign, obviously
			}
#define symbol (fileSymbols[nbSymbols])
			symbol = malloc(sizeof(*symbol));
			if (!symbol)
				fatal(where, lineNo, "Failed to alloc symbol: %s", strerror(errno));

			// Init other members
			symbol->objFileName = where->name;
			symbol->src = where;
			symbol->lineNo = lineNo;

			// No need to set the `sectionID`, since we can directly set the pointer
			symbol->section = fileSections ? fileSections[nbSections - 1].section : NULL;

			getToken(line, "'S' line is too short");
			symbol->name = strdup(token);
			if (!symbol->name)
				fatal(where, lineNo, "Failed to alloc symbol name: %s", strerror(errno));

			getToken(NULL, "'S' line is too short");
			// It might be an `offset`, but both types are the same so type punning is fine
			symbol->value = parseNumber(where, lineNo, &token[3], numberType);
			if (symbol->section && symbol->section->isAddressFixed) {
				assert(symbol->offset >= symbol->section->org);
				symbol->offset -= symbol->section->org;
				assert(symbol->offset <= symbol->section->size);
			}

			// Expected format: /[DR]ef[0-9A-F]+/i
			if (token[0] == 'R' || token[0] == 'r') {
				symbol->type = SYMTYPE_IMPORT;
				// TODO: hard error if the rest is not zero
			} else if (token[0] != 'D' && token[0] != 'd') {
				fatal(where, lineNo, "'S' line is neither \"Def\" nor \"Ref\"");
			} else {
				// All symbols are exported
				symbol->type = SYMTYPE_EXPORT;
				struct Symbol const *other = sym_GetSymbol(symbol->name);

				if (other) {
					// The same symbol can only be defined twice if neither
					// definition is in a floating section
					if ((other->section && !other->section->isAddressFixed)
					 || (symbol->section && !symbol->section->isAddressFixed)) {
					 	sym_AddSymbol(symbol); // This will error out
					} else if (other->value != symbol->value) {
						error(where, lineNo,
						      "Definition of \"%s\" conflicts with definition in %s (%" PRId32 " != %" PRId32 ")",
						      symbol->name, other->objFileName, symbol->value, other->value);
					}
				} else {
					// Add a new definition
					sym_AddSymbol(symbol);
				}
				// It's fine to keep modifying the symbol after `AddSymbol`, only
				// the name must not be modified
			}
			if (strncasecmp(&token[1], "ef", 2) != 0)
				fatal(where, lineNo, "'S' line is neither \"Def\" nor \"Ref\"");

			if (nbSections != 0) {
				struct Section *section = fileSections[nbSections - 1].section;

				++section->nbSymbols;
				section->symbols = realloc(section->symbols, sizeof(section->symbols[0]) * section->nbSymbols);
				if (!section->symbols)
					fatal(where, lineNo, "Failed to realloc \"%s\"'s symbol list: %s", section->name, strerror(errno));
				section->symbols[section->nbSymbols - 1] = symbol;
			}
#undef symbol

			expectEol("'S' line is too long");

			++nbSymbols;
			break;

		case 'T':
			// Now, time to parse the data!
			if (nbBytes != 0)
				warning(where, lineNo, "Previous 'T' line had no 'R' line (ignored)");

			nbBytes = 0;
			for (token = strtok(line, delim); token; token = strtok(NULL, delim)) {
				if (dataCapacity == nbBytes) {
					dataCapacity *= 2;
					data = realloc(data, sizeof(*data) * dataCapacity);
					if (!data)
						fatal(where, lineNo, "Failed to realloc data buffer: %s", strerror(errno));
				}
				data[nbBytes] = parseByte(where, lineNo, token, numberType);
				++nbBytes;
			}

			if (nbBytes < ADDR_SIZE)
				fatal(where, lineNo, "'T' line is too short");
			// Importantly, now we know that `nbBytes != 0`, which means "pending data"
			break;

		case 'R': // Supposed to directly follow `T`
			if (nbBytes == 0) {
				warning(where, lineNo, "'R' line with no 'T' line, ignoring");
				break;
			}

			// First two bytes are ignored
			getToken(line, "'R' line is too short");
			getToken(NULL, "'R' line is too short");
			uint16_t areaIdx;

			getToken(NULL, "'R' line is too short");
			areaIdx = parseByte(where, lineNo, token, numberType);
			getToken(NULL, "'R' line is too short");
			areaIdx |= (uint16_t)parseByte(where, lineNo, token, numberType) << 8;
			if (areaIdx >= nbSections)
				fatal(where, lineNo, "'R' line references area #%" PRIu16 ", but there are only %zu (so far)", areaIdx, nbSections);
			assert(fileSections); // There should be at least one, from the above check
			struct Section *section = fileSections[areaIdx].section;
			uint16_t *writeIndex = &fileSections[areaIdx].writeIndex;
			uint8_t writtenOfs = ADDR_SIZE; // Bytes before this have been written to ->data
			uint16_t addr = data[0] | data[1] << 8;

			if (section->isAddressFixed) {
				if (addr < section->org)
					fatal(where, lineNo, "'T' line reports address $%04" PRIx16 " in \"%s\", which starts at $%04" PRIx16, addr, section->name, section->org);
				addr -= section->org;
			}
			// Lines are emitted that violate this check but contain no "payload";
			// ignore those. "Empty" lines shouldn't trigger allocation, either.
			if (nbBytes != ADDR_SIZE) {
				if (addr != *writeIndex)
					fatal(where, lineNo, "'T' lines which don't append to their section are not supported (%" PRIu16 " != %" PRIu16 ")", addr, *writeIndex);
				if (!section->data) {
					assert(section->size != 0);
					section->data = malloc(section->size);
					if (!section->data)
						fatal(where, lineNo, "Failed to alloc data for \"%s\": %s", section->name, strerror(errno));
				}
			}

			// Processing relocations is made difficult by SDLD's honestly quite bonkers
			// handling of the thing.
			// The way they work is that 16-bit relocs are, simply enough, writing a
			// 16-bit value over a 16-bit "gap". Nothing weird here.
			// 8-bit relocs, however, do not write an 8-bit value over an 8-bit gap!
			// They write an 8-bit value over a 16-bit gap... and either of the two
			// bytes is *discarded*. The "24-bit" flag extends this behavior to three
			// bytes instead of two, but the idea's the same.
			// Additionally, the "offset" is relative to *before* bytes from previous
			// relocs are removed, so this needs to be accounted for as well.
			// This all can be "translated" to RGBDS parlance by generating the
			// appropriate RPN expression (depending on flags), plus an addition for the
			// bytes being patched over.
			while ((token = strtok(NULL, delim)) != NULL) {
				uint16_t flags = parseByte(where, lineNo, token, numberType);

				if ((flags & 0xF0) == 0xF0) {
					getToken(NULL, "Incomplete relocation");
					flags = (flags & 0x0F) | (uint16_t)parseByte(where, lineNo, token, numberType) << 4;
				}

				getToken(NULL, "Incomplete relocation");
				uint8_t offset = parseByte(where, lineNo, token, numberType);

				if (offset < ADDR_SIZE)
					fatal(where, lineNo, "Relocation index cannot point to header (%" PRIu16 " < %u)", offset, ADDR_SIZE);
				if (offset >= nbBytes)
					fatal(where, lineNo, "Relocation index is out of bounds (%" PRIu16 " >= %zu)", offset, nbBytes);

				getToken(NULL, "Incomplete relocation");
				uint16_t idx = parseByte(where, lineNo, token, numberType);

				getToken(NULL, "Incomplete relocation");
				idx |= (uint16_t)parseByte(where, lineNo, token, numberType);

				// Loudly fail on unknown flags
				if (flags & (1 << RELOC_ZPAGE | 1 << RELOC_NPAGE))
					fatal(where, lineNo, "Paging flags are not supported");
				if (flags & ~RELOC_ALL_FLAGS)
					warning(where, lineNo, "Unknown reloc flags 0x%x", flags & ~RELOC_ALL_FLAGS);

				// Turn this into a Patch
				section->patches = realloc(section->patches, sizeof(section->patches[0]) * (section->nbPatches + 1));
				if (!section->patches)
					fatal(where, lineNo, "Failed to alloc extra patch for \"%s\"", section->name);
				struct Patch *patch = &section->patches[section->nbPatches];

				patch->lineNo = lineNo;
				patch->src = where;
				patch->offset = offset - writtenOfs + *writeIndex;
				if (section->nbPatches != 0 && section->patches[section->nbPatches - 1].offset >= patch->offset)
					fatal(where, lineNo, "Relocs not sorted by offset are not supported (%" PRIu32 " >= %" PRIu32 ")", section->patches[section->nbPatches - 1].offset, patch->offset);
				patch->pcSection = section; // No need to fill `pcSectionID`, then
				patch->pcOffset = patch->offset - 1; // For `jr`s

				patch->type = flags & 1 << RELOC_SIZE ? PATCHTYPE_BYTE : PATCHTYPE_WORD;
				uint8_t nbBaseBytes = patch->type == PATCHTYPE_BYTE ? ADDR_SIZE : 2;
				uint32_t baseValue = 0;

				assert(offset < nbBytes);
				if (nbBytes - offset < nbBaseBytes)
					fatal(where, lineNo, "Reloc would patch out of bounds (%" PRIu8 " > %zu)", nbBaseBytes, nbBytes - offset);
				for (uint8_t i = 0; i < nbBaseBytes; ++i)
					baseValue = baseValue | data[offset + i] << (8 * i);

// Extra size that must be reserved for additional operators
#define RPN_EXTRA_SIZE (5 + 1 + 5 + 1 + 5 + 1) // >> 8 & $FF, then + <baseValue>
#define allocPatch(size) do { \
	patch->rpnSize = (size); \
	patch->rpnExpression = malloc(patch->rpnSize + RPN_EXTRA_SIZE); \
	if (!patch->rpnExpression) \
		fatal(where, lineNo, "Failed to alloc RPN expression: %s", strerror(errno)); \
} while (0)
				// Bit 4 specifies signedness, but I don't think that matters?
				// Generate a RPN expression from the info and flags
				if (flags & 1 << RELOC_ISSYM) {
					if (idx >= nbSymbols)
						fatal(where, lineNo, "Reloc refers to symbol #%" PRIu16 " out of %zu", idx, nbSymbols);
					struct Symbol const *sym = fileSymbols[idx];

					// SDCC has a bunch of "magic symbols" that start with a
					// letter and an underscore. These are not compatibility
					// hacks, this is how SDLD actually works.
					if (sym->name[0] == 'b' && sym->name[1] == '_') {
						// Look for the symbol being referenced, and use its index instead
						for (idx = 0; idx < nbSymbols; ++idx) {
							if (strcmp(&sym->name[1], fileSymbols[idx]->name) == 0)
								break;
						}
						if (idx == nbSymbols)
							fatal(where, lineNo, "\"%s\" is missing a reference to \"%s\"", sym->name, &sym->name[1]);
						allocPatch(5);
						patch->rpnExpression[0] = RPN_BANK_SYM;
						patch->rpnExpression[1] = idx;
						patch->rpnExpression[2] = idx >> 8;
						patch->rpnExpression[3] = idx >> 16;
						patch->rpnExpression[4] = idx >> 24;
					} else if (sym->name[0] == 'l' && sym->name[1] == '_') {
						allocPatch(1 + strlen(&sym->name[2]) + 1);
						patch->rpnExpression[0] = RPN_SIZEOF_SECT;
						strcpy((char *)&patch->rpnExpression[1], &sym->name[2]);
					} else if (sym->name[0] == 's' && sym->name[1] == '_') {
						allocPatch(1 + strlen(&sym->name[2]) + 1);
						patch->rpnExpression[0] = RPN_STARTOF_SECT;
						strcpy((char *)&patch->rpnExpression[1], &sym->name[2]);
					} else {
						allocPatch(5);
						patch->rpnExpression[0] = RPN_SYM;
						patch->rpnExpression[1] = idx;
						patch->rpnExpression[2] = idx >> 8;
						patch->rpnExpression[3] = idx >> 16;
						patch->rpnExpression[4] = idx >> 24;
					}
				} else {
					if (idx >= nbSections)
						fatal(where, lineNo, "Reloc refers to area #%" PRIu16 " out of %zu", idx, nbSections);
					// It gets funky. If the area is absolute, *actually*, we
					// must not add its base address, as the assembler will
					// already have added it in `baseValue`.
					// We counteract this by subtracting the section's base
					// address from `baseValue`, undoing what the assembler did;
					// this allows the relocation to still be correct, even if
					// the section gets moved for any reason.
					if (fileSections[idx].section->isAddressFixed)
						baseValue -= fileSections[idx].section->org;
					char const *name = fileSections[idx].section->name;
					struct Section const *other = sect_GetSection(name);

					// Unlike with `s_<AREA>`, referencing an area in this way
					// wants the beginning of this fragment, so we must add the
					// fragment's (putative) offset to account for this.
					// The fragment offset prediction is guaranteed since each
					// section can only have one fragment per SDLD object file,
					// so this fragment will be appended to the existing section
					// *if any*, and thus its offset will be the section's
					// current size.
					if (other)
						baseValue += other->size;
					allocPatch(1 + strlen(name) + 1);
					patch->rpnSize = 1 + strlen(name) + 1;
					patch->rpnExpression = malloc(patch->rpnSize + RPN_EXTRA_SIZE);
					if (!patch->rpnExpression)
						fatal(where, lineNo, "Failed to alloc RPN expression: %s", strerror(errno));
					patch->rpnExpression[0] = RPN_STARTOF_SECT;
					// The cast is fine, it's just different signedness
					strcpy((char *)&patch->rpnExpression[1], name);
				}
#undef allocPatch

				patch->rpnExpression[patch->rpnSize] = RPN_CONST;
				patch->rpnExpression[patch->rpnSize + 1] = baseValue;
				patch->rpnExpression[patch->rpnSize + 2] = baseValue >> 8;
				patch->rpnExpression[patch->rpnSize + 3] = baseValue >> 16;
				patch->rpnExpression[patch->rpnSize + 4] = baseValue >> 24;
				patch->rpnExpression[patch->rpnSize + 5] = RPN_ADD;
				patch->rpnSize += 5 + 1;

				if (patch->type == PATCHTYPE_BYTE) {
					// Despite the flag's name, as soon as it is set, 3 bytes
					// are present, so we must skip two of them
					if (flags & 1 << RELOC_EXPR16) {
						if (*writeIndex + (offset - writtenOfs) > section->size)
							fatal(where, lineNo, "'T' line writes past \"%s\"'s end (%u > %" PRIu16 ")", section->name, *writeIndex + (offset - writtenOfs), section->size);
						// Copy all bytes up to those (plus the byte that we'll overwrite)
						memcpy(&section->data[*writeIndex], &data[writtenOfs], offset - writtenOfs + 1);
						*writeIndex += offset - writtenOfs + 1;
						writtenOfs = offset + 3; // Skip all three `baseValue` bytes, though
					}

					// Append the necessary operations...
					if (flags & 1 << RELOC_ISPCREL) {
						// The result must *not* be truncated for those!
						patch->type = PATCHTYPE_JR;
						// TODO: check the other flags?
					} else if (flags & 1 << RELOC_EXPR24 && flags & 1 << RELOC_BANKBYTE) {
						patch->rpnExpression[patch->rpnSize] = RPN_CONST;
						patch->rpnExpression[patch->rpnSize + 1] = 16;
						patch->rpnExpression[patch->rpnSize + 2] = 16 >> 8;
						patch->rpnExpression[patch->rpnSize + 3] = 16 >> 16;
						patch->rpnExpression[patch->rpnSize + 4] = 16 >> 24;
						patch->rpnExpression[patch->rpnSize + 5] = flags & 1 << RELOC_SIGNED ? RPN_SHR : RPN_USHR;
						patch->rpnSize += 5 + 1;
					} else {
						if (flags & 1 << RELOC_EXPR16 && flags & 1 << RELOC_WHICHBYTE) {
							patch->rpnExpression[patch->rpnSize] = RPN_CONST;
							patch->rpnExpression[patch->rpnSize + 1] = 8;
							patch->rpnExpression[patch->rpnSize + 2] = 8 >> 8;
							patch->rpnExpression[patch->rpnSize + 3] = 8 >> 16;
							patch->rpnExpression[patch->rpnSize + 4] = 8 >> 24;
							patch->rpnExpression[patch->rpnSize + 5] = flags & 1 << RELOC_SIGNED ? RPN_SHR : RPN_USHR;
							patch->rpnSize += 5 + 1;
						}
						patch->rpnExpression[patch->rpnSize] = RPN_CONST;
						patch->rpnExpression[patch->rpnSize + 1] = 0xFF;
						patch->rpnExpression[patch->rpnSize + 2] = 0xFF >> 8;
						patch->rpnExpression[patch->rpnSize + 3] = 0xFF >> 16;
						patch->rpnExpression[patch->rpnSize + 4] = 0xFF >> 24;
						patch->rpnExpression[patch->rpnSize + 5] = RPN_AND;
						patch->rpnSize += 5 + 1;
					}
				} else if (flags & 1 << RELOC_ISPCREL) {
					assert(patch->type == PATCHTYPE_WORD);
					fatal(where, lineNo, "16-bit PC-relative relocations are not supported");
				} else if (flags & (1 << RELOC_EXPR16 | 1 << RELOC_EXPR24)) {
					fatal(where, lineNo, "Flags 0x%x are not supported for 16-bit relocs", flags & (1 << RELOC_EXPR16 | 1 << RELOC_EXPR24));
				}

				++section->nbPatches;
			}

			// If there is some data left to append, do so
			if (writtenOfs != nbBytes) {
				assert(nbBytes > writtenOfs);
				if (*writeIndex + (nbBytes - writtenOfs) > section->size)
					fatal(where, lineNo, "'T' line writes past \"%s\"'s end (%zu > %" PRIu16 ")", section->name, *writeIndex + (nbBytes - writtenOfs), section->size);
				memcpy(&section->data[*writeIndex], &data[writtenOfs], nbBytes - writtenOfs);
				*writeIndex += nbBytes - writtenOfs;
			}

			nbBytes = 0; // Do not allow two R lines to refer to the same T line
			break;

		case 'P':
		default:
			warning(where, lineNo, "Unknown/unsupported line type '%c', ignoring", lineType);
			break;
		}
	}

	if (nbBytes != 0)
		warning(where, lineNo, "Last 'T' line had no 'R' line (ignored)");
	if (nbSections < expectedNbAreas)
		warning(where, lineNo, "Expected %" PRIu32 " 'A' lines, got only %zu", expectedNbAreas, nbSections);
	if (nbSymbols < expectedNbSymbols)
		warning(where, lineNo, "Expected %" PRIu32 " 'S' lines, got only %zu", expectedNbSymbols, nbSymbols);

	nbSectionsToAssign += nbSections;

	for (size_t i = 0; i < nbSections; ++i) {
		struct Section *section = fileSections[i].section;

		// RAM sections can have a size, but don't get any data (they shouldn't have any)
		if (fileSections[i].writeIndex != section->size && fileSections[i].writeIndex != 0)
			fatal(where, lineNo, "\"%s\" was not fully written (%" PRIu16 " < %" PRIu16 ")", section->name, fileSections[i].writeIndex, section->size);

		// This must be done last, so that `->data` is not NULL anymore
		sect_AddSection(section);

		if (section->modifier == SECTION_FRAGMENT) {
			// Add the fragment's offset to all of its symbols
			for (uint32_t j = 0; j < section->nbSymbols; ++j)
				section->symbols[j]->offset += section->offset;
		}
	}

#undef expectEol
#undef expectToken
#undef getToken

	free(fileSections);
	free(data);
	fclose(file);
}
