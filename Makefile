pokered.gbc: pokered.o
	rgblink -o pokered.gbc pokered.o
	rgbfix -jsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "POKEMON RED" \
		pokered.gbc
	cmp baserom.gbc pokered.gbc

pokered.o: pokered.asm constants.asm
	rgbasm -o pokered.o pokered.asm

redrle: extras/redrle.c
	${CC} -o $@ $>

clean:
	rm -f pokered.o pokered.gbc
