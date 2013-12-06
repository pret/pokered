PYTHON := python
.SUFFIXES: .asm .tx .o .gbc
.PHONY: all clean red blue
.SECONDEXPANSION:


RED_OBJS  := pokered.o
BLUE_OBJS := pokeblue.o

OBJS := $(RED_OBJS) $(BLUE_OBJS)

ROMS := pokered.gbc pokeblue.gbc

# generate dependencies for each object
$(shell $(foreach obj, $(OBJS), \
	$(eval $(obj:.o=)_DEPENDENCIES := $(shell $(PYTHON) extras/pokemontools/scan_includes.py $(obj:.o=.asm))) \
))


all: $(ROMS)
red:  pokered.gbc
blue: pokeblue.gbc

redrle: extras/redtools/redrle.c
	${CC} -o $@ $>

clean:
	rm -f $(ROMS)
	rm -f $(OBJS)
	find -iname '*.tx' -delete
	rm -f redrle


baserom.gbc: ;
	@echo "Wait! Need baserom.gbc first. Check README and INSTALL for details." && false

%.asm: ;

.asm.tx:
	$(PYTHON) preprocessor.py < $< > $@

$(OBJS): $$*.tx $$(patsubst %.asm, %.tx, $$($$*_DEPENDENCIES))
	rgbasm -o $@ $(@:.o=.tx)

pokered.gbc: $(RED_OBJS)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix -jsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "POKEMON RED" $@
	cmp baserom.gbc $@

pokeblue.gbc: $(BLUE_OBJS)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix -jsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "POKEMON BLUE" $@
	cmp blue.gbc $@

