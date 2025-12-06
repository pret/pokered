	db DEX_MELTAN ; pokedex id

	db  46,  65,  65,  34,  55
	;   hp  atk  def  spd  spc

	db STEEL, STEEL ; type
	db 255 ; catch rate
	db 53 ; base exp

	INCBIN "gfx/pokemon/front/meltan.pic", 0, 1 ; sprite dimensions
	dw MeltanPicFront, MeltanPicBack

    db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; note: starting learnsets are part of regular learnsets
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm
	; end

	db BANK(MeltanPicFront)
	assert BANK(MeltanPicFront) == BANK(MeltanPicBack)
