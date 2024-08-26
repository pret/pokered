#!/bin/bash
set -e

case "${1%-*}" in
	ubuntu)
		sudo apt-get -qq update
		sudo apt-get install -yq bison libpng-dev pkg-config
		;;
	macos)
		brew install bison libpng pkg-config md5sha1sum
		# For the version check below exclusively, re-do this before building
		export PATH="/usr/local/opt/bison/bin:$PATH"
		;;
	*)
		echo "WARNING: Cannot install deps for OS '$1'"
		;;
esac

bison --version
make --version
cmake --version
