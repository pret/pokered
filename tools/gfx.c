#define PROGRAM_NAME "gfx"
#define USAGE_OPTS \
	"[-h|--help] [--trim-whitespace] [--remove-whitespace] [--interleave] " \
	"[--remove-duplicates [--keep-whitespace]] [--remove-xflip] [--remove-yflip] " \
	"[--preserve indexes] [-d|--depth depth] [-p|--png filename.png] [-o|--out outfile] infile"

#include "common.h"

struct Options {
	bool trim_whitespace;
	bool remove_whitespace;
	bool interleave;
	bool remove_duplicates;
	bool keep_whitespace;
	bool remove_xflip;
	bool remove_yflip;
	int *preserved;
	int num_preserved;
	int depth;
	char *png_file;
	char *outfile;
};

struct Options options = {.depth = 2};

void parse_args(int argc, char *argv[]) {
	struct option long_options[] = {
		{"remove-whitespace", no_argument, 0, 'R'},
		{"trim-whitespace", no_argument, 0, 'T'},
		{"interleave", no_argument, 0, 'I'},
		{"remove-duplicates", no_argument, 0, 'D'},
		{"keep-whitespace", no_argument, 0, 'W'},
		{"remove-xflip", no_argument, 0, 'X'},
		{"remove-yflip", no_argument, 0, 'Y'},
		{"preserve", required_argument, 0, 'r'},
		{"png", required_argument, 0, 'p'},
		{"depth", required_argument, 0, 'd'},
		{"out", required_argument, 0, 'o'},
		{"help", no_argument, 0, 'h'},
		{0},
	};
	for (int opt; (opt = getopt_long(argc, argv, "d:o:p:h", long_options)) != -1;) {
		switch (opt) {
		case 'R':
			options.remove_whitespace = true;
			break;
		case 'T':
			options.trim_whitespace = true;
			break;
		case 'I':
			options.interleave = true;
			break;
		case 'D':
			options.remove_duplicates = true;
			break;
		case 'W':
			options.keep_whitespace = true;
			break;
		case 'X':
			options.remove_xflip = true;
			break;
		case 'Y':
			options.remove_yflip = true;
			break;
		case 'r':
			for (char *token = strtok(optarg, ","); token; token = strtok(NULL, ",")) {
				options.preserved = xrealloc(options.preserved, ++options.num_preserved * sizeof(*options.preserved));
				options.preserved[options.num_preserved - 1] = strtoul(token, NULL, 0);
			}
			break;
		case 'd':
			options.depth = strtoul(optarg, NULL, 0);
			break;
		case 'p':
			options.png_file = optarg;
			break;
		case 'o':
			options.outfile = optarg;
			break;
		case 'h':
			usage_exit(0);
			break;
		default:
			usage_exit(1);
		}
	}
}

struct Graphic {
	uint8_t *data;
	long size;
};

bool is_preserved(int index) {
	for (int i = 0; i < options.num_preserved; i++) {
		if (options.preserved[i] == index) {
			return true;
		}
	}
	return false;
}

void shift_preserved(int removed_index) {
	for (int i = 0; i < options.num_preserved; i++) {
		if (options.preserved[i] >= removed_index) {
			options.preserved[i]--;
		}
	}
}

bool is_whitespace(const uint8_t *tile, int tile_size) {
	for (int i = 0; i < tile_size; i++) {
		if (tile[i] != 0) {
			return false;
		}
	}
	return true;
}

void trim_whitespace(struct Graphic *graphic) {
	int tile_size = options.depth * 8;
	for (int i = graphic->size - tile_size; i > 0; i -= tile_size) {
		if (is_whitespace(&graphic->data[i], tile_size) && !is_preserved(i / tile_size)) {
			graphic->size = i;
		} else {
			break;
		}
	}
}

int get_tile_size(void) {
	return options.depth * (options.interleave ? 16 : 8);
}

void remove_whitespace(struct Graphic *graphic) {
	int tile_size = get_tile_size();
	graphic->size &= ~(tile_size - 1);
	int i = 0;
	for (int j = 0, d = 0; i < graphic->size && j < graphic->size; i += tile_size, j += tile_size) {
		for (; j < graphic->size && is_whitespace(&graphic->data[j], tile_size) && !is_preserved(j / tile_size - d); j += tile_size, d++) {
			shift_preserved(j / tile_size - d);
		}
		if (j >= graphic->size) {
			break;
		} else if (j > i) {
			memcpy(&graphic->data[i], &graphic->data[j], tile_size);
		}
	}
	graphic->size = i;
}

