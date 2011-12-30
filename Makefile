.SUFFIXES: .asm .tx .o .gbc

TEXTFILES =	text/oakspeech.tx text/pokedex.tx text/mapRedsHouse1F.tx \
		text/mapBluesHouse.tx text/mapPalletTown.tx

all: pokered.gbc

pokered.o: pokered.tx constants.asm ${TEXTFILES}
	rgbasm -o pokered.o pokered.tx

redrle: extras/redrle.c
	${CC} -o $@ $>

.asm.tx:
	awk -f textpre.awk < $< > $@

.o.gbc:
	rgblink -o $@ $<
	rgbfix -jsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "POKEMON RED" $@
	cmp baserom.gbc $@

clean:
	rm -f pokered.tx pokered.o pokered.gbc redrle ${TEXTFILES}
