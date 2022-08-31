	db DEX_ANIMON ; pokedex id

	db 100,  55,  50,  150,  50
	;   hp  atk  def  spd  spc

	db STEEL, STEEL ; type
	db 35 ; catch rate
	db 161 ; base exp

	INCBIN "gfx/pokemon/front/animon.pic", 0, 1 ; sprite dimensions
	dw AnimonPicFront, AnimonPicBack

	db TRANSFORM, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm
	; end

	db BANK(AnimonPicFront)
	assert BANK(AnimonPicFront) == BANK(AnimonPicBack)
