#define PROGRAM_NAME "make_patch"
#define USAGE_OPTS "values.sym patched.gbc original.gbc vc.patch.template vc.patch"

#include "common.h"

#include <ctype.h>

struct Buffer {
	size_t item_size;
	size_t size;
	size_t capacity;
	void *data;
};

struct Symbol {
	struct Symbol *next;
	unsigned int address;
	unsigned int offset;
	char name[]; // C99 FAM
};

struct Patch {
	unsigned int offset;
	unsigned int size;
};

struct Buffer *buffer_create(size_t item_size) {
	struct Buffer *buffer = xmalloc(sizeof(*buffer));
	buffer->item_size = item_size;
	buffer->size = 0;
	buffer->capacity = 0x10;
	buffer->data = xmalloc(buffer->capacity * item_size);
	return buffer;
}

void buffer_append(struct Buffer *buffer, const void *item) {
	if (buffer->size >= buffer->capacity) {
		buffer->capacity = (buffer->capacity + 1) * 2;
		buffer->data = xrealloc(buffer->data, buffer->capacity * buffer->item_size);
	}
	memcpy((char *)buffer->data + (buffer->size++ * buffer->item_size), item, buffer->item_size);
}

void buffer_free(struct Buffer *buffer) {
	free(buffer->data);
	free(buffer);
}

void symbol_append(struct Symbol **symbols, const char *name, int bank, int address) {
	size_t name_len = strlen(name) + 1;
	struct Symbol *symbol = xmalloc(sizeof(*symbol) + name_len);
	symbol->address = address;
	symbol->offset = address < 0x8000
		? (bank > 0 ? address + (bank - 1) * 0x4000 : address) // ROM addresses are relative to their bank
		: address - 0x8000; // RAM addresses are relative to the start of all RAM
	memcpy(symbol->name, name, name_len);
	symbol->next = *symbols;
	*symbols = symbol;
}

void symbol_free(struct Symbol *symbols) {
	for (struct Symbol *next; symbols; symbols = next) {
		next = symbols->next;
		free(symbols);
	}
}

const struct Symbol *symbol_find(const struct Symbol *symbols, const char *name) {
	size_t name_len = strlen(name);
	for (const struct Symbol *symbol = symbols; symbol; symbol = symbol->next) {
		size_t sym_name_len = strlen(symbol->name);
		if (name_len > sym_name_len) {
			continue;
		}
		const char *sym_name = symbol->name;
		if (name[0] == '.') {
			// If `name` is a local label, compare it to the local part of `symbol->name`
			sym_name += sym_name_len - name_len;
		}
		if (!strcmp(sym_name, name)) {
			return symbol;
		}
	}
	error_exit("Error: Unknown symbol: \"%s\"\n", name);
}

const struct Symbol *symbol_find_cat(const struct Symbol *symbols, const char *prefix, const char *suffix) {
	char *sym_name = xmalloc(strlen(prefix) + strlen(suffix) + 1);
	sprintf(sym_name, "%s%s", prefix, suffix);
	const struct Symbol *symbol = symbol_find(symbols, sym_name);
	free(sym_name);
	return symbol;
}

int parse_number(const char *input, int base) {
	char *endptr;
	int n = (int)strtol(input, &endptr, base);
	if (endptr == input || *endptr || n < 0) {
		error_exit("Error: Cannot parse number: \"%s\"\n", input);
	}
	return n;
}

void parse_symbol_value(char *input, int *restrict bank, int *restrict address) {
	char *colon = strchr(input, ':');
	if (colon) {
		*colon++ = '\0';
		*bank = parse_number(input, 16);
		*address = parse_number(colon, 16);
	} else {
		*bank = 0;
		*address = parse_number(input, 16);
	}
}

struct Symbol *parse_symbols(const char *filename) {
	FILE *file = xfopen(filename, 'r');
	struct Buffer *buffer = buffer_create(1);

	enum { SYM_PRE, SYM_VALUE, SYM_SPACE, SYM_NAME } state = SYM_PRE;
	int bank = 0;
	int address = 0;
	struct Symbol *symbols = NULL;

