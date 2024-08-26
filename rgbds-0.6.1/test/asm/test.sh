#!/usr/bin/env bash

export LC_ALL=C

# Game Boy release date, 1989-04-21T12:34:56Z (for reproducible test results)
export SOURCE_DATE_EPOCH=609165296

o="$(mktemp)"
gb="$(mktemp)"
input="$(mktemp)"
output="$(mktemp)"
errput="$(mktemp)"
rc=0

trap "rm -f '$o' '$gb' '$input' '$output' '$errput'" EXIT

bold="$(tput bold)"
resbold="$(tput sgr0)"
red="$(tput setaf 1)"
green="$(tput setaf 2)"
orange="$(tput setaf 3)"
rescolors="$(tput op)"

RGBASM=../../rgbasm
RGBLINK=../../rgblink

tryDiff () {
	if ! diff -u --strip-trailing-cr "$1" "$2"; then
		echo "${bold}${red}${i%.asm}${variant}.$3 mismatch!${rescolors}${resbold}"
		false
	fi
}

tryCmp () {
	if ! cmp "$1" "$2"; then
		../../contrib/gbdiff.bash "$1" "$2"
		echo "${bold}${red}${i%.asm}${variant}.out.bin mismatch!${rescolors}${resbold}"
		false
	fi
}

# Add the version constants test, outputting the closest tag to the HEAD
if git describe --tags --abbrev=0 > version.out; then
	$RGBASM --version >> version.out
	cat > version.asm <<EOF
IF !DEF(__RGBDS_RC__)
	PRINTLN "v{d:__RGBDS_MAJOR__}.{d:__RGBDS_MINOR__}.{d:__RGBDS_PATCH__}"
ELSE
	PRINTLN "v{d:__RGBDS_MAJOR__}.{d:__RGBDS_MINOR__}.{d:__RGBDS_PATCH__}-rc{d:__RGBDS_RC__}"
ENDC
	PRINTLN "rgbasm {__RGBDS_VERSION__}"
EOF
else
	echo "${bold}${orange}Warning: cannot run version test!${rescolors}${resbold}"
	rm -f version.asm
fi

# Check whether to use '.simple.err' files if they exist
# (rgbasm with pre-3.0 Bison just reports "syntax error")
$RGBASM -Weverything -o $o syntax-error.asm > $output 2> $errput
simple_error=0
if ! diff --strip-trailing-cr syntax-error.err $errput; then
	echo "${bold}${orange}Warning: using .simple.err files when available.${rescolors}${resbold}"
	simple_error=1
fi

for i in *.asm; do
	flags=${i%.asm}.flags
	RGBASMFLAGS=-Weverything
	if [ -f $flags ]; then
		RGBASMFLAGS="$(head -n 1 "$flags")" # Allow other lines to serve as comments
	fi
	for variant in '' '.pipe'; do
		echo "${bold}${green}${i%.asm}${variant}...${rescolors}${resbold}"
		desired_errname=${i%.asm}.err
		if [ "$simple_error" -eq 1 ] && [ -e ${i%.asm}.simple.err ]; then
			desired_errname=${i%.asm}.simple.err
		fi
		if [ -z "$variant" ]; then
			$RGBASM $RGBASMFLAGS -o $o $i > $output 2> $errput
			desired_output=${i%.asm}.out
			desired_errput=$desired_errname
		else
			# `include-recursion.asm` refers to its own name inside the test code.
			# Skip testing with stdin input for that file.
			if [ "$i" = "include-recursion.asm" ]; then
				continue
			fi

			# Stop! This is not a Useless Use Of Cat. Using cat instead of
			# stdin redirection makes the input an unseekable pipe - a scenario
			# that's harder to deal with and was broken when the feature was
			# first implemented.
			cat $i | $RGBASM $RGBASMFLAGS -o $o - > $output 2> $errput

			# Use two otherwise unused files for temp storage
			desired_output=$input
			desired_errput=$gb
			# Escape regex metacharacters
			subst="$(printf '%s\n' "$i" | sed 's:[][\/.^$*]:\\&:g')"
			# Replace the file name with a dash to match changed output
			sed "s/$subst/<stdin>/g" ${i%.asm}.out > $desired_output
			sed "s/$subst/<stdin>/g" $desired_errname > $desired_errput
		fi

		tryDiff $desired_output $output out
		our_rc=$?
		tryDiff $desired_errput $errput err
		our_rc=$(($? || $our_rc))

		bin=${i%.asm}.out.bin
		if [ -f $bin ]; then
			$RGBLINK -o $gb $o
			dd if=$gb count=1 bs=$(printf %s $(wc -c < $bin)) > $output 2>/dev/null
			tryCmp $bin $output
			our_rc=$(($? || $our_rc))
		fi

		rc=$(($rc || $our_rc))
		if [ $our_rc -ne 0 ]; then break; fi
	done
done

exit $rc
