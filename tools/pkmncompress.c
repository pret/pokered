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

#define PROGRAM_NAME "pkmncompress"
#define USAGE_OPTS "infile.2bpp outfile.pic"

#include "common.h"

uint8_t compressed[15 * 15 * 0x10];
int cur_bit;
int cur_byte;

void write_bit(int bit) {
	if (++cur_bit == 8) {
		cur_byte++;
		cur_bit = 0;
	}
	compressed[cur_byte] |= bit << (7 - cur_bit);
}

void compress_plane(uint8_t *plane, int width) {
	static int gray_codes[2][0x10] = {
		{0x0, 0x1, 0x3, 0x2, 0x6, 0x7, 0x5, 0x4, 0xC, 0xD, 0xF, 0xE, 0xA, 0xB, 0x9, 0x8},
		{0x8, 0x9, 0xB, 0xA, 0xE, 0xF, 0xD, 0xC, 0x4, 0x5, 0x7, 0x6, 0x2, 0x3, 0x1, 0x0},
	};
	int ram_size = width * width * 8;
	for (int i = 0, nybble_lo = 0; i < ram_size; i++) {
		int m = i % width;
		if (!m) {
			nybble_lo = 0;
		}
		int j = i / width + m * width * 8;
		int nybble_hi = (plane[j] >> 4) & 0xF;
		int code_hi = gray_codes[nybble_lo & 1][nybble_hi];
		nybble_lo = plane[j] & 0xF;
		int code_lo = gray_codes[nybble_hi & 1][nybble_lo];
		plane[j] = (code_hi << 4) | code_lo;
	}
}

void rle_encode_number(int n) {
	int bit_count = -1;
	int v = ++n;
	v++;
	v |= v >> 1;
	v |= v >> 2;
	v |= v >> 4;
	v |= v >> 8;
	v |= v >> 16;
	v -= v >> 1;
	v--;
	int number = n - v;
	while (v) {
		v >>= 1;
		bit_count++;
	}
	for (int j = 0; j < bit_count; j++) {
		write_bit(1);
	}
	write_bit(0);
	for (int j = bit_count; j >= 0; j--) {
		write_bit((number >> j) & 1);
	}
}

void write_data_packet(uint8_t *bit_groups, int n) {
	for (int i = 0; i < n; i++) {
		write_bit((bit_groups[i] >> 1) & 1);
		write_bit(bit_groups[i] & 1);
	}
}

int interpret_compress(uint8_t *plane1, uint8_t *plane2, int mode, int order, int width) {
	int ram_size = width * width * 8;
	uint8_t *_plane1 = xmalloc(ram_size);
	uint8_t *_plane2 = xmalloc(ram_size);
	if (order) {
		memcpy(_plane1, plane2, ram_size);
		memcpy(_plane2, plane1, ram_size);
	} else {
		memcpy(_plane1, plane1, ram_size);
		memcpy(_plane2, plane2, ram_size);
	}
	if (mode != 1) {
		for (int i = 0; i < ram_size; i++) {
			_plane2[i] ^= _plane1[i];
		}
	}
	compress_plane(_plane1, width);
	if (mode != 2) {
		compress_plane(_plane2, width);
	}
	cur_bit = 7;
	cur_byte = 0;
	memset(compressed, 0, COUNTOF(compressed));
	compressed[0] = (width << 4) | width;
	write_bit(order);
	uint8_t bit_groups[0x1000] = {0};
	int index = 0;
	for (int plane = 0; plane < 2; plane++) {
		int type = 0;
		int nums = 0;
		memset(bit_groups, 0, COUNTOF(bit_groups));
		for (int x = 0; x < width; x++) {
			for (int bit = 0; bit < 8; bit += 2) {
				for (int y = 0, byte = x * width * 8; y < width * 8; y++, byte++) {
					int bit_group = ((plane ? _plane2 : _plane1)[byte] >> (6 - bit)) & 3;
					if (!bit_group) {
						if (!type) {
							write_bit(0);
						} else if (type == 1) {
							nums++;
						} else {
							write_data_packet(bit_groups, index);
							write_bit(0);
							write_bit(0);
						}
						type = 1;
						memset(bit_groups, 0, COUNTOF(bit_groups));
						index = 0;
					} else {
						if (!type) {
							write_bit(1);
						} else if (type == 1) {
							rle_encode_number(nums);
						}
						type = 2;
						bit_groups[index++] = bit_group;
						nums = 0;
					}
				}
			}
		}
		if (type == 1) {
			rle_encode_number(nums);
		} else {
			write_data_packet(bit_groups, index);
		}
		if (!plane) {
			if (mode < 2) {
				write_bit(0);
			} else {
				write_bit(1);
				write_bit(mode - 2);
			}
		}
	}
	free(_plane1);
	free(_plane2);
	return (cur_byte + 1) * 8 + cur_bit;
}

int compress(uint8_t *data, int width) {
	int ram_size = width * width * 8;
	uint8_t *plane1 = xmalloc(ram_size);
	uint8_t *plane2 = xmalloc(ram_size);
	for (int i = 0; i < ram_size; i++) {
		plane1[i] = data[i * 2];
		plane2[i] = data[i * 2 + 1];
	}
	uint8_t current[COUNTOF(compressed)] = {0};
	int compressed_size = -1;
	for (int mode = 1; mode < 4; mode++) {
		for (int order = 0; order < 2; order++) {
			if (mode == 1 && order == 0) {
				continue;
			}
			int new_size = interpret_compress(plane1, plane2, mode, order, width);
			if (compressed_size == -1 || new_size < compressed_size) {
				compressed_size = new_size;
				memset(current, 0, COUNTOF(current));
				memcpy(current, compressed, compressed_size / 8);
			}
		}
	}
	memset(compressed, 0, COUNTOF(compressed));
	memcpy(compressed, current, compressed_size / 8);
	free(plane1);
	free(plane2);
	return compressed_size / 8;
}

uint8_t *transpose_tiles(uint8_t *data, int width) {
	int size = width * width * 0x10;
	uint8_t *transposed = xmalloc(size);
	for (int i = 0; i < size; i++) {
		int j = (i / 0x10) * width * 0x10;
		j = (j % size) + 0x10 * (j / size) + (i % 0x10);
		transposed[j] = data[i];
	}
	free(data);
	return transposed;
}

int main(int argc, char *argv[]) {
	if (argc != 3) {
		usage_exit(1);
	}

	long filesize;
	uint8_t *data = read_u8(argv[1], &filesize);

	int width = 0;
	for (int w = 1; w < 16; w++) {
		if (filesize == w * w * 0x10) {
			width = w;
			break;
		}
	}
	if (!width) {
		error_exit("Image is not a square, or is larger than 15x15 tiles");
	}

	data = transpose_tiles(data, width);
	int compressed_size = compress(data, width);
	write_u8(argv[2], compressed, compressed_size);

	free(data);
	return 0;
}
