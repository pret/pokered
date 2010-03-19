pokered.gbc: pokered.asm
	rgbasm -o pokered.o pokered.asm
	rgblink -o pokered.gbc pokered.o
	rgbfix -jsv -k 01 -m 0x13 -p 0 -r 03 -t "POKEMON RED" pokered.gbc
	cmp baserom.gbc pokered.gbc

clean:
	rm -f pokered.o pokered.gbc
