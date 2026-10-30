#define PROGRAM_NAME "scan_includes"
#define USAGE_OPTS "[-h|--help] [-s|--strict] [-I|--include path] filename.asm"

#include "common.h"

#include <ctype.h>

struct Options {
	bool strict;
	char **include_paths;
	int include_paths_len;
};

struct Options options = {0};

void add_include_path(const char *path) {
	size_t arg_len = strlen(path);
	bool has_trailing_separator = path[arg_len - 1] == '/';
	char *include_path = xmalloc(arg_len + (has_trailing_separator ? 1 : 2));
	sprintf(include_path, "%s%s", path, has_trailing_separator ? "" : "/");
	options.include_paths = xrealloc(options.include_paths, sizeof(options.include_paths[0]) * ++options.include_paths_len);
	options.include_paths[options.include_paths_len - 1] = include_path;
}

void parse_args(int argc, char *argv[]) {
	struct option long_options[] = {
		{"strict", no_argument, 0, 's'},
		{"help", no_argument, 0, 'h'},
		{"include", required_argument, 0, 'I'},
		{0}
	};
	for (int opt; (opt = getopt_long(argc, argv, "shI:", long_options)) != -1;) {
		switch (opt) {
		case 's':
			options.strict = true;
			break;
		case 'h':
			usage_exit(0);
			break;
		case 'I':
			add_include_path(optarg);
			break;
		default:
			usage_exit(1);
		}
	}
}

char *check_include_paths_for_file(const char *filepath, bool is_incbin) {
	char *scratch_path = NULL;
	for (char **include_path = options.include_paths; include_path < options.include_paths + options.include_paths_len; include_path++) {
		size_t len = strlen(*include_path) + strlen(filepath) + 1;
		scratch_path = xmalloc(len);
		snprintf(scratch_path, len, "%s%s", *include_path, filepath);
		FILE *f = fopen(scratch_path, "r");

		// If the file exists, use this include path
		if (f) {
			fclose(f);
			break;
		}

		// If the INCBIN doesn't exist and there is exactly 1 include path, assume it will get created there
		if (is_incbin && options.include_paths_len == 1) {
			break;
		}

		free(scratch_path);
		scratch_path = NULL;
	}
	return scratch_path;
}

void scan_file(const char *filename, bool top_level) {
	long size = 0;
	char *contents = NULL;
	if (top_level && !strcmp(filename, "-")) {
		contents = (char *)read_stdin(&size);
		contents = xrealloc(contents, size + 1);
		contents[size] = '\0';
	} else {
		errno = 0;
		FILE *f = fopen(filename, "rb");
		if (!f) {
			if (options.strict) {
				error_exit("Could not open file \"%s\": %s\n", filename, strerror(errno));
			} else {
				return;
			}
		}

		size = xfsize(filename, f);
		contents = xmalloc(size + 1);
		xfread((uint8_t *)contents, size, filename, f);
		xfclose(f);
		contents[size] = '\0';
	}

	for (char *ptr = contents; ptr && ptr < contents + size; ptr++) {
		ptr = strpbrk(ptr, ";\"Ii");
		if (!ptr) {
			break;
		}
		switch (*ptr) {
		case ';':
			// Skip comments until the end of the line
			ptr += strcspn(ptr + 1, "\r\n");
			if (*ptr) {
				ptr++;
			}
			break;

		case '"':
			// Skip string literal until the closing quote
			ptr += strcspn(ptr + 1, "\"");
			if (*ptr) {
				ptr++;
			}
			break;

		case 'I':
		case 'i':
			/* empty statement between the label and the variable declaration */;
			// Check that an INCLUDE/INCBIN starts as its own token
			char before = ptr > contents ? *(ptr - 1) : '\n';
			if (!isspace((unsigned)before) && before != ':') {
				break;
			}
			bool is_incbin = !strncmp(ptr, "INCBIN", 6) || !strncmp(ptr, "incbin", 6);
			bool is_include = !strncmp(ptr, "INCLUDE", 7) || !strncmp(ptr, "include", 7);
			if (is_incbin || is_include) {
				// Check that an INCLUDE/INCBIN ends as its own token
				ptr += is_include ? 7 : 6;
				if (!isspace((unsigned)*ptr) && *ptr != '"') {
					break;
				}
				ptr += strspn(ptr, " \t");
				if (*ptr == '"') {
					ptr++;
					char *include_filepath = ptr;
					size_t length = strcspn(ptr, "\"");
					ptr += length + 1;
					include_filepath[length] = '\0';

					// Check if the file exists, and if not then check options.include_paths for the file
					FILE *f = fopen(include_filepath, "r");
					char *scratch_path = NULL;
					if (!f) {
						scratch_path = check_include_paths_for_file(include_filepath, is_incbin);
					} else {
						fclose(f);
					}

					if (scratch_path) {
						include_filepath = scratch_path;
					}

					// Print the file path and recursively scan INCLUDEs
					printf("%s ", include_filepath);
					if (is_include) {
						scan_file(include_filepath, false);
					}

					free(scratch_path);
				} else {
					fprintf(stderr, "%s: no file path after INC%s\n", filename, is_include ? "LUDE" : "BIN");
					// Continue to process a comment
					if (*ptr == ';') {
						ptr--;
					}
				}
			}
			break;
		}
	}

	free(contents);
}

int main(int argc, char *argv[]) {
	parse_args(argc, argv);

	argc -= optind;
	argv += optind;
	if (argc < 1) {
		usage_exit(1);
	}

	scan_file(argv[0], true);
	return 0;
}
