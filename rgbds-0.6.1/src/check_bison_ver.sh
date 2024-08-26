#!/usr/bin/env bash
bison -V | awk -v major="$1" -v minor="$2" '
/^bison.*[0-9]+(\.[0-9]+)(\.[0-9]+)?$/ {
	match($0, /[0-9]+(\.[0-9]+)(\.[0-9]+)?$/);
	split(substr($0, RSTART), ver, ".");
	if (ver[1] == major && ver[2] >= minor) { exit 0 } else { exit 1 }
}'
