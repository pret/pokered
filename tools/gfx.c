#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <getopt.h>
#include <string.h>
#include <stdint.h>

#include "common.h"

static void usage(void) {
	fprintf(stderr, "Usage: gfx [--trim-whitespace] [--remove-whitespace] [--interleave] [--remove-duplicates [--keep-whitespace]] [--remove-xflip] [--remove-yflip] [--png filename] [-d depth] [-h] [-o outfile] infile\n");
}

static void error(char *message) {
	fputs(message, stderr);
	fputs("\n", stderr);
}

struct Options {
	int trim_whitespace;
	int remove_whitespace;
	int help;
	char *outfile;
	int depth;
	int interleave;
	int remove_duplicates;
	int keep_whitespace;
	int remove_xflip;
	int remove_yflip;
	char *png_file;
};

struct Options Options = {
	.depth = 2,
};

void get_args(int argc, char *argv[]) {
	struct option long_options[] = {
		{"remove-whitespace", no_argument, &Options.remove_whitespace, 1},
		{"trim-whitespace", no_argument, &Options.trim_whitespace, 1},
		{"interleave", no_argument, &Options.interleave, 1},
		{"remove-duplicates", no_argument, &Options.remove_duplicates, 1},
		{"keep-whitespace", no_argument, &Options.keep_whitespace, 1},
		{"remove-xflip", no_argument, &Options.remove_xflip, 1},
		{"remove-yflip", no_argument, &Options.remove_yflip, 1},
		{"png", required_argument, 0, 'p'},
		{"depth", required_argument, 0, 'd'},
		{"help", no_argument, 0, 'h'},
		{0}
	};
	for (int opt = 0; opt != -1;) {
		switch (opt = getopt_long(argc, argv, "ho:d:p:", long_options)) {
		case 'h':
			Options.help = true;
			break;
		case 'o':
			Options.outfile = optarg;
			break;
		case 'd':
			Options.depth = strtoul(optarg, NULL, 0);
			break;
		case 'p':
			Options.png_file = optarg;
			break;
		case 0:
		case -1:
			break;
		default:
			usage();
			exit(1);
			break;
		}
	}
}

struct Graphic {
	int size;
	uint8_t *data;
};

bool is_whitespace(uint8_t *tile, int tile_size) {
	uint8_t WHITESPACE = 0;
	for (int i = 0; i < tile_size; i++) {
		if (tile[i] != WHITESPACE) {
			return false;
		}
	}
	return true;
}

void trim_whitespace(struct Graphic *graphic) {
	int tile_size = Options.depth * 8;
	for (int i = graphic->size - tile_size; i > 0; i -= tile_size) {
		if (is_whitespace(&graphic->data[i], tile_size)) {
			graphic->size = i;
		} else {
			break;
		}
	}
}

void remove_whitespace(struct Graphic *graphic) {
	int tile_size = Options.depth * 8;
	if (Options.interleave) tile_size *= 2;
	int i = 0;
	for (int j = 0; i < graphic->size && j < graphic->size; i += tile_size, j += tile_size) {
		while (is_whitespace(&graphic->data[j], tile_size)) {
			j += tile_size;
		}
		if (j >= graphic->size) {
			break;
		}
		if (j > i) {
			memcpy(&graphic->data[i], &graphic->data[j], tile_size);
		}
	}
	graphic->size = i;
}

bool tile_exists(uint8_t *tile, uint8_t *tiles, int tile_size, int num_tiles) {
	for (int i = 0; i < num_tiles; i++) {
		bool match = true;
		for (int j = 0; j < tile_size; j++) {
			if (tile[j] != tiles[i * tile_size + j]) {
				match = false;
			}
		}
		if (match) {
			return true;
		}
	}
	return false;
}

