/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2022, Eldred Habert and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#include "gfx/main.hpp"

#include <algorithm>
#include <assert.h>
#include <cinttypes>
#include <cstdint>
#include <ctype.h>
#include <fstream>
#include <ios>
#include <limits>
#include <numeric>
#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <string_view>
#include <type_traits>

#include "extern/getopt.h"
#include "file.hpp"
#include "platform.h"
#include "version.h"

#include "gfx/pal_spec.hpp"
#include "gfx/process.hpp"
#include "gfx/reverse.hpp"

using namespace std::literals::string_view_literals;

Options options;
char const *externalPalSpec = nullptr;
static uintmax_t nbErrors;

[[noreturn]] void giveUp() {
	fprintf(stderr, "Conversion aborted after %ju error%s\n", nbErrors, nbErrors == 1 ? "" : "s");
	exit(1);
}

void warning(char const *fmt, ...) {
	va_list ap;

	fputs("warning: ", stderr);
	va_start(ap, fmt);
	vfprintf(stderr, fmt, ap);
	va_end(ap);
	putc('\n', stderr);
}

void error(char const *fmt, ...) {
	va_list ap;

	fputs("error: ", stderr);
	va_start(ap, fmt);
	vfprintf(stderr, fmt, ap);
	va_end(ap);
	putc('\n', stderr);

	if (nbErrors != std::numeric_limits<decltype(nbErrors)>::max())
		nbErrors++;
}

[[noreturn]] void fatal(char const *fmt, ...) {
	va_list ap;

	fputs("FATAL: ", stderr);
	va_start(ap, fmt);
	vfprintf(stderr, fmt, ap);
	va_end(ap);
	putc('\n', stderr);

	if (nbErrors != std::numeric_limits<decltype(nbErrors)>::max())
		nbErrors++;

	giveUp();
}

void Options::verbosePrint(uint8_t level, char const *fmt, ...) const {
	if (verbosity >= level) {
		va_list ap;

		va_start(ap, fmt);
		vfprintf(stderr, fmt, ap);
		va_end(ap);
	}
}

// Short options
static char const *optstring = "-Aa:b:Cc:Dd:FfhL:mN:n:o:Pp:Qq:r:s:Tt:U:uVvx:Z";

/*
 * Equivalent long options
 * Please keep in the same order as short opts
 *
 * Also, make sure long opts don't create ambiguity:
 * A long opt's name should start with the same letter as its short opt,
 * except if it doesn't create any ambiguity (`verbose` versus `version`).
 * This is because long opt matching, even to a single char, is prioritized
 * over short opt matching
 */
static struct option const longopts[] = {
    {"output-attr-map",    no_argument,       NULL, 'A'},
    {"attr-map",           required_argument, NULL, 'a'},
    {"base-tiles",         required_argument, NULL, 'b'},
    {"color-curve",        no_argument,       NULL, 'C'},
    {"colors",             required_argument, NULL, 'c'},
    {"debug",              no_argument,       NULL, 'D'}, // Ignored
    {"depth",              required_argument, NULL, 'd'},
    {"fix",                no_argument,       NULL, 'f'},
    {"fix-and-save",       no_argument,       NULL, 'F'}, // Deprecated
    {"horizontal",         no_argument,       NULL, 'h'}, // Deprecated
    {"slice",              required_argument, NULL, 'L'},
    {"mirror-tiles",       no_argument,       NULL, 'm'},
    {"nb-tiles",           required_argument, NULL, 'N'},
    {"nb-palettes",        required_argument, NULL, 'n'},
    {"output",             required_argument, NULL, 'o'},
    {"output-palette",     no_argument,       NULL, 'P'},
    {"palette",            required_argument, NULL, 'p'},
    {"output-palette-map", no_argument,       NULL, 'Q'},
    {"palette-map",        required_argument, NULL, 'q'},
    {"reverse",            required_argument, NULL, 'r'},
    {"output-tilemap",     no_argument,       NULL, 'T'},
    {"tilemap",            required_argument, NULL, 't'},
    {"unit-size",          required_argument, NULL, 'U'},
    {"unique-tiles",       no_argument,       NULL, 'u'},
    {"version",            no_argument,       NULL, 'V'},
    {"verbose",            no_argument,       NULL, 'v'},
    {"trim-end",           required_argument, NULL, 'x'},
    {"columns",            no_argument,       NULL, 'Z'},
    {NULL,                 no_argument,       NULL, 0  }
};