	for (;;) {
		int c = getc(file);
		if (c == EOF || c == '\n' || c == '\r' || c == ';' || (state == SYM_NAME && (c == ' ' || c == '\t'))) {
			if (state == SYM_NAME) {
				// The symbol name has ended; append the buffered symbol
				buffer_append(buffer, &(char []){'\0'});
				symbol_append(&symbols, buffer->data, bank, address);
			}
			// Skip to the next line, ignoring anything after the symbol value and name
			state = SYM_PRE;
			while (c != EOF && c != '\n' && c != '\r') {
				c = getc(file);
			}
			if (c == EOF) {
				break;
			}
		} else if (c != ' ' && c != '\t') {
			if (state == SYM_PRE || state == SYM_SPACE) {
				// The symbol value or name has started; buffer its contents
				if (++state == SYM_NAME) {
					// The symbol name has started; parse the buffered value
					buffer_append(buffer, &(char []){'\0'});
					parse_symbol_value(buffer->data, &bank, &address);
				}
				buffer->size = 0;
			}
			buffer_append(buffer, &c);
		} else if (state == SYM_VALUE) {
			// The symbol value has ended; wait to see if a name comes after it
			state = SYM_SPACE;
		}
	}

	fclose(file);
	buffer_free(buffer);
	return symbols;
}

int strfind(const char *s, const char *list[], int count) {
	for (int i = 0; i < count; i++) {
		if (!strcmp(s, list[i])) {
			return i;
		}
	}
	return -1;
}

#define vstrfind(s, ...) strfind(s, (const char *[]){__VA_ARGS__}, COUNTOF((const char *[]){__VA_ARGS__}))

int parse_arg_value(const char *arg, bool absolute, const struct Symbol *symbols, const char *patch_name) {
	// Comparison operators for "ConditionValueB" evaluate to their particular values
	int op = vstrfind(arg, "==", ">", "<", ">=", "<=", "!=", "||");
	if (op >= 0) {
		return op == 6 ? 0x11 : op; // "||" is 0x11
	}

	// Literal numbers evaluate to themselves
	if (isdigit((unsigned)arg[0]) || arg[0] == '+') {
		return parse_number(arg, 0);
	}

	// Symbols may take the low or high part
	enum { SYM_WHOLE, SYM_LOW, SYM_HIGH } part = SYM_WHOLE;
	if (arg[0] == '<') {
		part = SYM_LOW;
		arg++;
	} else if (arg[0] == '>') {
		part = SYM_HIGH;
		arg++;
	}

	// Symbols evaluate to their offset or address, plus an optional offset mod
	int offset_mod = 0;
	char *plus = strchr(arg, '+');
	if (plus) {
		offset_mod = parse_number(plus, 0);
		*plus = '\0';
	}

	// Symbols evaluate to their offset or address
	const char *sym_name = !strcmp(arg, "@") ? patch_name : arg; // "@" is the current patch label
	const struct Symbol *symbol = symbol_find(symbols, sym_name);

	int value = (absolute ? symbol->offset : symbol->address) + offset_mod;
	return part == SYM_LOW ? value & 0xff : part == SYM_HIGH ? value >> 8 : value;
}

