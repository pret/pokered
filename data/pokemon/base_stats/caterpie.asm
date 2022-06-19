	db DEX_CATERPIE ; pokedex id

	db  45,  30,  35,  45,  20
	;   hp  atk  def  spd  spc

	db BUG, BUG ; type
	db 255 ; catch rate
	db 53 ; base exp

	INCBIN "gfx/pokemon/front/caterpie.pic", 0, 1 ; sprite dimensions
	dw CaterpiePicFront, CaterpiePicBackSW

	db TACKLE, STRING_SHOT, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	DOUBLE_EDGE,\
	BARRIER,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	LIGHT_SCREEN,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	;end

	dw BANK(CaterpiePicFront), BANK(CaterpiePicBack)

	dw 0000, CaterpiePicBack