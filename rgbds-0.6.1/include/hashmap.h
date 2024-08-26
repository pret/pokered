/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2019, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

// Generic hashmap implementation (C++ templates are calling...)
#ifndef RGBDS_LINK_HASHMAP_H
#define RGBDS_LINK_HASHMAP_H

#include <assert.h>
#include <stdbool.h>

#define HASH_NB_BITS 32
#define HALF_HASH_NB_BITS 16
static_assert(HALF_HASH_NB_BITS * 2 == HASH_NB_BITS, "");
#define HASHMAP_NB_BUCKETS (1 << HALF_HASH_NB_BITS)

// HashMapEntry is internal, please do not attempt to use it
typedef struct HashMapEntry *HashMap[HASHMAP_NB_BUCKETS];

/*
 * Adds an element to a hashmap.
 * @warning Adding a new element with an already-present key will not cause an
 *          error, this must be handled externally.
 * @warning Inserting a NULL will make `hash_GetElement`'s return ambiguous!
 * @param map The HashMap to add the element to
 * @param key The key with which the element will be stored and retrieved
 * @param element The element to add
 * @return A pointer to the pointer to the element.
 */
void **hash_AddElement(HashMap map, char const *key, void *element);

/*
 * Removes an element from a hashmap.
 * @param map The HashMap to remove the element from
 * @param key The key to search the element with
 * @return True if the element was found and removed
 */
bool hash_RemoveElement(HashMap map, char const *key);

/*
 * Finds an element in a hashmap, and returns a pointer to its value field.
 * @param map The map to consider the elements of
 * @param key The key to search an element for
 * @return A pointer to the pointer to the element, or NULL if not found.
 */
void **hash_GetNode(HashMap const map, char const *key);

/*
 * Finds an element in a hashmap.
 * @param map The map to consider the elements of
 * @param key The key to search an element for
 * @return A pointer to the element, or NULL if not found. (NULL can be returned
 *         if such an element was added, but that sounds pretty silly.)
 */
void *hash_GetElement(HashMap const map, char const *key);

/*
 * Executes a function on each element in a hashmap.
 * @param map The map to consider the elements of
 * @param func The function to run. The first argument will be the element,
 *                                  the second will be `arg`.
 * @param arg An argument to be passed to all function calls
 */
void hash_ForEach(HashMap const map, void (*func)(void *, void *), void *arg);

/*
 * Cleanly empties a hashmap from its contents.
 * This does not `free` the data structure itself!
 * @param map The map to empty
 */
void hash_EmptyMap(HashMap map);

#endif // RGBDS_LINK_HASHMAP_H
