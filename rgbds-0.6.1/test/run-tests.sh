#!/usr/bin/env bash

# Return failure as soon as a command fails to execute

set -e

cd "$(dirname "$0")"

# Refuse to run if RGBDS isn't present
if [[ ! ( -x ../rgbasm && -x ../rgblink && -x ../rgbfix && -x ../rgbgfx ) ]]; then
	echo "Please build RGBDS before running the tests"
	false
fi

# Tests included with the repository

for dir in asm link fix gfx; do
	pushd $dir
	./test.sh
	popd
done

# Test some significant external projects that use RGBDS
# When adding new ones, don't forget to add them to the .gitignore!
# When updating subprojects, change the commit being checked out, and set the `shallow-since`
# to the day before, to reduce the amount of refs being transferred and thus speed up CI.

test_downstream() { # owner/repo make-target
	if ! pushd ${1##*/}; then
		echo >&2 'Please run `fetch-test-deps.sh` before running the test suite'
		return 1
	fi
	make clean
	make -j4 $2 RGBDS=../../
	popd
}

test_downstream pret/pokecrystal compare
test_downstream pret/pokered     compare
test_downstream AntonioND/ucity  ''
