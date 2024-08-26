/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2022, Eldred Habert and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#ifndef RGBDS_FILE_HPP
#define RGBDS_FILE_HPP

#include <array>
#include <assert.h>
#include <cassert>
#include <fcntl.h>
#include <fstream>
#include <ios>
#include <iostream>
#include <streambuf>
#include <string>
#include <string.h>
#include <string_view>
#include <variant>

#include "helpers.h"
#include "platform.h"

#include "gfx/main.hpp"

// Convenience feature for visiting the below.
template<typename... Ts>
struct Visitor : Ts... {
	using Ts::operator()...;
};
template<typename... Ts>
Visitor(Ts...) -> Visitor<Ts...>;

class File {
	// Construct a `std::streambuf *` by default, since it's probably lighter than a `filebuf`.
	std::variant<std::streambuf *, std::filebuf> _file;

public:
	File() {}
	~File() { close(); }

	/**
	 * This should only be called once, and before doing any `->` operations.
	 * Returns `nullptr` on error, and a non-null pointer otherwise.
	 */
	File *open(std::string const &path, std::ios_base::openmode mode) {
		if (path != "-") {
			return _file.emplace<std::filebuf>().open(path, mode) ? this : nullptr;
		} else if (mode & std::ios_base::in) {
			assert(!(mode & std::ios_base::out));
			_file.emplace<std::streambuf *>(std::cin.rdbuf());
			if (setmode(STDIN_FILENO, mode & std::ios_base::binary ? O_BINARY : O_TEXT) == -1) {
				fatal("Failed to set stdin to %s mode: %s",
				      mode & std::ios_base::binary ? "binary" : "text", strerror(errno));
			}
		} else {
			assert(mode & std::ios_base::out);
			_file.emplace<std::streambuf *>(std::cout.rdbuf());
		}
		return this;
	}
	std::streambuf &operator*() {
		return std::visit(Visitor{[](std::filebuf &file) -> std::streambuf & { return file; },
		                          [](std::streambuf *buf) -> std::streambuf & { return *buf; }},
		                  _file);
	}
	std::streambuf const &operator*() const {
		// The non-`const` version does not perform any modifications, so it's okay.
		return **const_cast<File *>(this);
	}
	std::streambuf *operator->() { return &**this; }
	std::streambuf const *operator->() const {
		// See the `operator*` equivalent.
		return const_cast<File *>(this)->operator->();
	}

	File *close() {
		return std::visit(Visitor{[this](std::filebuf &file) {
			                          // This is called by the destructor, and an explicit `close`
			                          // shouldn't close twice.
			                          _file.emplace<std::streambuf *>(nullptr);
			                          return file.close() != nullptr;
		                          },
		                          [](std::streambuf *buf) { return buf != nullptr; }},
		                  _file)
		           ? this
		           : nullptr;
	}

	char const *c_str(std::string const &path) const {
		return std::visit(Visitor{[&path](std::filebuf const &) { return path.c_str(); },
		                          [](std::streambuf const *buf) {
			                          return buf == std::cin.rdbuf() ? "<stdin>" : "<stdout>";
		                          }},
		                  _file);
	}
};

#endif // RGBDS_FILE_HPP
