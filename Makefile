pokered.gbc: pokered.o
	rgblink -o pokered.gbc pokered.o
	rgbfix -jsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "POKEMON RED" \
		pokered.gbc
	cmp baserom.gbc pokered.gbc

pokered.o: pokered1.asm constants.asm text/pokedex1.asm
	rgbasm -o pokered.o pokered1.asm

pokered1.asm: pokered.asm
	awk -f textpre.awk < pokered.asm > pokered1.asm

text/pokedex1.asm: text/pokedex.asm
	awk -f textpre.awk < text/pokedex.asm > text/pokedex1.asm

redrle: extras/redrle.c
	${CC} -o $@ $>

clean:
	rm -f text/pokedex1.asm pokered1.asm pokered.o pokered.gbc redrle
