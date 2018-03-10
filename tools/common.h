#ifndef GUARD_COMMON_H
#define GUARD_COMMON_H

int __getopt_long_i__;
#define getopt_long(c, v, s, l) getopt_long(c, v, s, l, &__getopt_long_i__)

FILE *fopen_verbose(char *filename, char *mode) {
	FILE *f = fopen(filename, mode);
	if (!f) {
		fprintf(stderr, "Could not open file: \"%s\"\n", filename);
	}
	return f;
}

uint8_t *read_u8(char *filename, int *size) {
	FILE *f = fopen_verbose(filename, "rb");
	if (!f) {
		exit(1);
	}
	fseek(f, 0, SEEK_END);
	*size = ftell(f);
	rewind(f);
	uint8_t *data = malloc(*size);
	if (*size != (int)fread(data, 1, *size, f)) {
		fprintf(stderr, "Could not read file: \"%s\"\n", filename);
		exit(1);
	}
	fclose(f);
	return data;
}

void write_u8(char *filename, uint8_t *data, int size) {
	FILE *f = fopen_verbose(filename, "wb");
	if (f) {
		fwrite(data, 1, size, f);
		fclose(f);
	}
}

#endif // GUARD_COMMON_H
