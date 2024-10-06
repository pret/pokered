#define PROGRAM_NAME "pkmncompress"
#define USAGE_OPTS "[-h|--help] [-u|--uncompress] infile.2bpp outfile.pic"

#include "common.h"

void parse_args(int argc, char *argv[], bool *uncomp) {
	struct option long_options[] = {
		{"uncompress", no_argument, 0, 'u'},
		{"help", no_argument, 0, 'h'},
		{0}
	};
	for (int opt; (opt = getopt_long(argc, argv, "uh", long_options)) != -1;) {
		switch (opt) {
		case 'u':
			*uncomp = true;
			break;
		case 'h':
			usage_exit(0);
			break;
		default:
			usage_exit(1);
		}
	}
}

uint8_t output[15 * 15 * 0x10];
int cur_bit;
int cur_byte;

void write_bit(int bit) {
	if (++cur_bit == 8) {
		cur_byte++;
		cur_bit = 0;
	}
	output[cur_byte] |= bit << (7 - cur_bit);
}

int read_bit(uint8_t *data) {
	if (cur_bit == -1) {
		cur_byte++;
		cur_bit = 7;
	}
	return (data[cur_byte] >> cur_bit--) & 1;
}

void transpose_tiles(uint8_t *data, int width) {
	int size = width * width;
	for (int i = 0; i < size; i++) {
		int j = (i * width + i / width) % size;
		if (i < j) {
			uint8_t tmp[0x10];
			uint8_t *p = data + i * COUNTOF(tmp);
			uint8_t *q = data + j * COUNTOF(tmp);
			memcpy(tmp, p, COUNTOF(tmp));
			memcpy(p, q, COUNTOF(tmp));
			memcpy(q, tmp, COUNTOF(tmp));
		}
	}
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

int interpret_compress(uint8_t *planes[2], int mode, int order, int width) {
	int ram_size = width * width * 8;
	uint8_t *rams[2] = {xmalloc(ram_size), xmalloc(ram_size)};
	memcpy(rams[0], planes[order], ram_size);
	memcpy(rams[1], planes[order ^ 1], ram_size);
	if (mode != 0) {
		for (int i = 0; i < ram_size; i++) {
			rams[1][i] ^= rams[0][i];
		}
	}
	compress_plane(rams[0], width);
	if (mode != 1) {
		compress_plane(rams[1], width);
	}
	cur_bit = 7;
	cur_byte = 0;
	memset(output, 0, COUNTOF(output));
	output[0] = (width << 4) | width;
	write_bit(order);
	uint8_t bit_groups[15 * 4 * 15 * 8] = {0};
	int index = 0;
	for (int plane = 0; plane < 2; plane++) {
		int type = 0;
		int nums = 0;
		memset(bit_groups, 0, COUNTOF(bit_groups));
		for (int x = 0; x < width; x++) {
			for (int bit = 0; bit < 8; bit += 2) {
				for (int y = 0, byte = x * width * 8; y < width * 8; y++, byte++) {
					int bit_group = (rams[plane][byte] >> (6 - bit)) & 3;
					if (bit_group) {
						if (type == 0) {
							write_bit(1);
						} else if (type == 1) {
							rle_encode_number(nums);
						}
						type = 2;
						bit_groups[index++] = bit_group;
						nums = 0;
					} else {
						if (type == 0) {
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
			if (mode == 0) {
				write_bit(0);
			} else {
				write_bit(1);
				write_bit(mode - 1);
			}
		}
	}
	free(rams[0]);
	free(rams[1]);
	return (cur_byte + 1) * 8 + cur_bit;
}

int get_width(long filesize) {
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
	return width;
}

int compress(uint8_t *data, long filesize) {
	int width = get_width(filesize);
	int ram_size = width * width * 8;
	uint8_t *planes[2] = {xmalloc(ram_size), xmalloc(ram_size)};
	transpose_tiles(data, width);
	for (int i = 0; i < ram_size; i++) {
		planes[0][i] = data[i * 2];
		planes[1][i] = data[i * 2 + 1];
	}
	uint8_t current[COUNTOF(output)] = {0};
	int compressed_size = -1;
	for (int mode = 0; mode < 3; mode++) {
		for (int order = 0; order < 2; order++) {
			if (mode == 0 && order == 0) {
				continue;
			}
			int new_size = interpret_compress(planes, mode, order, width);
			if (compressed_size == -1 || new_size < compressed_size) {
				compressed_size = new_size;
				memset(current, 0, COUNTOF(current));
				memcpy(current, output, compressed_size / 8);
			}
		}
	}
	memset(output, 0, COUNTOF(output));
	memcpy(output, current, compressed_size / 8);
	free(planes[0]);
	free(planes[1]);
	return compressed_size / 8;
}

int read_int(uint8_t *data, int count) {
	int n = 0;
	while (count--) {
		n = (n << 1) | read_bit(data);
	}
	return n;
}

uint8_t *fill_plane(uint8_t *data, int width) {
	static int table[0x10] = {
		0x0001, 0x0003, 0x0007, 0x000F, 0x001F, 0x003F, 0x007F, 0x00FF,
		0x01FF, 0x03FF, 0x07FF, 0x0FFF, 0x1FFF, 0x3FFF, 0x7FFF, 0xFFFF,
	};
	int mode = read_bit(data);
	int size = width * width * 0x20;
	uint8_t *plane = xmalloc(size);
	int len = 0;
	while (len < size) {
		if (mode) {
			while (len < size) {
				int bit_group = read_int(data, 2);
				if (!bit_group) {
					break;
				}
				plane[len++] = bit_group;
			}
		} else {
			size_t w = 0;
			while (read_bit(data)) {
				w++;
			}
			if (w >= COUNTOF(table)) {
				error_exit("Invalid compressed data");
			}
			int n = table[w] + read_int(data, w + 1);
			while (len < size && n--) {
				plane[len++] = 0;
			}
		}
		mode ^= 1;
	}
	if (len > size) {
		error_exit("Invalid compressed data");
	}
	uint8_t *ram = xmalloc(size);
	len = 0;
	for (int y = 0; y < width; y++) {
		for (int x = 0; x < width * 8; x++) {
			for (int i = 0; i < 4; i++) {
				ram[len++] = plane[(y * 4 + i) * width * 8 + x];
			}
		}
	}
	for (int i = 0; i < size - 3; i += 4) {
		ram[i / 4] = (ram[i] << 6) | (ram[i + 1] << 4) | (ram[i + 2] << 2) | ram[i + 3];
	}
	free(plane);
	return ram;
}

void uncompress_plane(uint8_t *plane, int width) {
	static int codes[2][0x10] = {
		{0x0, 0x1, 0x3, 0x2, 0x7, 0x6, 0x4, 0x5, 0xF, 0xE, 0xC, 0xD, 0x8, 0x9, 0xB, 0xA},
		{0xF, 0xE, 0xC, 0xD, 0x8, 0x9, 0xB, 0xA, 0x0, 0x1, 0x3, 0x2, 0x7, 0x6, 0x4, 0x5},
	};
	for (int x = 0; x < width * 8; x++) {
		int bit = 0;
		for (int y = 0; y < width; y++) {
			int i = y * width * 8 + x;
			int nybble_hi = (plane[i] >> 4) & 0xF;
			int code_hi = codes[bit][nybble_hi];
			bit = code_hi & 1;
			int nybble_lo = plane[i] & 0xF;
			int code_lo = codes[bit][nybble_lo];
			bit = code_lo & 1;
			plane[i] = (code_hi << 4) | code_lo;
		}
	}
}

int uncompress(uint8_t *data) {
	cur_bit = 7;
	int width = read_int(data, 4);
	if (read_int(data, 4) != width) {
		error_exit("Image is not a square");
	}
	int size = width * width * 8;
	uint8_t *rams[2];
	int order = read_bit(data);
	rams[order] = fill_plane(data, width);
	int mode = read_bit(data);
	if (mode) {
		mode += read_bit(data);
	}
	rams[order ^ 1] = fill_plane(data, width);
	uncompress_plane(rams[order], width);
	if (mode != 1) {
		uncompress_plane(rams[order ^ 1], width);
	}
	if (mode != 0) {
		for (int i = 0; i < size; i++) {
			rams[order ^ 1][i] ^= rams[order][i];
		}
	}
	for (int i = 0; i < size; i++) {
		output[i * 2] = rams[0][i];
		output[i * 2 + 1] = rams[1][i];
	}
	transpose_tiles(output, width);
	free(rams[0]);
	free(rams[1]);
	return size * 2;
}

int main(int argc, char *argv[]) {
	bool uncomp = false;
	parse_args(argc, argv, &uncomp);

	argc -= optind;
	argv += optind;
	if (argc < 1) {
		usage_exit(1);
	}

	long filesize;
	uint8_t *data = read_u8(argv[0], &filesize);

	int output_size = uncomp ? uncompress(data) : compress(data, filesize);
	write_u8(argv[1], output, output_size);

	free(data);
	return 0;
}