bool tile_exists(const uint8_t *tile, const uint8_t *tiles, int tile_size, int num_tiles) {
	for (int i = 0; i < num_tiles; i++) {
		bool match = true;
		for (int j = 0; j < tile_size; j++) {
			if (tile[j] != tiles[i * tile_size + j]) {
				match = false;
				break;
			}
		}
		if (match) {
			return true;
		}
	}
	return false;
}

void remove_duplicates(struct Graphic *graphic) {
	int tile_size = get_tile_size();
	graphic->size &= ~(tile_size - 1);
	int num_tiles = 0;
	for (int i = 0, j = 0, d = 0; i < graphic->size && j < graphic->size; i += tile_size, j += tile_size) {
		for (; j < graphic->size && tile_exists(&graphic->data[j], graphic->data, tile_size, num_tiles); j += tile_size, d++) {
			if ((options.keep_whitespace && is_whitespace(&graphic->data[j], tile_size)) || is_preserved(j / tile_size - d)) {
				break;
			}
			shift_preserved(j / tile_size - d);
		}
		if (j >= graphic->size) {
			break;
		}
		if (j > i) {
			memcpy(&graphic->data[i], &graphic->data[j], tile_size);
		}
		num_tiles++;
	}
	graphic->size = num_tiles * tile_size;
}

// for (int i = 0; i < 256; i++)
//	for (int bit = 0; bit < 8; bit++) {
//		flipped[i] |= ((i >> bit) & 1) << (7 - bit);
const uint8_t flipped[256] = {
	// clang-format off
	0x00, 0x80, 0x40, 0xc0, 0x20, 0xa0, 0x60, 0xe0, 0x10, 0x90, 0x50, 0xd0, 0x30, 0xb0, 0x70, 0xf0,
	0x08, 0x88, 0x48, 0xc8, 0x28, 0xa8, 0x68, 0xe8, 0x18, 0x98, 0x58, 0xd8, 0x38, 0xb8, 0x78, 0xf8,
	0x04, 0x84, 0x44, 0xc4, 0x24, 0xa4, 0x64, 0xe4, 0x14, 0x94, 0x54, 0xd4, 0x34, 0xb4, 0x74, 0xf4,
	0x0c, 0x8c, 0x4c, 0xcc, 0x2c, 0xac, 0x6c, 0xec, 0x1c, 0x9c, 0x5c, 0xdc, 0x3c, 0xbc, 0x7c, 0xfc,
	0x02, 0x82, 0x42, 0xc2, 0x22, 0xa2, 0x62, 0xe2, 0x12, 0x92, 0x52, 0xd2, 0x32, 0xb2, 0x72, 0xf2,
	0x0a, 0x8a, 0x4a, 0xca, 0x2a, 0xaa, 0x6a, 0xea, 0x1a, 0x9a, 0x5a, 0xda, 0x3a, 0xba, 0x7a, 0xfa,
	0x06, 0x86, 0x46, 0xc6, 0x26, 0xa6, 0x66, 0xe6, 0x16, 0x96, 0x56, 0xd6, 0x36, 0xb6, 0x76, 0xf6,
	0x0e, 0x8e, 0x4e, 0xce, 0x2e, 0xae, 0x6e, 0xee, 0x1e, 0x9e, 0x5e, 0xde, 0x3e, 0xbe, 0x7e, 0xfe,
	0x01, 0x81, 0x41, 0xc1, 0x21, 0xa1, 0x61, 0xe1, 0x11, 0x91, 0x51, 0xd1, 0x31, 0xb1, 0x71, 0xf1,
	0x09, 0x89, 0x49, 0xc9, 0x29, 0xa9, 0x69, 0xe9, 0x19, 0x99, 0x59, 0xd9, 0x39, 0xb9, 0x79, 0xf9,
	0x05, 0x85, 0x45, 0xc5, 0x25, 0xa5, 0x65, 0xe5, 0x15, 0x95, 0x55, 0xd5, 0x35, 0xb5, 0x75, 0xf5,
	0x0d, 0x8d, 0x4d, 0xcd, 0x2d, 0xad, 0x6d, 0xed, 0x1d, 0x9d, 0x5d, 0xdd, 0x3d, 0xbd, 0x7d, 0xfd,
	0x03, 0x83, 0x43, 0xc3, 0x23, 0xa3, 0x63, 0xe3, 0x13, 0x93, 0x53, 0xd3, 0x33, 0xb3, 0x73, 0xf3,
	0x0b, 0x8b, 0x4b, 0xcb, 0x2b, 0xab, 0x6b, 0xeb, 0x1b, 0x9b, 0x5b, 0xdb, 0x3b, 0xbb, 0x7b, 0xfb,
	0x07, 0x87, 0x47, 0xc7, 0x27, 0xa7, 0x67, 0xe7, 0x17, 0x97, 0x57, 0xd7, 0x37, 0xb7, 0x77, 0xf7,
	0x0f, 0x8f, 0x4f, 0xcf, 0x2f, 0xaf, 0x6f, 0xef, 0x1f, 0x9f, 0x5f, 0xdf, 0x3f, 0xbf, 0x7f, 0xff,
	// clang-format on
};