static void printUsage(void) {
	fputs("Usage: rgbgfx [-r stride] [-CmuVZ] [-v [-v ...]] [-a <attr_map> | -A]\n"
	      "       [-b <base_ids>] [-c <colors>] [-d <depth>] [-L <slice>] [-N <nb_tiles>]\n"
	      "       [-n <nb_pals>] [-o <out_file>] [-p <pal_file> | -P] [-q <pal_map> | -Q]\n"
	      "       [-s <nb_colors>] [-t <tile_map> | -T] [-x <nb_tiles>] <file>\n"
	      "Useful options:\n"
	      "    -m, --mirror-tiles    optimize out mirrored tiles\n"
	      "    -o, --output <path>   output the tile data to this path\n"
	      "    -t, --tilemap <path>  output the tile map to this path\n"
	      "    -u, --unique-tiles    optimize out identical tiles\n"
	      "    -V, --version         print RGBGFX version and exit\n"
	      "\n"
	      "For help, use `man rgbgfx' or go to https://rgbds.gbdev.io/docs/\n",
	      stderr);
	exit(1);
}

/*
 * Parses a number at the beginning of a string, moving the pointer to skip the parsed characters
 * Returns the provided errVal on error
 */
static uint16_t parseNumber(char *&string, char const *errPrefix, uint16_t errVal = UINT16_MAX) {
	uint8_t base = 10;
	if (*string == '\0') {
		error("%s: expected number, but found nothing", errPrefix);
		return errVal;
	} else if (*string == '$') {
		base = 16;
		++string;
	} else if (*string == '%') {
		base = 2;
		++string;
	} else if (*string == '0' && string[1] != '\0') {
		// Check if we have a "0x" or "0b" here
		if (string[1] == 'x' || string[1] == 'X') {
			base = 16;
			string += 2;
		} else if (string[1] == 'b' || string[1] == 'B') {
			base = 2;
			string += 2;
		}
	}

	/*
	 * Turns a digit into its numeric value in the current base, if it has one.
	 * Maximum is inclusive. The string_view is modified to "consume" all digits.
	 * Returns 255 on parse failure (including wrong char for base), in which case
	 * the string_view may be pointing on garbage.
	 */
	auto charIndex = [&base](unsigned char c) -> uint8_t {
		unsigned char index = c - '0'; // Use wrapping semantics
		if (base == 2 && index >= 2) {
			return 255;
		} else if (index < 10) {
			return index;
		} else if (base != 16) {
			return 255; // Letters are only valid in hex
		}
		index = tolower(c) - 'a'; // OK because we pass an `unsigned char`
		if (index < 6) {
			return index + 10;
		}
		return 255;
	};

	if (charIndex(*string) == 255) {
		error("%s: expected digit%s, but found nothing", errPrefix,
		      base != 10 ? " after base" : "");
		return errVal;
	}
	uint16_t number = 0;
	do {
		// Read a character, and check if it's valid in the given base
		uint8_t index = charIndex(*string);
		if (index == 255) {
			break; // Found an invalid character, end
		}
		++string;

		number *= base;
		number += index;
		// The lax check covers the addition on top of the multiplication
		if (number >= UINT16_MAX / base) {
			error("%s: the number is too large!", errPrefix);
			return errVal;
		}
	} while (*string != '\0'); // No more characters?

	return number;
}

static void skipWhitespace(char *&arg) {
	arg += strspn(arg, " \t");
}

static void registerInput(char const *arg) {
	if (!options.input.empty()) {
		fprintf(stderr,
		        "FATAL: input image specified more than once! (first \"%s\", then "
		        "\"%s\")\n",
		        options.input.c_str(), arg);
		printUsage();
		exit(1);
	} else if (arg[0] == '\0') { // Empty input path
		fprintf(stderr, "FATAL: input image path cannot be empty!\n");
		printUsage();
		exit(1);
	} else {
		options.input = arg;
	}
}

