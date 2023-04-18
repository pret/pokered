	db DEX_KASANAGI ; pokedex id

	db  45,  20,  50,  40,  30
	;   hp  atk  def  spd  spc

	db BUG, BUG ; type
	db 120 ; catch rate
	db 73 ; base exp

	INCBIN "gfx/pokemon/front/kasanagi.pic", 0, 1 ; sprite dimensions
	dw KasanagiPicFront, KasanagiPicBack

	db HARDEN, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm
	; end

	db BANK(KasanagiPicFront)
	assert BANK(KasanagiPicFront) == BANK(KasanagiPicBack)
