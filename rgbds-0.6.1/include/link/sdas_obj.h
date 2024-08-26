/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2022, Eldred Habert and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

// Assigning all sections a place
#ifndef RGBDS_LINK_SDAS_OBJ_H
#define RGBDS_LINK_SDAS_OBJ_H

#include <stdio.h>

struct FileStackNode;

void sdobj_ReadFile(struct FileStackNode const *fileName, FILE *file);

#endif // RGBDS_LINK_SDAS_OBJ_H
