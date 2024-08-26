/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2018, Antonio Nino Diaz and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#ifndef EXTERN_UTF8DECODER_H
#define EXTERN_UTF8DECODER_H

uint32_t decode(uint32_t *state, uint32_t *codep, uint8_t byte);

#endif // EXTERN_UTF8DECODER_H
