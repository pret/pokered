roms := pokered.gbc pokeblue.gbc pokeblue_debug.gbc pokerot.gbc pokeblau.gbc
roms_en := pokered.gbc pokeblue.gbc
roms_de := pokerot.gbc pokeblau.gbc

rom_obj := \
audio.o \
home.o \
main.o \
maps.o \
text.o \
wram.o \
gfx/pics.o \
gfx/sprites.o \
gfx/tilesets.o

rom_obj_de := \
audio.o \
home.o \
main.o \
maps.o \
version/pokerot/text.o \
wram.o \
gfx/pics.o \
gfx/sprites.o \
gfx/tilesets.o

pokered_obj        := $(rom_obj:.o=_red.o)
pokeblue_obj       := $(rom_obj:.o=_blue.o)
pokeblue_debug_obj := $(rom_obj:.o=_blue_debug.o)
pokerot_obj        := $(rom_obj_de:.o=_rot.o)
pokeblau_obj       := $(rom_obj_de:.o=_blau.o)


### Build tools

ifeq (,$(shell which sha1sum))
SHA1 := shasum
else
SHA1 := sha1sum
endif

RGBDS ?=
RGBASM  ?= $(RGBDS)rgbasm
RGBFIX  ?= $(RGBDS)rgbfix
RGBGFX  ?= $(RGBDS)rgbgfx
RGBLINK ?= $(RGBDS)rgblink


### Build targets

.SUFFIXES:
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:
.PHONY: all english german red blue rot blau blue_debug clean tidy compare tools

all: $(roms)
english: $(roms_en)
german: $(roms_de)
red:        pokered.gbc
blue:       pokeblue.gbc
blue_debug: pokeblue_debug.gbc
rot:        pokerot.gbc
blau:       pokeblau.gbc

clean: tidy
	find gfx \( -iname '*.1bpp' -o -iname '*.2bpp' -o -iname '*.pic' \) -delete
	find version/pokerot/gfx \( -iname '*.1bpp' -o -iname '*.2bpp' -o -iname '*.pic' \) -delete

tidy:
	rm -f $(roms) $(pokered_obj) $(pokeblue_obj) $(pokeblue_debug_obj) $(pokerot_obj) $(pokeblau_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym) rgbdscheck.o
	$(MAKE) clean -C tools/

compare: $(roms)
	@$(SHA1) -c roms.sha1

tools:
	$(MAKE) -C tools/


RGBASMFLAGS = -h -L -Weverything
# Create a sym/map for debug purposes if `make` run with `DEBUG=1`
ifeq ($(DEBUG),1)
RGBASMFLAGS += -E
endif

$(pokered_obj):        RGBASMFLAGS += -D _RED -D _ENGLISH
$(pokeblue_obj):       RGBASMFLAGS += -D _BLUE -D _ENGLISH
$(pokeblue_debug_obj): RGBASMFLAGS += -D _BLUE -D _ENGLISH -D _DEBUG
$(pokerot_obj):        RGBASMFLAGS += -D _RED -D _GERMAN
$(pokeblau_obj):       RGBASMFLAGS += -D _BLUE -D _GERMAN

rgbdscheck.o: rgbdscheck.asm
	$(RGBASM) -o $@ $<

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
define DEP
$1: $2 $$(shell tools/scan_includes $2) | rgbdscheck.o
	$$(RGBASM) $$(RGBASMFLAGS) -o $$@ $$<
endef

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tidy tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))

# Dependencies for objects (drop _red and _blue from asm file basenames)
$(foreach obj, $(pokered_obj), $(eval $(call DEP,$(obj),$(obj:_red.o=.asm))))
$(foreach obj, $(pokeblue_obj), $(eval $(call DEP,$(obj),$(obj:_blue.o=.asm))))
$(foreach obj, $(pokeblue_debug_obj), $(eval $(call DEP,$(obj),$(obj:_blue_debug.o=.asm))))
$(foreach obj, $(pokerot_obj), $(eval $(call DEP,$(obj),$(obj:_rot.o=.asm))))
$(foreach obj, $(pokeblau_obj), $(eval $(call DEP,$(obj),$(obj:_blau.o=.asm))))

endif


%.asm: ;


pokered_pad        = 0x00
pokeblue_pad       = 0x00
pokeblue_debug_pad = 0xff
pokerot_pad        = 0x00
pokeblau_pad       = 0x00

pokered_opt        = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON RED"
pokeblue_opt       = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON BLUE"
pokeblue_debug_opt = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON BLUE"
pokerot_opt        = -jsv -n 0 -k 01 -l 0x33 -m 0x1B -r 03 -t "POKEMON RED"
pokeblau_opt       = -jsv -n 0 -k 01 -l 0x33 -m 0x1B -r 03 -t "POKEMON BLUE"

%.gbc: $$(%_obj) layout.link
	$(RGBLINK) -p $($*_pad) -d -m $*.map -n $*.sym -l layout.link -o $@ $(filter %.o,$^)
	$(RGBFIX) -p $($*_pad) $($*_opt) $@


### Misc file-specific graphics rules

gfx/battle/attack_anim_1.2bpp: tools/gfx += --trim-whitespace
gfx/battle/attack_anim_2.2bpp: tools/gfx += --trim-whitespace

gfx/intro_credits/blue_jigglypuff_1.2bpp: rgbgfx += -h
gfx/intro_credits/blue_jigglypuff_2.2bpp: rgbgfx += -h
gfx/intro_credits/blue_jigglypuff_3.2bpp: rgbgfx += -h
gfx/intro_credits/red_nidorino_1.2bpp: rgbgfx += -h
gfx/intro_credits/red_nidorino_2.2bpp: rgbgfx += -h
gfx/intro_credits/red_nidorino_3.2bpp: rgbgfx += -h
gfx/intro_credits/gengar.2bpp: rgbgfx += -h
gfx/intro_credits/gengar.2bpp: tools/gfx += --remove-duplicates --preserve=0x19,0x76

gfx/intro_credits/the_end.2bpp: tools/gfx += --interleave --png=$<

gfx/slots/red_slots_1.2bpp: tools/gfx += --trim-whitespace
gfx/slots/blue_slots_1.2bpp: tools/gfx += --trim-whitespace
version/pokerot/gfx/slots/red_slots_1.2bpp: tools/gfx += --trim-whitespace
version/pokerot/gfx/slots/blue_slots_1.2bpp: tools/gfx += --trim-whitespace

gfx/tilesets/%.2bpp: tools/gfx += --trim-whitespace
version/pokerot/gfx/tilesets/%.2bpp: tools/gfx += --trim-whitespace
gfx/tilesets/reds_house.2bpp: tools/gfx += --preserve=0x48

gfx/trade/game_boy.2bpp: tools/gfx += --remove-duplicates


### Catch-all graphics rules

%.png: ;

%.2bpp: %.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

%.1bpp: %.png
	$(RGBGFX) $(rgbgfx) -d1 -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -d1 -o $@ $@)

%.pic: %.2bpp
	tools/pkmncompress $< $@