/*
 * Turn an "at-file"'s contents into an argv that `getopt` can handle
 * @param argPool Argument characters will be appended to this vector, for storage purposes.
 */
static std::vector<size_t> readAtFile(std::string const &path, std::vector<char> &argPool) {
	File file;
	if (!file.open(path, std::ios_base::in)) {
		fatal("Error reading @%s: %s", file.c_str(path), strerror(errno));
	}

	// We only filter out `EOF`, but calling `isblank()` on anything else is UB!
	static_assert(std::remove_reference_t<decltype(*file)>::traits_type::eof() == EOF,
	              "isblank(char_traits<...>::eof()) is UB!");
	std::vector<size_t> argvOfs;

	for (;;) {
		int c;

		// First, discard any leading whitespace
		do {
			c = file->sbumpc();
			if (c == EOF) {
				return argvOfs;
			}
		} while (isblank(c));

		switch (c) {
		case '#': // If it's a comment, discard everything until EOL
			while ((c = file->sbumpc()) != '\n') {
				if (c == EOF) {
					return argvOfs;
				}
			}
			continue; // Start processing the next line
		// If it's an empty line, ignore it
		case '\r': // Assuming CRLF here
			file->sbumpc(); // Discard the upcoming '\n'
			[[fallthrough]];
		case '\n':
			continue; // Start processing the next line
		}

		// Alright, now we can parse the line
		do {
			// Read one argument (until the next whitespace char).
			// We know there is one because we already have its first character in `c`.
			argvOfs.push_back(argPool.size());
			// Reading and appending characters one at a time may be inefficient, but I'm counting
			// on `vector` and `sbumpc` to do the right thing here.
			argPool.push_back(c); // Push the character we've already read
			for (;;) {
				c = file->sbumpc();
				if (c == EOF || c == '\n' || isblank(c)) {
					break;
				} else if (c == '\r') {
					file->sbumpc(); // Discard the '\n'
					break;
				}
				argPool.push_back(c);
			}
			argPool.push_back('\0');

			// Discard whitespace until the next argument (candidate)
			while (isblank(c)) {
				c = file->sbumpc();
			}
			if (c == '\r') {
				c = file->sbumpc(); // Skip the '\n'
			}
		} while (c != '\n' && c != EOF); // End if we reached EOL
	}
}
/*
 * Parses an arg vector, modifying `options` as options are read.
 * The three booleans are for the "auto path" flags, since their processing must be deferred to the
 * end of option parsing.
 *
 * Returns NULL if the vector was fully parsed, or a pointer (which is part of the arg vector) to an
 * "at-file" path if one is encountered.
 */
