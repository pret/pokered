	db DEX_DITTO ; pokedex id

	db  48,  48,  48,  48,  48
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 35 ; catch rate
	db 61 ; base exp

	INCBIN "gfx/pokemon/front/ditto.pic", 0, 1 ; sprite dimensions
	dw DittoPicFront, DittoPicBack

    db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; note: starting learnsets are part of regular learnsets
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm
	; end

	db BANK(DittoPicFront)
	assert BANK(DittoPicFront) == BANK(DittoPicBack)
