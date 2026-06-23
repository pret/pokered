#ifndef GUARD_COMMON_H
#define GUARD_COMMON_H

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdnoreturn.h>
#include <inttypes.h>
#include <string.h>
#include <errno.h>
#include <getopt.h>

#ifndef PROGRAM_NAME
#error Define PROGRAM_NAME before including common.h!
#endif
#ifndef USAGE_OPTS
#error Define USAGE_OPTS before including common.h!
#endif

#define COUNTOF(...) (sizeof(__VA_ARGS__) / sizeof(*(__VA_ARGS__)))

#define error_exit(...) exit((fprintf(stderr, PROGRAM_NAME ": " __VA_ARGS__), 1))

noreturn void usage_exit(int status) {
	fprintf(stderr, "Usage: " PROGRAM_NAME " " USAGE_OPTS "\n");
	exit(status);
}

int getopt_long_index;
#define getopt_long(argc, argv, optstring, longopts) getopt_long(argc, argv, optstring, longopts, &getopt_long_index)

void *xmalloc(size_t size) {
	errno = 0;
	void *m = malloc(size);
	if (!m) {
		error_exit("Could not allocate %zu bytes: %s\n", size, strerror(errno));
	}
	return m;
}

void *xcalloc(size_t size) {
	errno = 0;
	void *m = calloc(size, 1);
	if (!m) {
		error_exit("Could not allocate %zu bytes: %s\n", size, strerror(errno));
	}
	return m;
}

void *xrealloc(void *m, size_t size) {
	errno = 0;
	m = realloc(m, size);
	if (!m) {
		error_exit("Could not allocate %zu bytes: %s\n", size, strerror(errno));
	}
	return m;
}

FILE *xfopen(const char *filename, char rw) {
	if (!strcmp(filename, "-")) {
		return rw == 'r' ? stdin : stdout;
	}
	char mode[3] = {rw, 'b', '\0'};
	errno = 0;
	FILE *f = fopen(filename, mode);
	if (!f) {
		error_exit("Could not open file \"%s\": %s\n", filename, strerror(errno));
	}
	return f;
}

void xfclose(FILE *f) {
	if (f != stdin && f != stdout) {
		fclose(f);
	}
}

void xfread(uint8_t *data, size_t size, const char *filename, FILE *f) {
	errno = 0;
	if (fread(data, 1, size, f) != size) {
		xfclose(f);
		error_exit("Could not read from file \"%s\": %s\n", filename, strerror(errno));
	}
}

void xfwrite(const uint8_t *data, size_t size, const char *filename, FILE *f) {
	errno = 0;
	if (fwrite(data, 1, size, f) != size) {
		xfclose(f);
		error_exit("Could not write to file \"%s\": %s\n", filename, strerror(errno));
	}
}

long xfsize(const char *filename, FILE *f) {
	long size = -1;
	errno = 0;
	if (!fseek(f, 0, SEEK_END)) {
		size = ftell(f);
		if (size != -1) {
			rewind(f);
		}
	}
	if (size == -1) {
		error_exit("Could not measure file \"%s\": %s\n", filename, strerror(errno));
	}
	return size;
}

uint8_t *read_stdin(long *size) {
	uint8_t buffer[0x1000] = {0};
	*size = 0;
	uint8_t *data = malloc(0);
	for (;;) {
		size_t n = fread(buffer, 1, sizeof(buffer), stdin);
		if (n == 0) {
			if (ferror(stdin)) {
				error_exit("Could not read from stdin: %s\n", strerror(errno));
			}
			break;
		}
		data = xrealloc(data, *size + n);
		memcpy(data + *size, buffer, n);
		*size += n;
	}
	return data;
}

uint8_t *read_u8(const char *filename, long *size) {
	FILE *f = xfopen(filename, 'r');
	if (f == stdin) {
		return read_stdin(size);
	}
	*size = xfsize(filename, f);
	uint8_t *data = xmalloc(*size);
	xfread(data, *size, filename, f);
	xfclose(f);
	return data;
}

void write_u8(const char *filename, uint8_t *data, size_t size) {
	FILE *f = xfopen(filename, 'w');
	xfwrite(data, size, filename, f);
	xfclose(f);
}

uint32_t read_png_width(const char *filename) {
	FILE *f = xfopen(filename, 'r');
	uint8_t header[16] = {0};
	xfread(header, sizeof(header), filename, f);
	static uint8_t expected_header[16] = {
		0x89, 'P', 'N', 'G', '\r', '\n', 0x1A, '\n', // signature
		0,    0,   0,   13,                          // IHDR chunk length
		'I',  'H', 'D', 'R',                         // IHDR chunk type
	};
	if (memcmp(header, expected_header, sizeof(header))) {
		xfclose(f);
		error_exit("Not a valid PNG file: \"%s\"\n", filename);
	}
	uint8_t bytes[4] = {0};
	xfread(bytes, sizeof(bytes), filename, f);
	xfclose(f);
	return (bytes[0] << 24) | (bytes[1] << 16) | (bytes[2] << 8) | bytes[3];
}

#endif // GUARD_COMMON_H
