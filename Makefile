#gawk sort order
#LC_CTYPE=C
export LC_CTYPE=C

.SUFFIXES: .asm .tx .o .gbc

TEXTFILES =	text/oakspeech.tx text/pokedex.tx text/mapRedsHouse1F.tx \
		text/mapBluesHouse.tx text/mapPalletTown.tx

all: pokered.gbc

pokered.o: pokered.asm common.tx constants.asm ${TEXTFILES}
	rgbasm -o pokered.o pokered.asm
	
pokeblue.o: pokeblue.asm common.tx constants.asm ${TEXTFILES}
	rgbasm -o pokeblue.o pokeblue.asm

redrle: extras/redrle.c
	${CC} -o $@ $>

.asm.tx:
	awk -f textpre.awk < $< > $@

pokered.gbc: pokered.o
	rgblink -o $@ $<
	rgbfix -jsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "POKEMON RED" $@
	cmp baserom.gbc $@
	
pokeblue.gbc: pokeblue.o
	rgblink -o $@ $<
	rgbfix -jsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "POKEMON BLUE" $@

clean:
	rm -f common.tx pokered.o pokered.gbc pokeblue.o pokeblue.gbc redrle ${TEXTFILES}

more: pokered.gbc pokeblue.gbc