void interpret_command(char *command, const struct Symbol *current_hook, const struct Symbol *symbols, struct Buffer *patches, FILE *restrict new_rom, FILE *restrict orig_rom, FILE *restrict output) {
	// Strip all leading spaces and all but one trailing space
	int x = 0;
	for (int i = 0; command[i]; i++) {
		if (!isspace((unsigned)command[i]) || (i > 0 && !isspace((unsigned)command[i - 1]))) {
			command[x++] = command[i];
		}
	}
	command[x - (x > 0 && isspace((unsigned)command[x - 1]))] = '\0';

	// Count the arguments
	int argc = 0;
	for (const char *c = command; *c; c++) {
		if (isspace((unsigned)*c)) {
			argc++;
		}
	}

	// Get the arguments
	char *argv[argc]; // VLA
	char *arg = command;
	for (int i = 0; i < argc; i++) {
		while (*arg && !isspace((unsigned)*arg)) {
			arg++;
		}
		if (!*arg) {
			break;
		}
		*arg++ = '\0';
		argv[i] = arg;
	}

	// Use the arguments
	if (vstrfind(command, "patch", "PATCH", "patch_", "PATCH_", "patch/", "PATCH/") >= 0) {
		if (argc > 2) {
			error_exit("Error: Invalid arguments for command: \"%s\"\n", command);
		}
		if (!current_hook) {
			error_exit("Error: No current patch for command: \"%s\"\n", command);
		}
		int current_offset = current_hook->offset + (argc > 0 ? parse_number(argv[0], 0) : 0);
		if (fseek(orig_rom, current_offset, SEEK_SET)) {
			error_exit("Error: Cannot seek to \"vc_patch %s\" in the original ROM\n", current_hook->name);
		}
		if (fseek(new_rom, current_offset, SEEK_SET)) {
			error_exit("Error: Cannot seek to \"vc_patch %s\" in the new ROM\n", current_hook->name);
		}
		int length;
		if (argc == 2) {
			length = parse_number(argv[1], 0);
		} else {
			const struct Symbol *current_hook_end = symbol_find_cat(symbols, current_hook->name, "_End");
			length = current_hook_end->offset - current_offset;
		}
		buffer_append(patches, &(struct Patch){current_offset, length});
		bool modified = false;
		if (length == 1) {
			int c = getc(new_rom);
			modified = c != getc(orig_rom);
			fprintf(output, isupper((unsigned)command[0]) ? "0x%02X" : "0x%02x", c);
		} else {
			if (command[strlen(command) - 1] != '/') {
				fprintf(output, command[strlen(command) - 1] == '_' ? "a%d: " : "a%d:", length);
			}
			for (int i = 0; i < length; i++) {
				if (i) {
					putc(' ', output);
				}
				int c = getc(new_rom);
				modified |= c != getc(orig_rom);
				fprintf(output, isupper((unsigned)command[0]) ? "%02X" : "%02x", c);
			}
		}
		if (!modified) {
			fprintf(stderr, PROGRAM_NAME ": Warning: \"vc_patch %s\" doesn't alter the ROM\n", current_hook->name);
		}

	} else if (vstrfind(command, "dws", "DWS", "dws_", "DWS_", "dws/", "DWS/") >= 0) {
		if (argc < 1) {
			error_exit("Error: Invalid arguments for command: \"%s\"\n", command);
		}
		if (command[strlen(command) - 1] != '/') {
			fprintf(output, command[strlen(command) - 1] == '_' ? "a%d: " : "a%d:", argc * 2);
		}
		for (int i = 0; i < argc; i++) {
			int value = parse_arg_value(argv[i], false, symbols, current_hook->name);
			if (value > 0xffff) {
				error_exit("Error: Invalid value for \"%s\" argument: 0x%x\n", command, value);
			}
			if (i) {
				putc(' ', output);
			}
			fprintf(output, isupper((unsigned)command[0]) ? "%02X %02X": "%02x %02x", value & 0xff, value >> 8);
		}

	} else if (vstrfind(command, "db", "DB", "db_", "DB_", "db/", "DB/") >= 0) {
		if (argc != 1) {
			error_exit("Error: Invalid arguments for command: \"%s\"\n", command);
		}
		int value = parse_arg_value(argv[0], false, symbols, current_hook->name);
		if (value > 0xff) {
			error_exit("Error: Invalid value for \"%s\" argument: 0x%x\n", command, value);
		}
		if (command[strlen(command) - 1] != '/') {
			fputs(command[strlen(command) - 1] == '_' ? "a1: " : "a1:", output);
		}
		fprintf(output, isupper((unsigned)command[0]) ? "%02X" : "%02x", value);

	} else if (vstrfind(command, "hex", "HEX", "HEx", "Hex", "heX", "hEX", "hex~", "HEX~", "HEx~", "Hex~", "heX~", "hEX~") >= 0) {
		if (argc != 1 && argc != 2) {
			error_exit("Error: Invalid arguments for command: \"%s\"\n", command);
		}
		int value = parse_arg_value(argv[0], command[strlen(command) - 1] != '~', symbols, current_hook->name);
		int padding = argc > 1 ? parse_number(argv[1], 0) : 2;
		if (vstrfind(command, "HEx", "HEx~") >= 0) {
			fprintf(output, "0x%0*X%02x", padding - 2, value >> 8, value & 0xff);
		} else if (vstrfind(command, "Hex", "Hex~") >= 0) {
			fprintf(output, "0x%0*X%03x", padding - 3, value >> 12, value & 0xfff);
		} else if (vstrfind(command, "heX", "heX~") >= 0) {
			fprintf(output, "0x%0*x%02X", padding - 2, value >> 8, value & 0xff);
		} else if (vstrfind(command, "hEX", "hEX~") >= 0) {
			fprintf(output, "0x%0*x%03X", padding - 3, value >> 12, value & 0xfff);
		} else {
			fprintf(output, isupper((unsigned)command[0]) ? "0x%0*X" : "0x%0*x", padding, value);
		}

	} else {
		error_exit("Error: Unknown command: \"%s\"\n", command);
	}
}

void skip_to_next_line(FILE *restrict input, FILE *restrict output) {
	for (int c = getc(input); c != EOF; c = getc(input)) {
		putc(c, output);
		if (c == '\n' || c == '\r') {
			break;
		}
	}
}