bool flip_exists(const uint8_t *tile, const uint8_t *tiles, int tile_size, int num_tiles, bool xflip, bool yflip) {
	uint8_t flip[tile_size]; // VLA
	memset(flip, 0, tile_size);
	int half_size = tile_size / 2;
	for (int i = 0; i < tile_size; i++) {
		int j = yflip ? (options.interleave && i < half_size ? half_size : tile_size) - 1 - (i ^ 1) : i;
		flip[j] = xflip ? flipped[tile[i]] : tile[i];
	}
	return tile_exists(flip, tiles, tile_size, num_tiles);
}

void remove_flip(struct Graphic *graphic, bool xflip, bool yflip) {
	int tile_size = get_tile_size();
	graphic->size &= ~(tile_size - 1);
	int num_tiles = 0;
	for (int i = 0, j = 0, d = 0; i < graphic->size && j < graphic->size; i += tile_size, j += tile_size) {
		for (; j < graphic->size && flip_exists(&graphic->data[j], graphic->data, tile_size, num_tiles, xflip, yflip); j += tile_size, d++) {
			if ((options.keep_whitespace && is_whitespace(&graphic->data[j], tile_size)) || is_preserved(j / tile_size - d)) {
				break;
			}
			shift_preserved(j / tile_size - d);
		}
		if (j >= graphic->size) {
			break;
		}
		if (j > i) {
			memcpy(&graphic->data[i], &graphic->data[j], tile_size);
		}
		num_tiles++;
	}
	graphic->size = num_tiles * tile_size;
}

void interleave(struct Graphic *graphic, int width) {
	int tile_size = options.depth * 8;
	int width_tiles = width / 8;
	int num_tiles = graphic->size / tile_size;
	uint8_t *interleaved = xmalloc(graphic->size);
	for (int i = 0; i < num_tiles; i++) {
		int row = i / width_tiles;
		int tile = i * 2 - (row % 2 ? width_tiles * (row + 1) - 1 : width_tiles * row);
		memcpy(&interleaved[tile * tile_size], &graphic->data[i * tile_size], tile_size);
	}
	graphic->size = num_tiles * tile_size;
	memcpy(graphic->data, interleaved, graphic->size);
	free(interleaved);
}

int main(int argc, char *argv[]) {
	parse_args(argc, argv);

	argc -= optind;
	argv += optind;
	if (argc < 1) {
		usage_exit(1);
	}

	struct Graphic graphic;
	graphic.data = read_u8(argv[0], &graphic.size);

	if (options.trim_whitespace) {
		trim_whitespace(&graphic);
	}
	if (options.interleave) {
		if (!options.png_file) {
			error_exit("--interleave needs --png to infer dimensions");
		}
		int width = read_png_width(options.png_file);
		interleave(&graphic, width);
	}
	if (options.remove_duplicates) {
		remove_duplicates(&graphic);
	}
	if (options.remove_xflip) {
		remove_flip(&graphic, true, false);
	}
	if (options.remove_yflip) {
		remove_flip(&graphic, false, true);
	}
	if (options.remove_xflip && options.remove_yflip) {
		remove_flip(&graphic, true, true);
	}
	if (options.remove_whitespace) {
		remove_whitespace(&graphic);
	}
	if (options.outfile) {
		write_u8(options.outfile, graphic.data, graphic.size);
	}

	free(graphic.data);
	return 0;
}
