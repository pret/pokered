PYTHON := python
MD5    := md5sum -c --quiet

.SUFFIXES:
.SUFFIXES: .asm .tx .o .gbc
.PHONY: all clean red blue yellow compare
.PRECIOUS: %.2bpp
.SECONDEXPANSION:

poketools := extras/pokemontools
gfx       := $(PYTHON) $(poketools)/gfx.py
pic       := $(PYTHON) $(poketools)/pic.py
includes  := $(PYTHON) $(poketools)/scan_includes.py
pre       := $(PYTHON) prequeue.py


versions := red blue yellow

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
yellow: pokeyellow.gbc

compare:
	@$(MD5) roms.md5
clean:
	rm -f $(roms) $(all_obj)
	find . \( -iname '*.tx' -o -iname '*.1bpp' -o -iname '*.2bpp' -o -iname '*.pic' \) -exec rm {} +


%.asm: ;
%.tx: %.asm
	$(eval txq += $<)
	@rm -f $@

$(all_obj): $$*.tx $$(patsubst %.asm, %.tx, $$($$*_dep))
	@$(pre) $(txq);           $(eval txq   :=)
	@$(gfx) 2bpp $(2bppq);    $(eval 2bppq :=)
	@$(gfx) 1bpp $(1bppq);    $(eval 1bppq :=)
	@$(pic) compress $(picq); $(eval picq  :=)
	rgbasm -h -o $@ $*.tx


link    = rgblink -n $*.sym -m $*.map
dmg_opt :=  -jsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03
cgb_opt := -cjsv -k 01 -l 0x33 -m 0x1b -p 0 -r 03

pokered.gbc: $(red_obj)
	$(link) -o $@ $^
	rgbfix $(dmg_opt) -t "POKEMON RED" $@

pokeblue.gbc: $(blue_obj)
	$(link) -o $@ $^
	rgbfix $(dmg_opt) -t "POKEMON BLUE" $@

pokeyellow.gbc: $(yellow_obj)
	$(link) -o $@ $^
	rgbfix $(cgb_opt) -t "POKEMON YELLOW" $@


%.2bpp: %.png
	$(eval 2bppq += $<)
	@rm -f $@
%.1bpp: %.png
	$(eval 1bppq += $<)
	@rm -f $@
%.pic:  %.2bpp
	$(eval picq  += $<)
	@rm -f $@
