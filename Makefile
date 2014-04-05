PYTHON := python

.SUFFIXES:
.SUFFIXES: .asm .tx .o .gbc
.PHONY: all clean red blue compare pngs
.PRECIOUS: %.2bpp
.SECONDEXPANSION:

POKEMONTOOLS := extras/pokemontools
GFX          := $(PYTHON) $(POKEMONTOOLS)/gfx.py
PIC          := $(PYTHON) $(POKEMONTOOLS)/pic.py
INCLUDES     := $(PYTHON) $(POKEMONTOOLS)/scan_includes.py
PREPROCESS   := $(PYTHON) prequeue.py

TEXTQUEUE :=

RED_OBJS  := \
pokered.o \
audio_red.o \
wram.o \
text.o

BLUE_OBJS := \
pokeblue.o \
audio_blue.o \
wram.o \
text.o

OBJS := $(RED_OBJS) $(BLUE_OBJS)
OBJS := $(sort $(OBJS))

ROMS := pokered.gbc pokeblue.gbc

# object dependencies
$(shell $(foreach obj, $(OBJS), $(eval $(obj:.o=)_DEPENDENCIES := $(shell $(INCLUDES) $(obj:.o=.asm)))))

all: $(ROMS)
red:  pokered.gbc
blue: pokeblue.gbc
compare:
	@md5sum -c --quiet roms.md5
clean:
	rm -f $(ROMS)
	rm -f $(OBJS)
	find .   -iname '*.tx'      -exec rm {} +
	find gfx -iname '*.[12]bpp' -exec rm {} +
	find pic -iname '*.pic'     -exec rm {} +
	find pic -iname '*.2bpp'    -exec rm {} +
	rm -f redrle


redrle: extras/redtools/redrle.c
	${CC} -o $@ $<


%.asm: ;
.asm.tx:
	$(eval TEXTQUEUE += $<)
	@rm -f $@

$(OBJS): $$*.tx $$(patsubst %.asm, %.tx, $$($$*_DEPENDENCIES))
	@$(PREPROCESS) $(TEXTQUEUE)
	@$(eval TEXTQUEUE :=)
	@$(GFX) 2bpp $(2BPPQUEUE)
	@$(eval 2BPPQUEUE :=)
	@$(GFX) 1bpp $(1BPPQUEUE)
	@$(eval 1BPPQUEUE :=)
	@$(PIC) compress $(PICQUEUE)
	@$(eval PICQUEUE  :=)
	rgbasm -o $@ $*.tx


OPTIONS = -jsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03

pokered.gbc: $(RED_OBJS)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix $(OPTIONS) -t "POKEMON RED" $@

pokeblue.gbc: $(BLUE_OBJS)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix $(OPTIONS) -t "POKEMON BLUE" $@


%.2bpp: %.png
	$(eval 2BPPQUEUE += $<)
	@rm -f $@
%.1bpp: %.png
	$(eval 1BPPQUEUE += $<)
	@rm -f $@
%.pic: %.2bpp
	$(eval PICQUEUE  += $<)
	@rm -f $@