void remove_duplicates(struct Graphic *graphic) {
	int tile_size = Options.depth * 8;
	if (Options.interleave) tile_size *= 2;
	int num_tiles = 0;
	for (int i = 0, j = 0; i < graphic->size && j < graphic->size; i += tile_size, j += tile_size) {
		while (tile_exists(&graphic->data[j], graphic->data, tile_size, num_tiles)) {
			if (Options.keep_whitespace && is_whitespace(&graphic->data[j], tile_size)) {
				break;
			}
			j += tile_size;
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

bool flip_exists(uint8_t *tile, uint8_t *tiles, int tile_size, int num_tiles, bool xflip, bool yflip) {
	uint8_t *flip = calloc(tile_size, 1);
	int half_size = tile_size / 2;
	for (int i = 0; i < tile_size; i++) {
		int byte = i;
		if (yflip) {
			byte = tile_size - 1 - (i ^ 1);
			if (Options.interleave && i < half_size) {
				byte = half_size - 1 - (i ^ 1);
			}
		}
		if (xflip) {
			for (int bit = 0; bit < 8; bit++) {
				flip[byte] |= ((tile[i] >> bit) & 1) << (7 - bit);
			}
		} else {
			flip[byte] = tile[i];
		}
	}
	if (tile_exists(flip, tiles, tile_size, num_tiles)) {
		return true;
	}
	return false;
}

void remove_flip(struct Graphic *graphic, bool xflip, bool yflip) {
	int tile_size = Options.depth * 8;
	if (Options.interleave) tile_size *= 2;
	int num_tiles = 0;
	for (int i = 0, j = 0; i < graphic->size && j < graphic->size; i += tile_size, j += tile_size) {
		while (flip_exists(&graphic->data[j], graphic->data, tile_size, num_tiles, xflip, yflip)) {
			if (Options.keep_whitespace && is_whitespace(&graphic->data[j], tile_size)) {
				break;
			}
			j += tile_size;
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
	int tile_size = Options.depth * 8;
	int width_tiles = width / 8;
	int num_tiles = graphic->size / tile_size;
	uint8_t *interleaved = malloc(graphic->size);
	for (int i = 0; i < num_tiles; i++) {
		int tile = i * 2;
		int row = i / width_tiles;
		tile -= width_tiles * row;
		if (row % 2) {
			tile -= width_tiles;
			tile += 1;
		}
		memcpy(&interleaved[tile * tile_size], &graphic->data[i * tile_size], tile_size);
	}
	graphic->size = num_tiles * tile_size;
	memcpy(graphic->data, interleaved, graphic->size);
	free(interleaved);
}

int png_get_width(char *filename) {
	FILE *f = fopen_verbose(filename, "rb");
	if (!f) {
		exit(1);
	}

	const int OFFSET_WIDTH = 16;
	uint8_t bytes[4];
	fseek(f, OFFSET_WIDTH, SEEK_SET);
	size_t size = 4;
	size_t result = fread(bytes, 1, size, f);
	fclose(f);
	if (result != size) {
		fprintf(stderr, "Could not read file at offset 0x%x: \"%s\"\n", OFFSET_WIDTH, filename);
		exit(1);
	}

	int width = 0;
	for (int i = 0; i < 4; i++) {
		width |= bytes[i] << (8 * (3 - i));
	}
	return width;
}


int main(int argc, char *argv[]) {
	get_args(argc, argv);
	argc -= optind;
	argv += optind;
	if (Options.help) {
		usage();
		return 0;
	}
	if (argc < 1) {
		usage();
		exit(1);
	}
	char *infile = argv[0];
	struct Graphic graphic;
	graphic.data = read_u8(infile, &graphic.size);
	if (Options.trim_whitespace) {
		trim_whitespace(&graphic);
	}
	if (Options.interleave) {
		if (!Options.png_file) {
			error("interleave: need --png to infer dimensions");
			usage();
			exit(1);
		}
		int width = png_get_width(Options.png_file);
		interleave(&graphic, width);
	}
	if (Options.remove_duplicates) {
		remove_duplicates(&graphic);
	}
	if (Options.remove_xflip) {
		remove_flip(&graphic, true, false);
	}
	if (Options.remove_yflip) {
		remove_flip(&graphic, false, true);
	}
	if (Options.remove_xflip && Options.remove_yflip) {
		remove_flip(&graphic, true, true);
	}
	if (Options.remove_whitespace) {
		remove_whitespace(&graphic);
	}
	if (Options.outfile) {
		write_u8(Options.outfile, graphic.data, graphic.size);
	}
	free(graphic.data);
	return 0;
}
