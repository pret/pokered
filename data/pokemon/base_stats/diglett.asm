	db DEX_DIGLETT ; pokedex id

	db  10,  55,  25,  95,  45
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 255 ; catch rate
	db 81 ; base exp

	INCBIN "gfx/pokemon/front/diglett.pic", 0, 1 ; sprite dimensions
	dw DiglettPicFront, DiglettPicBackSW

	db SCRATCH, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	EARTHQUAKE,\
	DIG,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\
	KARATE_CHOP,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH
	; end


	dw BANK(DiglettPicFront), BANK(DiglettPicBack)

	dw 0000, DiglettPicBack
