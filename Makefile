PYTHON := python
.SUFFIXES: .asm .tx .o .gbc
.PHONY: all clean red blue compare
.SECONDEXPANSION:


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

# generate dependencies for each object
$(shell $(foreach obj, $(OBJS), \
	$(eval $(obj:.o=)_DEPENDENCIES := $(shell $(PYTHON) extras/pokemontools/scan_includes.py $(obj:.o=.asm))) \
	$(eval ALL_DEPENDENCIES += $($(obj:.o=)_DEPENDENCIES)) \
))

all: $(ROMS)
red:  pokered.gbc
blue: pokeblue.gbc
compare: baserom.gbc pokered.gbc
	cmp $^

redrle: extras/redtools/redrle.c
	${CC} -o $@ $>

clean:
	rm -f $(ROMS)
	rm -f $(OBJS)
	find . -iname '*.tx' -exec rm {} +
	rm -f redrle


baserom.gbc: ;
	@echo "Wait! Need baserom.gbc first. Check README for details." && false

%.asm: ;
.asm.tx:
	$(eval TEXTQUEUE += $<)
	@rm -f $@

$(OBJS): $$*.tx $$(patsubst %.asm, %.tx, $$($$*_DEPENDENCIES))
	@$(PYTHON) prequeue.py $(TEXTQUEUE)
	@$(eval TEXTQUEUE :=)
	rgbasm -o $@ $*.tx

pokered.gbc: $(RED_OBJS)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix -jsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "POKEMON RED" $@

pokeblue.gbc: $(BLUE_OBJS)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix -jsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "POKEMON BLUE" $@

