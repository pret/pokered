	db DEX_METAPOD ; pokedex id

	db  50,  20,  55,  30,  25
	;   hp  atk  def  spd  spc

	db BUG, BUG ; type
	db 120 ; catch rate
	db 72 ; base exp

	INCBIN "gfx/pokemon/front/metapod.pic", 0, 1 ; sprite dimensions
	dw MetapodPicFront, MetapodPicBackSW

	db HARDEN, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
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

	dw BANK(MetapodPicFront), BANK(MetapodPicBack)

	dw 0000, MetapodPicBack
