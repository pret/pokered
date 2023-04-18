	db DEX_KOKANA ; pokedex id

	db  40,  35,  30,  45,  25
	;   hp  atk  def  spd  spc

	db BUG, BUG ; type
	db 255 ; catch rate
	db 54 ; base exp

	INCBIN "gfx/pokemon/front/kokana.pic", 0, 1 ; sprite dimensions
	dw KokanaPicFront, KokanaPicBack

	db LEECH_LIFE, STRING_SHOT, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm
	; end

	db BANK(KokanaPicFront)
	assert BANK(KokanaPicFront) == BANK(KokanaPicBack)
