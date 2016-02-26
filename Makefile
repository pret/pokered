PYTHON := python
MD5 := md5sum -c --quiet

2bpp     := $(PYTHON) extras/pokemontools/gfx.py 2bpp
1bpp     := $(PYTHON) extras/pokemontools/gfx.py 1bpp
pic      := $(PYTHON) extras/pokemontools/pic.py compress
includes := $(PYTHON) extras/pokemontools/scan_includes.py

base_obj := \
	audio.o \
	main.o \
	text.o \
	wram.o

red_obj := $(base_obj:.o=_red.o)
blue_obj := $(base_obj:.o=_blue.o)
all_obj := $(red_obj) $(blue_obj)

$(foreach obj, $(base_obj:.o=), \
	$(eval $(obj)_dep := $(shell $(includes) $(obj).asm)) \
)

.SUFFIXES:
.SUFFIXES: .asm .o .gbc .png .2bpp .1bpp .pic
.SECONDEXPANSION:
# Suppress annoying intermediate file deletion messages.
.PRECIOUS: %.2bpp
.PHONY: all clean red blue compare

roms := pokered.gbc pokeblue.gbc

all: $(roms)
red: pokered.gbc
blue: pokeblue.gbc

# For contributors to make sure a change didn't affect the contents of the rom.
compare: red blue
	@$(MD5) roms.md5

clean:
	rm -f $(roms) $(all_obj) $(roms:.gbc=.sym)
	find . \( -iname '*.1bpp' -o -iname '*.2bpp' -o -iname '*.pic' \) -exec rm {} +

%.asm: ;
$(red_obj): %_red.o: %.asm $$(%_dep)
	rgbasm -D "_RED" -h -o $@ $*.asm
$(blue_obj): %_blue.o: %.asm $$(%_dep)
	rgbasm -D "_BLUE" -h -o $@ $*.asm

dmg_opt  = -jsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03
red_opt  = $(dmg_opt) -t "POKEMON RED"
blue_opt = $(dmg_opt) -t "POKEMON BLUE"

poke%.gbc: $$(%_obj)
	rgblink -n poke$*.sym -o $@ $^
	rgbfix $($*_opt) $@

%.png:  ;
%.2bpp: %.png  ; @$(2bpp) $<
%.1bpp: %.png  ; @$(1bpp) $<
%.pic:  %.2bpp ; @$(pic)  $<
