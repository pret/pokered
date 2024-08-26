#!/usr/bin/env bash
fname=$(mktemp)

for i in *.asm; do
	../../rgbasm $i >$fname 2>&1
	mv -f $fname ${i%.asm}.out
done

rm -f $fname
exit 0
