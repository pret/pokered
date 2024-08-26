/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2019, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

// Assigning all sections a place
#ifndef RGBDS_LINK_ASSIGN_H
#define RGBDS_LINK_ASSIGN_H

#include <stdint.h>

extern uint64_t nbSectionsToAssign;

// Assigns all sections a slice of the address space
void assign_AssignSections(void);

// `free`s all assignment memory that was allocated
void assign_Cleanup(void);

#endif // RGBDS_LINK_ASSIGN_H
