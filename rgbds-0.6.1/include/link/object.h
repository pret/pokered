/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 1997-2019, Carsten Sorensen and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

// Declarations related to processing of object (.o) files

#ifndef RGBDS_LINK_OBJECT_H
#define RGBDS_LINK_OBJECT_H

/*
 * Read an object (.o) file, and add its info to the data structures.
 * @param fileName A path to the object file to be read
 * @param i The ID of the file
 */
void obj_ReadFile(char const *fileName, unsigned int i);

/*
 * Perform validation on the object files' contents
 */
void obj_DoSanityChecks(void);

/*
 * Evaluate all assertions
 */
void obj_CheckAssertions(void);

/*
 * Sets up object file reading
 * @param nbFiles The number of object files that will be read
 */
void obj_Setup(unsigned int nbFiles);

/*
 * `free`s all object memory that was allocated.
 */
void obj_Cleanup(void);

#endif // RGBDS_LINK_OBJECT_H
