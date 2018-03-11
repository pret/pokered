/*
 * Copyright © 2013 stag019 <stag019@gmail.com>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>

typedef uint8_t u8;

u8 *compressed = NULL;
int xrows = 0;
int xwidth = 0;
int curbit = 0;
int curbyte = 0;

void writebit(int bit)
{
	if (++curbit == 8)
	{
		curbyte++;
		curbit = 0;
	}
	compressed[curbyte] |= bit << (7 - curbit);
}

void method_1(u8 *RAM)
{
	int i;
	int j;
	int nibble_1;
	int nibble_2 = 0;
	int code_1;
	int code_2;
	int table;
	static int method_1[2][0x10] = {
		{0x0, 0x1, 0x3, 0x2, 0x6, 0x7, 0x5, 0x4, 0xC, 0xD, 0xF, 0xE, 0xA, 0xB, 0x9, 0x8},
		{0x8, 0x9, 0xB, 0xA, 0xE, 0xF, 0xD, 0xC, 0x4, 0x5, 0x7, 0x6, 0x2, 0x3, 0x1, 0x0}
	};

	for (i = 0; i < xrows * xwidth * 8; i++)
	{
		j = i / xrows;
		j += i % xrows * xwidth * 8;
		if (!(i % xrows))
		{
			nibble_2 = 0;
		}
		nibble_1 = (RAM[j] >> 4) & 0x0F;
		table = 0;
		if (nibble_2 & 1)
		{
			table = 1;
		}
		code_1 = method_1[table][nibble_1];
		nibble_2 = RAM[j] & 0x0F;
		table = 0;
		if (nibble_1 & 1)
		{
			table = 1;
		}
		code_2 = method_1[table][nibble_2];
		RAM[j] = (code_1 << 4) | code_2;
	}
}

// "Get the previous power of 2. Deriving the bitcount from that seems to be faster on average than using the lookup table."
void RLE(int nums)
{
	int v;
	int j;
	int bitcount;
	int number;

	bitcount = -1;
	v = ++nums;
	v++;
	v |= v >> 1;
	v |= v >> 2;
	v |= v >> 4;
	v |= v >> 8;
	v |= v >> 16;
	v -= v >> 1;
	v--;

	number = nums - v;
	while(v) {
		v >>= 1;
		bitcount++;
	}
	for(j = 0; j < bitcount; j++) {
		writebit(1);
	}
	writebit(0);
	for(j = bitcount; j >= 0; j--) {
		writebit((number >> j) & 1);
	}
}

void RLE_old(int nums)
{
	int search;
	int i;
	int j;
	int bitcount;
	int number;
	static int RLE[0x10] = {0x0001, 0x0003, 0x0007, 0x000F, 0x001F, 0x003F, 0x007F, 0x00FF, 0x01FF, 0x03FF, 0x07FF, 0x0FFF, 0x1FFF, 0x3FFF, 0x7FFF, 0xFFFF};

	bitcount = -1;
	search = ++nums;
	while (search > 0)
	{
		for (i = 0; i < 0xF; i++)
		{
			if (RLE[i] == search)
			{
				bitcount = i;
				break;
			}
		}
		if (bitcount != -1)
		{
			break;
		}
		search--;
	}
	number = nums - RLE[bitcount];
	for (j = 0; j < bitcount; j++)
	{
		writebit(1);
	}
	writebit(0);
	for (j = bitcount; j >= 0; j--)
	{
		writebit((number >> j) & 1);
	}
}

void data_packet(u8 *bitgroups, int bgi)
{
	int i;
	for (i = 0; i < bgi; i++)
	{
		writebit((bitgroups[i] >> 1) & 1);
		writebit(bitgroups[i] & 1);
	}
}

int interpret_compress(u8 *RAM_1, u8 *RAM_2, int interpretation, int switchram)
{
	u8 *_1_RAM;
	u8 *_2_RAM;
	int i;
	int ram;
	int type;
	int nums;
	u8 *bitgroups;
	int x;
	int y;
	int byte;
	int bit;
	int bitgroup;
	int bgi = 0;

	int ram_size = xrows * xwidth * 8;
	_1_RAM = (u8 *)calloc(ram_size, 1);
	_2_RAM = (u8 *)calloc(ram_size, 1);
	if (switchram)
	{
		memcpy(_1_RAM, RAM_2, ram_size);
		memcpy(_2_RAM, RAM_1, ram_size);
	}
	else
	{
		memcpy(_1_RAM, RAM_1, ram_size);
		memcpy(_2_RAM, RAM_2, ram_size);
	}

	switch(interpretation)
	{
		case 1:
			method_1(_1_RAM);
			method_1(_2_RAM);
		break;
		case 2:
		case 3:
			for (i = 0; i < xrows * xwidth * 8; i++)
			{
				_2_RAM[i] ^= _1_RAM[i];
			}
			method_1(_1_RAM);
		break;
	}
	if (interpretation == 3)
	{
		method_1(_2_RAM);
	}

	curbit = 7;
	curbyte = 0;
	compressed = (u8 *)calloc(0x310, 1);
	compressed[0] = (xrows << 4) | xwidth;
	writebit(switchram);

	for (ram = 0; ram < 2; ram++)
	{
		type = 0;
		nums = 0;
		bitgroups = (u8 *)calloc(0x1000, 1);

		for (x = 0; x < xwidth; x++)
		{
			for (bit = 0; bit < 8; bit += 2)
			{
				byte = x * xrows * 8;
				for (y=0; y < xrows * 8; y++)
				{
					if (ram)
					{
						bitgroup = (_2_RAM[byte] >> (6 - bit)) & 3;
					}
					else
					{
						bitgroup = (_1_RAM[byte] >> (6 - bit)) & 3;
					}
					if (!bitgroup)
					{
						if (!type)
						{
							writebit(0);
						}
						else if (type == 1)
						{
							nums++;
						}
						else
						{
							data_packet(bitgroups, bgi);
							writebit(0);
							writebit(0);
						}
						type = 1;
						free(bitgroups);
						bitgroups = (u8 *)calloc(0x1000, 1);
						bgi = 0;
					}
					else
					{
						if (!type)
						{
							writebit(1);
						}
						else if (type == 1)
						{
							RLE(nums);
						}
						type = -1;
						bitgroups[bgi++] = bitgroup;
						nums = 0;
					}
					byte++;
				}
			}
		}
		if (type == 1)
		{
			RLE(nums);
		}
		else
		{
			data_packet(bitgroups, bgi);
		}
		if (!ram)
		{
			if (interpretation < 2)
			{
				writebit(0);
			}
			else
			{
				writebit(1);
				writebit(interpretation - 2);
			}
		}
	}
	free(bitgroups);
	free(_1_RAM);
	free(_2_RAM);
	return (curbyte + 1) * 8 + curbit;
}

int compress(u8 *data, int width, int height)
{
	u8 *RAM_1;
	u8 *RAM_2;
	int i;
	int mode;
	int order;
	int newsize;
	int compressedsize;
	int size = -1;
	u8 *current = NULL;
	int ram_size;

	xrows = height;
	xwidth = width;

	ram_size = xrows * xwidth * 8;

	RAM_1 = (u8 *)calloc(ram_size, 1);
	RAM_2 = (u8 *)calloc(ram_size, 1);

	for (i = 0; i < xrows * xwidth * 8; i++)
	{
		RAM_1[i] = data[(i << 1)];
		RAM_2[i] = data[(i << 1) | 1];
	}

	for (mode = 1; mode < 4; mode++)
	{
		for (order = 0; order < 2; order++)
		{
			if (!(mode == 1 && order == 0))
			{
				newsize = interpret_compress(RAM_1, RAM_2, mode, order);
				if (size == -1 || newsize < size)
				{
					if (current != NULL)
					{
						free(current);
					}
					current = (u8 *)calloc(0x310, 1);
					memcpy(current, compressed, newsize / 8);
					free(compressed);
					size = newsize;
				}
			}
		}
	}
	compressed = (u8 *)calloc(0x310, 1);
	compressedsize = size / 8;
	memcpy(compressed, current, compressedsize);
	free(current);

	free(RAM_1);
	free(RAM_2);

	return compressedsize;
}

uint8_t *transpose_tiles(uint8_t *data, int width, int height)
{
	int i;
	int j;
	int tile_size = 0x10;

	int size = width * height * tile_size;
	u8 *transposed = calloc(size, 1);
	for (i = 0; i < size; i++)
	{
		j = (i / 0x10) * width * 0x10;
		j = (j % size) + 0x10 * (j / size) + (i % 0x10);
		transposed[j] = data[i];
	}

	free(data);

	return transposed;
}

int main(int argc, char *argv[])
{
	int width = 0;
	int height = 0;
	int transpose = 1;

	if (argc != 3)
	{
		fputs("Usage: pkmncompress infile.2bpp outfile.pic\n", stderr);
		return EXIT_FAILURE;
	}

	char *infile = argv[1];
	char *outfile = argv[2];

	FILE *f = fopen(infile, "rb");
	if (!f) {
		fprintf(stderr, "failed to open for reading: '%s'\n", infile);
		return EXIT_FAILURE;
	}
	fseek(f, 0, SEEK_END);
	int filesize = ftell(f);

	for (int i = 0; i < 32; i++) {
		width = i;
		height = i;
		if (width * height * 16 >= filesize) {
			break;
		}
	}
	if (width * height * 16 < filesize) {
		fprintf(stderr, "file too big: '%s' (%x)\n", infile, filesize);
		return EXIT_FAILURE;
	}
	if (width * height * 16 > filesize) {
		fprintf(stderr, "wrong filesize for '%s' (%x). must be a square image of 16-byte tiles\n", infile, filesize);
		return EXIT_FAILURE;
	}

	u8 *data = (u8 *)calloc(filesize, 1);
	fseek(f, 0, SEEK_SET);
	int size = fread(data, 1, filesize, f);
	fclose(f);
	if (size != filesize) {
		fprintf(stderr, "failed to read: '%s'\n", infile);
		return EXIT_FAILURE;
	}

	if (transpose) {
		data = transpose_tiles(data, width, height);
	}

	int compressed_size = compress(data, width, height);

	free(data);

	f = fopen(outfile, "wb");
	if (!f) {
		fprintf(stderr, "failed to open for writing: '%s'\n", outfile);
		return EXIT_FAILURE;
	}
	fwrite(compressed, 1, compressed_size, f);
	fclose(f);

	free(compressed);

	return EXIT_SUCCESS;
}