static char *parseArgv(int argc, char **argv, bool &autoAttrmap, bool &autoTilemap,
                       bool &autoPalettes, bool &autoPalmap) {
	int opt;

	while ((opt = musl_getopt_long_only(argc, argv, optstring, longopts, nullptr)) != -1) {
		char *arg = musl_optarg; // Make a copy for scanning
		switch (opt) {
		case 'A':
			autoAttrmap = true;
			break;
		case 'a':
			autoAttrmap = false;
			if (!options.attrmap.empty())
				warning("Overriding attrmap file %s", options.attrmap.c_str());
			options.attrmap = musl_optarg;
			break;
		case 'b':
			options.baseTileIDs[0] = parseNumber(arg, "Bank 0 base tile ID", 0);
			if (options.baseTileIDs[0] >= 256) {
				error("Bank 0 base tile ID must be below 256");
			}
			if (*arg == '\0') {
				options.baseTileIDs[1] = 0;
				break;
			}
			skipWhitespace(arg);
			if (*arg != ',') {
				error("Base tile IDs must be one or two comma-separated numbers, not \"%s\"",
				      musl_optarg);
				break;
			}
			++arg; // Skip comma
			skipWhitespace(arg);
			options.baseTileIDs[1] = parseNumber(arg, "Bank 1 base tile ID", 0);
			if (options.baseTileIDs[1] >= 256) {
				error("Bank 1 base tile ID must be below 256");
			}
			if (*arg != '\0') {
				error("Base tile IDs must be one or two comma-separated numbers, not \"%s\"",
				      musl_optarg);
				break;
			}
			break;
		case 'C':
			options.useColorCurve = true;
			break;
		case 'c':
			if (musl_optarg[0] == '#') {
				options.palSpecType = Options::EXPLICIT;
				parseInlinePalSpec(musl_optarg);
			} else if (strcasecmp(musl_optarg, "embedded") == 0) {
				// Use PLTE, error out if missing
				options.palSpecType = Options::EMBEDDED;
			} else {
				options.palSpecType = Options::EXPLICIT;
				// Can't parse the file yet, as "flat" color collections need to know the palette
				// size to be split; thus, we defer that
				// TODO: this does not validate the `fmt` part of any external spec but the last
				// one, but I guess that's okay
				externalPalSpec = musl_optarg;
			}
			break;
		case 'd':
			options.bitDepth = parseNumber(arg, "Bit depth", 2);
			if (*arg != '\0') {
				error("Bit depth (-b) argument must be a valid number, not \"%s\"", musl_optarg);
			} else if (options.bitDepth != 1 && options.bitDepth != 2) {
				error("Bit depth must be 1 or 2, not %" PRIu8);
				options.bitDepth = 2;
			}
			break;
		case 'L':
			options.inputSlice.left = parseNumber(arg, "Input slice left coordinate");
			if (options.inputSlice.left > INT16_MAX) {
				error("Input slice left coordinate is out of range!");
				break;
			}
			skipWhitespace(arg);
			if (*arg != ',') {
				error("Missing comma after left coordinate in \"%s\"", musl_optarg);
				break;
			}
			++arg;
			skipWhitespace(arg);
			options.inputSlice.top = parseNumber(arg, "Input slice upper coordinate");
			skipWhitespace(arg);
			if (*arg != ':') {
				error("Missing colon after upper coordinate in \"%s\"", musl_optarg);
				break;
			}
			++arg;
			skipWhitespace(arg);
			options.inputSlice.width = parseNumber(arg, "Input slice width");
			skipWhitespace(arg);
			if (options.inputSlice.width == 0) {
				error("Input slice width may not be 0!");
			}
			if (*arg != ',') {
				error("Missing comma after width in \"%s\"", musl_optarg);
				break;
			}
			++arg;
			skipWhitespace(arg);
			options.inputSlice.height = parseNumber(arg, "Input slice height");
			if (options.inputSlice.height == 0) {
				error("Input slice height may not be 0!");
			}
			if (*arg != '\0') {
				error("Unexpected extra characters after slice spec in \"%s\"", musl_optarg);
			}
			break;
		case 'm':
			options.allowMirroring = true;
			[[fallthrough]]; // Imply `-u`
		case 'u':
			options.allowDedup = true;
			break;
		case 'N':
			options.maxNbTiles[0] = parseNumber(arg, "Number of tiles in bank 0", 256);
			if (options.maxNbTiles[0] > 256) {
				error("Bank 0 cannot contain more than 256 tiles");
			}
			if (*arg == '\0') {
				options.maxNbTiles[1] = 0;
				break;
			}
			skipWhitespace(arg);
			if (*arg != ',') {
				error("Bank capacity must be one or two comma-separated numbers, not \"%s\"",
				      musl_optarg);
				break;
			}
			++arg; // Skip comma
			skipWhitespace(arg);
			options.maxNbTiles[1] = parseNumber(arg, "Number of tiles in bank 1", 256);
			if (options.maxNbTiles[1] > 256) {
				error("Bank 1 cannot contain more than 256 tiles");
			}
			if (*arg != '\0') {
				error("Bank capacity must be one or two comma-separated numbers, not \"%s\"",
				      musl_optarg);
				break;
			}
			break;
		case 'n':
			options.nbPalettes = parseNumber(arg, "Number of palettes", 256);
			if (*arg != '\0') {
				error("Number of palettes (-n) must be a valid number, not \"%s\"", musl_optarg);
			}
			if (options.nbPalettes > 256) {
				error("Number of palettes (-n) must not exceed 256!");
			} else if (options.nbPalettes == 0) {
				error("Number of palettes (-n) may not be 0!");
			}
			break;
		case 'o':
			if (!options.output.empty())
				warning("Overriding tile data file %s", options.output.c_str());
			options.output = musl_optarg;
			break;
		case 'P':
			autoPalettes = true;
			break;
		case 'p':
			autoPalettes = false;
			if (!options.palettes.empty())
				warning("Overriding palettes file %s", options.palettes.c_str());
			options.palettes = musl_optarg;
			break;
		case 'Q':
			autoPalmap = true;
			break;
		case 'q':
			autoPalmap = false;
			if (!options.palmap.empty())
				warning("Overriding palette map file %s", options.palmap.c_str());
			options.palmap = musl_optarg;
			break;
		case 'r':
			options.reversedWidth = parseNumber(arg, "Reversed image stride");
			if (*arg != '\0') {
				error("Reversed image stride (-r) must be a valid number, not \"%s\"", musl_optarg);
			}
			if (options.reversedWidth == 0) {
				error("Reversed image stride (-r) may not be 0!");
			}
			break;
		case 's':
			options.nbColorsPerPal = parseNumber(arg, "Number of colors per palette", 4);
			if (*arg != '\0') {
				error("Palette size (-s) must be a valid number, not \"%s\"", musl_optarg);
			}
			if (options.nbColorsPerPal > 4) {
				error("Palette size (-s) must not exceed 4!");
			} else if (options.nbColorsPerPal == 0) {
				error("Palette size (-s) may not be 0!");
			}
			break;
		case 'T':
			autoTilemap = true;
			break;
		case 't':
			autoTilemap = false;
			if (!options.tilemap.empty())
				warning("Overriding tilemap file %s", options.tilemap.c_str());
			options.tilemap = musl_optarg;
			break;
		case 'V':
			printf("rgbgfx %s\n", get_package_version_string());
			exit(0);
		case 'v':
			if (options.verbosity < Options::VERB_VVVVVV) {
				++options.verbosity;
			}
			break;
		case 'x':
			options.trim = parseNumber(arg, "Number of tiles to trim", 0);
			if (*arg != '\0') {
				error("Tile trim (-x) argument must be a valid number, not \"%s\"", musl_optarg);
			}
			break;
		case 'h':
			warning("`-h` is deprecated, use `-Z` instead");
			[[fallthrough]];
		case 'Z':
			options.columnMajor = true;
			break;
		case 1: // Positional argument, requested by leading `-` in opt string
			if (musl_optarg[0] == '@') {
				// Instruct the caller to process that at-file
				return &musl_optarg[1];
			} else {
				registerInput(musl_optarg);
			}
			break;
		case 'D':
		case 'F':
		case 'f':
			warning("Ignoring retired option `-%c`", opt);
			break;
		default:
			printUsage();
			exit(1);
		}
	}

	return nullptr; // Done processing this argv
}

