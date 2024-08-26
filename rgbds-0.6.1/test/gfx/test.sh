#!/usr/bin/env bash

[[ -e ./rgbgfx_test ]] || make -C ../.. test/gfx/rgbgfx_test || exit
[[ -e ./randtilegen ]] || make -C ../.. test/gfx/randtilegen || exit

trap 'rm -f "$errtmp"' EXIT
errtmp="$(mktemp)"

bold="$(tput bold)"
resbold="$(tput sgr0)"
red="$(tput setaf 1)"
green="$(tput setaf 2)"
rescolors="$(tput op)"

RGBGFX=../../rgbgfx

rc=0
new_test() {
	cmdline="$*"
	echo "$bold${green}Testing: $cmdline$rescolors$resbold" >&2
}
test() {
	eval "$cmdline"
}
fail() {
	rc=1
	echo "$bold${red}Test $cmdline failed!${1:+ (RC=$1)}$rescolors$resbold"
}


# Draw a random tile offset and VRA0 size
# Neither should change anything to how the image is displayed
while [[ "$ofs" -eq 0 ]]; do (( ofs = RANDOM % 256 )); done
while [[ "$size" -eq 0 ]]; do (( size = RANDOM % 256 )); done
for f in *.bin; do
	for flags in ""{," -b $ofs"}{," -N $size,256"}; do
		new_test ./rgbgfx_test "$f" $flags
		test || fail $?
	done
done

# Remove temporaries (also ignored by Git) created by the above tests
rm -f out*.png result.png

for f in *.png; do
	flags="$([[ -e "${f%.png}.flags" ]] && echo "@${f%.png}.flags")"

	new_test "$RGBGFX" $flags "$f"
	if [[ -e "${f%.png}.err" ]]; then
		test 2>"$errtmp"
		diff -u --strip-trailing-cr "${f%.png}.err" "$errtmp" || fail
	else
		test || fail $?
	fi

	new_test "$RGBGFX" $flags - "<$f"
	if [[ -e "${f%.png}.err" ]]; then
		test 2>"$errtmp"
		diff -u --strip-trailing-cr <(sed "s/$f/<stdin>/g" "${f%.png}.err") "$errtmp" || fail
	else
		test || fail $?
	fi
done

exit $rc
