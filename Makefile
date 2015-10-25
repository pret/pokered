# python 2.7
PYTHON := python

# md5sum -c is used to compare rom hashes. The options may vary across platforms.
MD5 := md5sum -c --quiet


# Clear the default suffixes.
.SUFFIXES:
.SUFFIXES: .asm .o .gbc .png .2bpp .1bpp .pic

# Secondary expansion is required for dependency variables in object rules.
.SECONDEXPANSION:

# Suppress annoying intermediate file deletion messages.
.PRECIOUS: %.2bpp

.PHONY: all clean red blue compare


poketools := extras/pokemontools
gfx       := $(PYTHON) $(poketools)/gfx.py
2bpp      := $(gfx) 2bpp
1bpp      := $(gfx) 1bpp
pic       := $(PYTHON) $(poketools)/pic.py compress
includes  := $(PYTHON) $(poketools)/scan_includes.py

versions := red blue

# Collect file dependencies for objects in red/ and blue/.
$(foreach ver, $(versions), \
	$(eval $(ver)_asm := $(shell find $(ver) -iname '*.asm')) \
	$(eval $(ver)_obj := $($(ver)_asm:.asm=.o)) \
	$(eval all_obj += $($(ver)_obj)) \
)
$(foreach obj, $(all_obj), \
	$(eval $(obj:.o=)_dep := $(shell $(includes) $(obj:.o=.asm))) \
)


roms := pokered.gbc pokeblue.gbc

all:    $(roms)
red:    pokered.gbc
blue:   pokeblue.gbc

# For contributors to make sure a change didn't affect the contents of the rom.
compare: red blue
	@$(MD5) roms.md5

clean:
	rm -f $(roms) $(all_obj) $(roms:.gbc=.sym)
	find . \( -iname '*.1bpp' -o -iname '*.2bpp' -o -iname '*.pic' \) -exec rm {} +


# Don't fix halts.
asm_opt = -h

# Make a symfile for debugging.
link_opt = -n poke$*.sym

# Header options for rgbfix.
dmg_opt  = -jsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03
red_opt  = $(dmg_opt) -t "POKEMON RED"
blue_opt = $(dmg_opt) -t "POKEMON BLUE"


%.png:  ;
%.2bpp: %.png  ; @$(2bpp) $<
%.1bpp: %.png  ; @$(1bpp) $<
%.pic:  %.2bpp ; @$(pic)  $<

# Assemble source files into objects.
$(all_obj): $$*.asm $$($$*_dep)
	rgbasm $(asm_opt) -o $@ $*.asm

# Link objects to produce a rom.
poke%.gbc: $$(%_obj)
	rgblink $(link_opt) -o $@ $^
	rgbfix $($*_opt) $@
