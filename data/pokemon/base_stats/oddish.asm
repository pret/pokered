	db DEX_ODDISH ; pokedex id

	db  45,  50,  55,  30,  75
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 255 ; catch rate
	db 78 ; base exp

	INCBIN "gfx/pokemon/front/oddish.pic", 0, 1 ; sprite dimensions
	dw OddishPicFront, OddishPicBackSW

	db ABSORB, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEECH_SEED,\
	TOXIC,\
	DOUBLE_EDGE,\
	AMNESIA,\
	BARRIER,\
	RAZOR_LEAF,\
	SOLARBEAM,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	SLAM,\
	LIGHT_SCREEN,\
	SLUDGE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end


	dw BANK(OddishPicFront), BANK(OddishPicBack)

	dw 0000, OddishPicBack