int main(int argc, char *argv[]) {
	bool autoAttrmap = false, autoTilemap = false, autoPalettes = false, autoPalmap = false;

	struct AtFileStackEntry {
		int parentInd; // Saved offset into parent argv
		std::vector<char *> argv; // This context's arg pointer vec
		std::vector<char> argPool;

		AtFileStackEntry(int parentInd_, std::vector<char *> argv_)
		    : parentInd(parentInd_), argv(argv_) {}
	};
	std::vector<AtFileStackEntry> atFileStack;

	int curArgc = argc;
	char **curArgv = argv;
	for (;;) {
		char *atFileName =
		    parseArgv(curArgc, curArgv, autoAttrmap, autoTilemap, autoPalettes, autoPalmap);
		if (atFileName) {
			// Copy `argv[0]` for error reporting, and because option parsing skips it
			AtFileStackEntry &stackEntry =
			    atFileStack.emplace_back(musl_optind, std::vector{atFileName});
			// It would be nice to compute the char pointers on the fly, but reallocs don't allow
			// that; so we must compute the offsets after the pool is fixed
			auto offsets = readAtFile(&musl_optarg[1], stackEntry.argPool);
			stackEntry.argv.reserve(offsets.size() + 2); // Avoid a bunch of reallocs
			for (size_t ofs : offsets) {
				stackEntry.argv.push_back(&stackEntry.argPool.data()[ofs]);
			}
			stackEntry.argv.push_back(nullptr); // Don't forget the arg vector terminator!

			curArgc = stackEntry.argv.size() - 1;
			curArgv = stackEntry.argv.data();
			musl_optind = 1; // Don't use 0 because we're not scanning a different argv per se
			continue; // Begin scanning that arg vector
		}

		if (musl_optind != curArgc) {
			// This happens if `--` is passed, process the remaining arg(s) as positional
			assert(musl_optind < curArgc);
			for (int i = musl_optind; i < curArgc; ++i) {
				registerInput(argv[i]);
			}
		}

		// Pop off the top stack entry, or end parsing if none
		if (atFileStack.empty()) {
			break;
		}
		// OK to restore `optind` directly, because `optpos` must be 0 right now.
		// (Providing 0 would be a "proper" reset, but we want to resume parsing)
		musl_optind = atFileStack.back().parentInd;
		atFileStack.pop_back();
		if (atFileStack.empty()) {
			curArgc = argc;
			curArgv = argv;
		} else {
			auto &vec = atFileStack.back().argv;
			curArgc = vec.size();
			curArgv = vec.data();
		}
	}

	if (options.nbColorsPerPal == 0) {
		options.nbColorsPerPal = 1u << options.bitDepth;
	} else if (options.nbColorsPerPal > 1u << options.bitDepth) {
		error("%" PRIu8 "bpp palettes can only contain %u colors, not %" PRIu8, options.bitDepth,
		      1u << options.bitDepth, options.nbColorsPerPal);
	}

	auto autoOutPath = [](bool autoOptEnabled, std::string &path, char const *extension) {
		if (autoOptEnabled) {
			constexpr std::string_view chars =
// Both must start with a dot!
#if defined(_MSC_VER) || defined(__MINGW32__)
			    "./\\"sv;
#else
			    "./"sv;
#endif
			size_t len = options.input.npos;
			size_t i = options.input.find_last_of(chars);
			if (i != options.input.npos && options.input[i] == '.') {
				// We found the last dot, but check if it's part of a stem
				// (There must be a non-path separator character before it)
				if (i != 0 && chars.find(options.input[i - 1], 1) == chars.npos) {
					// We can replace the extension
					len = i;
				}
			}
			path.assign(options.input, 0, len);
			path.append(extension);
		}
	};
	autoOutPath(autoAttrmap, options.attrmap, ".attrmap");
	autoOutPath(autoTilemap, options.tilemap, ".tilemap");
	autoOutPath(autoPalettes, options.palettes, ".pal");
	autoOutPath(autoPalmap, options.palmap, ".palmap");

	// Execute deferred external pal spec parsing, now that all other params are known
	if (externalPalSpec) {
		parseExternalPalSpec(externalPalSpec);
	}

	if (options.verbosity >= Options::VERB_CFG) {
		fprintf(stderr, "rgbgfx %s\n", get_package_version_string());

		if (options.verbosity >= Options::VERB_VVVVVV) {
			fputc('\n', stderr);
			static std::array<uint16_t, 21> gfx{
			    0x1FE, 0x3FF, 0x399, 0x399, 0x3FF, 0x3FF, 0x381, 0x3C3, 0x1FE, 0x078, 0x1FE,
			    0x3FF, 0x3FF, 0x3FF, 0x37B, 0x37B, 0x0FC, 0x0CC, 0x1CE, 0x1CE, 0x1CE,
			};
			static std::array<char const *, 3> textbox{
			    "  ,----------------------------------------.",
			    "  | Augh, dimensional interference again?! |",
			    "  `----------------------------------------'"};
			for (size_t i = 0; i < gfx.size(); ++i) {
				uint16_t row = gfx[i];
				for (uint8_t _ = 0; _ < 10; ++_) {
					unsigned char c = row & 1 ? '0' : ' ';
					fputc(c, stderr);
					// Double the pixel horizontally, otherwise the aspect ratio looks wrong
					fputc(c, stderr);
					row >>= 1;
				}
				if (i < textbox.size()) {
					fputs(textbox[i], stderr);
				}
				fputc('\n', stderr);
			}
			fputc('\n', stderr);
		}

		fputs("Options:\n", stderr);
		if (options.columnMajor)
			fputs("\tVisit image in column-major order\n", stderr);
		if (options.allowMirroring)
			fputs("\tAllow mirroring tiles\n", stderr);
		if (options.allowDedup)
			fputs("\tAllow deduplicating tiles\n", stderr);
		if (options.useColorCurve)
			fputs("\tUse color curve\n", stderr);
		fprintf(stderr, "\tBit depth: %" PRIu8 "bpp\n", options.bitDepth);
		if (options.trim != 0)
			fprintf(stderr, "\tTrim the last %" PRIu64 " tiles\n", options.trim);
		fprintf(stderr, "\tMaximum %" PRIu8 " palettes\n", options.nbPalettes);
		fprintf(stderr, "\tPalettes contain %" PRIu8 " colors\n", options.nbColorsPerPal);
		fprintf(stderr, "\t%s palette spec\n", []() {
			switch (options.palSpecType) {
			case Options::NO_SPEC:
				return "No";
			case Options::EXPLICIT:
				return "Explicit";
			case Options::EMBEDDED:
				return "Embedded";
			}
			return "???";
		}());
		if (options.palSpecType == Options::EXPLICIT) {
			fputs("\t[\n", stderr);
			for (std::array<Rgba, 4> const &pal : options.palSpec) {
				fprintf(stderr, "\t\t#%06x, #%06x, #%06x, #%06x,\n", pal[0].toCSS() >> 8,
				        pal[1].toCSS() >> 8, pal[2].toCSS() >> 8, pal[3].toCSS() >> 8);
			}
			fputs("\t]\n", stderr);
		}
		fprintf(stderr,
		        "\tInput image slice: %" PRIu32 "x%" PRIu32 " pixels starting at (%" PRIi32
		        ", %" PRIi32 ")\n",
		        options.inputSlice.width, options.inputSlice.height, options.inputSlice.left,
		        options.inputSlice.top);
		fprintf(stderr, "\tBase tile IDs: [%" PRIu8 ", %" PRIu8 "]\n", options.baseTileIDs[0],
		        options.baseTileIDs[1]);
		fprintf(stderr, "\tMaximum %" PRIu16 " tiles in bank 0, %" PRIu16 " in bank 1\n",
		        options.maxNbTiles[0], options.maxNbTiles[1]);
		auto printPath = [](char const *name, std::string const &path) {
			if (!path.empty()) {
				fprintf(stderr, "\t%s: %s\n", name, path.c_str());
			}
		};
		printPath("Input image", options.input);
		printPath("Output tile data", options.output);
		printPath("Output tilemap", options.tilemap);
		printPath("Output attrmap", options.attrmap);
		printPath("Output palettes", options.palettes);
		fputs("Ready.\n", stderr);
	}

	if (options.input.empty()) {
		fatal("No input image specified");
	}

	// Do not do anything if option parsing went wrong
	if (nbErrors) {
		giveUp();
	}

	if (options.reverse()) {
		reverse();
	} else {
		process();
	}

	if (nbErrors) {
		giveUp();
	}
	return 0;
}

void Palette::addColor(uint16_t color) {
	for (size_t i = 0; true; ++i) {
		assert(i < colors.size()); // The packing should guarantee this
		if (colors[i] == color) { // The color is already present
			break;
		} else if (colors[i] == UINT16_MAX) { // Empty slot
			colors[i] = color;
			break;
		}
	}
}

/*
 * Returns the ID of the color in the palette, or `size()` if the color is not in
 */
uint8_t Palette::indexOf(uint16_t color) const {
	return std::find(colors.begin(), colors.end(), color) - colors.begin();
}

auto Palette::begin() -> decltype(colors)::iterator {
	// Skip the first slot if reserved for transparency
	return colors.begin() + options.hasTransparentPixels;
}
auto Palette::end() -> decltype(colors)::iterator {
	return std::find(begin(), colors.end(), UINT16_MAX);
}

auto Palette::begin() const -> decltype(colors)::const_iterator {
	// Skip the first slot if reserved for transparency
	return colors.begin() + options.hasTransparentPixels;
}
auto Palette::end() const -> decltype(colors)::const_iterator {
	return std::find(begin(), colors.end(), UINT16_MAX);
}

uint8_t Palette::size() const {
	return indexOf(UINT16_MAX);
}