struct Buffer *process_template(const char *template_filename, const char *patch_filename, FILE *restrict new_rom, FILE *restrict orig_rom, const struct Symbol *symbols) {
	FILE *input = xfopen(template_filename, 'r');
	FILE *output = xfopen(patch_filename, 'w');

	struct Buffer *patches = buffer_create(sizeof(struct Patch));
	struct Buffer *buffer = buffer_create(1);

	// The ROM checksum will always differ
	buffer_append(patches, &(struct Patch){0x14e, 2});

	// Fill in the template
	const struct Symbol *current_hook = NULL;
	for (int c = getc(input); c != EOF; c = getc(input)) {
		switch (c) {
		case ';':
			// ";" comments until the end of the line
			putc(c, output);
			skip_to_next_line(input, output);
			break;

		case '{':
			// "{...}" is a template command; buffer its contents
			buffer->size = 0;
			for (c = getc(input); c != EOF && c != '}'; c = getc(input)) {
				buffer_append(buffer, &c);
			}
			buffer_append(buffer, &(char []){'\0'});
			// Interpret the command in the context of the current patch
			interpret_command(buffer->data, current_hook, symbols, patches, new_rom, orig_rom, output);
			break;

		case '[':
			// "[...]" is a patch label; buffer its contents
			putc(c, output);
			bool alternate = false;
			buffer->size = 0;
			for (c = getc(input); c != EOF; c = getc(input)) {
				if (!alternate && c == '@') {
					// "@" designates an alternate name for the ".VC_" label
					alternate = true;
					buffer->size = 0;
				} else if (c == ']') {
					putc(c, output);
					break;
				} else {
					if (!alternate) {
						putc(c, output);
						if (!isalnum(c) && c != '_') {
							// Convert non-identifier characters to underscores
							c = '_';
						}
					}
					buffer_append(buffer, &c);
				}
			}
			buffer_append(buffer, &(char []){'\0'});
			// The current patch should have a corresponding ".VC_" label
			current_hook = symbol_find_cat(symbols, ".VC_", buffer->data);
			skip_to_next_line(input, output);
			break;

		default:
			putc(c, output);
		}
	}

	rewind(orig_rom);
	rewind(new_rom);

	fclose(input);
	fclose(output);
	buffer_free(buffer);
	return patches;
}

int compare_patch(const void *patch1, const void *patch2) {
	unsigned int offset1 = ((const struct Patch *)patch1)->offset;
	unsigned int offset2 = ((const struct Patch *)patch2)->offset;
	return (offset1 > offset2) - (offset1 < offset2);
}

bool verify_completeness(FILE *restrict orig_rom, FILE *restrict new_rom, struct Buffer *patches) {
	qsort(patches->data, patches->size, patches->item_size, compare_patch);
	for (unsigned int offset = 0, index = 0; ; offset++) {
		int orig_byte = getc(orig_rom);
		int new_byte = getc(new_rom);
		if (orig_byte == EOF || new_byte == EOF) {
			return orig_byte == new_byte;
		}
		struct Patch *patch = &((struct Patch *)patches->data)[index];
		if (index < patches->size && patch->offset == offset) {
			if (fseek(orig_rom, patch->size, SEEK_CUR)) {
				return false;
			}
			if (fseek(new_rom, patch->size, SEEK_CUR)) {
				return false;
			}
			offset += patch->size;
			index++;
		} else if (orig_byte != new_byte) {
			fprintf(stderr, PROGRAM_NAME ": Warning: Unpatched difference at offset: 0x%x\n", offset);
			fprintf(stderr, "    Original ROM value: 0x%02x\n", orig_byte);
			fprintf(stderr, "    Patched ROM value: 0x%02x\n", new_byte);
			fprintf(stderr, "    Current patch offset: 0x%06x\n", patch->offset);
			return false;
		}
	}
}

int main(int argc, char *argv[]) {
	if (argc != 6) {
		usage_exit(1);
	}

	struct Symbol *symbols = parse_symbols(argv[1]);

	FILE *new_rom = xfopen(argv[2], 'r');
	FILE *orig_rom = xfopen(argv[3], 'r');
	struct Buffer *patches = process_template(argv[4], argv[5], new_rom, orig_rom, symbols);

	if (!verify_completeness(orig_rom, new_rom, patches)) {
		fprintf(stderr, PROGRAM_NAME ": Warning: Not all ROM differences are defined by \"%s\"\n", argv[5]);
	}

	symbol_free(symbols);
	fclose(new_rom);
	fclose(orig_rom);
	buffer_free(patches);
	return 0;
}
