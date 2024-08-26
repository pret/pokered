#!/bin/bash

# SPDX-License-Identifier: MIT
#
# Copyright (c) 2021 Rangi
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

declare -A FILES
while read -r -d '' file; do
	FILES["$file"]="true"
done < <(git diff --name-only -z "$1" HEAD)

edited () {
	${FILES["$1"]:-"false"}
}

dependency () {
	if edited "$1" && ! edited "$2"; then
		echo "'$1' was modified, but not '$2'! $3" | xargs
	fi
}

# Pull requests that edit the first file without the second may be correct,
# but are suspicious enough to require review.

dependency include/linkdefs.h    man/rgbds.5 \
           "Was the object file format changed?"

dependency src/asm/parser.y      man/rgbasm.5 \
           "Was the rgbasm grammar changed?"

dependency include/asm/warning.h man/rgbasm.1 \
           "Were the rgbasm warnings changed?"

dependency src/asm/object.c      include/linkdefs.h \
           "Should the object file revision be bumped?"
dependency src/link/object.c     include/linkdefs.h \
           "Should the object file revision be bumped?"

dependency Makefile              CMakeLists.txt \
           "Did the build process change?"
dependency Makefile              src/CMakeLists.txt \
           "Did the build process change?"

dependency src/asm/main.c        man/rgbasm.1 \
           "Did the rgbasm CLI change?"
dependency src/asm/main.c        contrib/zsh_compl/_rgbasm \
           "Did the rgbasm CLI change?"
dependency src/asm/main.c        contrib/bash_compl/_rgbasm.bash \
           "Did the rgbasm CLI change?"
dependency src/link/main.c       man/rgblink.1 \
           "Did the rgblink CLI change?"
dependency src/link/main.c       contrib/zsh_compl/_rgblink \
           "Did the rgblink CLI change?"
dependency src/link/main.c        contrib/bash_compl/_rgblink.bash \
           "Did the rgblink CLI change?"
dependency src/fix/main.c        man/rgbfix.1 \
           "Did the rgbfix CLI change?"
dependency src/fix/main.c        contrib/zsh_compl/_rgbfix \
           "Did the rgbfix CLI change?"
dependency src/fix/main.c        contrib/bash_compl/_rgbfix.bash \
           "Did the rgbfix CLI change?"
dependency src/gfx/main.cpp      man/rgbgfx.1 \
           "Did the rgbgfx CLI change?"
dependency src/gfx/main.cpp      contrib/zsh_compl/_rgbgfx \
           "Did the rgbgfx CLI change?"
dependency src/gfx/main.cpp      contrib/bash_compl/_rgbgfx.bash \
           "Did the rgbgfx CLI change?"
