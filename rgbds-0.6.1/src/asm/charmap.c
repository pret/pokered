/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2013-2018, stag019 and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#include <errno.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "asm/charmap.h"
#include "asm/main.h"
#include "asm/output.h"
#include "asm/util.h"
#include "asm/warning.h"

#include "hashmap.h"

// Charmaps are stored using a structure known as "trie".
// Essentially a tree, where each nodes stores a single character's worth of info:
// whether there exists a mapping that ends at the current character,
struct Charnode {
	bool isTerminal; // Whether there exists a mapping that ends here
	uint8_t value; // If the above is true, its corresponding value
	// This MUST be indexes and not pointers, because pointers get invalidated by `realloc`!
	size_t next[255]; // Indexes of where to go next, 0 = nowhere
};

#define INITIAL_CAPACITY 32

struct Charmap {
	char *name;
	size_t usedNodes; // How many nodes are being used
	size_t capacity; // How many nodes have been allocated
	struct Charnode nodes[]; // first node is reserved for the root node
};

static HashMap charmaps;

// Store pointers to hashmap nodes, so that there is only one pointer to the memory block
// that gets reallocated.
static struct Charmap **currentCharmap;

struct CharmapStackEntry {
	struct Charmap **charmap;
	struct CharmapStackEntry *next;
};

struct CharmapStackEntry *charmapStack;

static struct Charmap *charmap_Get(char const *name)
{
	return hash_GetElement(charmaps, name);
}

static void resizeCharmap(struct Charmap **map, size_t capacity)
{
	*map = realloc(*map, sizeof(**map) + sizeof(*(*map)->nodes) * capacity);

	if (!*map)
		fatalerror("Failed to %s charmap: %s\n",
			   *map ? "create" : "resize", strerror(errno));
	(**map).capacity = capacity;
}

static void initNode(struct Charnode *node)
{
	node->isTerminal = false;
	memset(node->next, 0, sizeof(node->next));
}

struct Charmap *charmap_New(char const *name, char const *baseName)
{
	struct Charmap *base = NULL;

	if (baseName != NULL) {
		base = charmap_Get(baseName);

		if (base == NULL)
			error("Base charmap '%s' doesn't exist\n", baseName);
	}

	struct Charmap *charmap = charmap_Get(name);

	if (charmap) {
		error("Charmap '%s' already exists\n", name);
		return charmap;
	}

	// Init the new charmap's fields
	if (base) {
		resizeCharmap(&charmap, base->capacity);
		charmap->usedNodes = base->usedNodes;

		memcpy(charmap->nodes, base->nodes, sizeof(base->nodes[0]) * charmap->usedNodes);
	} else {
		resizeCharmap(&charmap, INITIAL_CAPACITY);
		charmap->usedNodes = 1;
		initNode(&charmap->nodes[0]); // Init the root node
	}
	charmap->name = strdup(name);

	currentCharmap = (struct Charmap **)hash_AddElement(charmaps, charmap->name, charmap);

	return charmap;
}

void charmap_Delete(struct Charmap *charmap)
{
	free(charmap->name);
	free(charmap);
}

void charmap_Set(char const *name)
{
	struct Charmap **charmap = (struct Charmap **)hash_GetNode(charmaps, name);

	if (charmap == NULL)
		error("Charmap '%s' doesn't exist\n", name);
	else
		currentCharmap = charmap;
}

void charmap_Push(void)
{
	struct CharmapStackEntry *stackEntry;

	stackEntry = malloc(sizeof(*stackEntry));
	if (stackEntry == NULL)
		fatalerror("Failed to alloc charmap stack entry: %s\n", strerror(errno));

	stackEntry->charmap = currentCharmap;
	stackEntry->next = charmapStack;

	charmapStack = stackEntry;
}

void charmap_Pop(void)
{
	if (charmapStack == NULL) {
		error("No entries in the charmap stack\n");
		return;
	}

	struct CharmapStackEntry *top = charmapStack;

	currentCharmap = top->charmap;
	charmapStack = top->next;
	free(top);
}

void charmap_Add(char *mapping, uint8_t value)
{
	struct Charmap *charmap = *currentCharmap;
	struct Charnode *node = &charmap->nodes[0];

	for (uint8_t c; *mapping; mapping++) {
		c = *mapping - 1;

		if (node->next[c]) {
			node = &charmap->nodes[node->next[c]];
		} else {
			// Register next available node
			node->next[c] = charmap->usedNodes;
			// If no more nodes are available, get new ones
			if (charmap->usedNodes == charmap->capacity) {
				charmap->capacity *= 2;
				resizeCharmap(currentCharmap, charmap->capacity);
				charmap = *currentCharmap;
			}

			// Switch to and init new node
			node = &charmap->nodes[charmap->usedNodes++];
			initNode(node);
		}
	}

	if (node->isTerminal)
		warning(WARNING_CHARMAP_REDEF, "Overriding charmap mapping\n");

	node->isTerminal = true;
	node->value = value;
}

size_t charmap_Convert(char const *input, uint8_t *output)
{
	uint8_t *start = output;

	while (charmap_ConvertNext(&input, &output))
		;

	return output - start;
}

size_t charmap_ConvertNext(char const **input, uint8_t **output)
{
	// The goal is to match the longest mapping possible.
	// For that, advance through the trie with each character read.
	// If that would lead to a dead end, rewind characters until the last match, and output.
	// If no match, read a UTF-8 codepoint and output that.
	struct Charmap const *charmap = *currentCharmap;
	struct Charnode const *node = &charmap->nodes[0];
	struct Charnode const *match = NULL;
	size_t rewindDistance = 0;

	for (;;) {
		uint8_t c = **input - 1;

		if (**input && node->next[c]) {
			// Consume that char
			(*input)++;
			rewindDistance++;

			// Advance to next node (index starts at 1)
			node = &charmap->nodes[node->next[c]];
			if (node->isTerminal) {
				// This node matches, register it
				match = node;
				rewindDistance = 0; // If no longer match is found, rewind here
			}

		} else {
			// We are at a dead end (either because we reached the end of input, or of
			// the trie), so rewind up to the last match, and output.
			*input -= rewindDistance; // This will rewind all the way if no match found

			if (match) { // A match was found, use it
				if (output)
					*(*output)++ = match->value;

				return 1;

			} else if (**input) { // No match found, but there is some input left
				int firstChar = **input;
				// This will write the codepoint's value to `output`, little-endian
				size_t codepointLen = readUTF8Char(output ? *output : NULL,
								   *input);

				if (codepointLen == 0)
					error("Input string is not valid UTF-8!\n");

				// OK because UTF-8 has no NUL in multi-byte chars
				*input += codepointLen;
				if (output)
					*output += codepointLen;

				// Warn if this character is not mapped but any others are
				if (charmap->usedNodes > 1)
					warning(WARNING_UNMAPPED_CHAR_1,
						"Unmapped character %s\n", printChar(firstChar));
				else if (strcmp(charmap->name, DEFAULT_CHARMAP_NAME))
					warning(WARNING_UNMAPPED_CHAR_2,
						"Unmapped character %s not in " DEFAULT_CHARMAP_NAME
						" charmap\n", printChar(firstChar));

				return codepointLen;

			} else { // End of input
				return 0;
			}
		}
	}
}
