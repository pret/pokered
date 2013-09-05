.SUFFIXES: .asm .tx .o .gbc

TEXTFILES := $(shell find ./ -type f -name '*.asm')

all: pokered.gbc

pokered.o: pokered.tx main.tx constants.tx music.tx wram.tx ${TEXTFILES:.asm=.tx}
	rgbasm -o pokered.o pokered.tx
	
pokeblue.o: pokeblue.tx main.tx constants.tx music.tx wram.tx ${TEXTFILES:.asm=.tx}
	rgbasm -o pokeblue.o pokeblue.tx

redrle: extras/redtools/redrle.c
	${CC} -o $@ $>

.asm.tx:
	python textpre.py < $< > $@

pokered.gbc: pokered.o
	rgblink -o $@ $*.o
	rgbfix -jsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "POKEMON RED" $@
	cmp baserom.gbc $@
	
pokeblue.gbc: pokeblue.o
	rgblink -o $@ $*.o
	rgbfix -jsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "POKEMON BLUE" $@
	cmp blue.gbc $@

clean:
	rm -f pokered.o pokered.gbc pokeblue.o pokeblue.gbc redrle $(TEXTFILES:.asm=.tx)

more: pokered.gbc pokeblue.gbc
