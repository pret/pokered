	db DEX_BELLSPROUT ; pokedex id

	db  50,  75,  35,  40,  70
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 255 ; catch rate
	db 84 ; base exp

	INCBIN "gfx/pokemon/front/bellsprout.pic", 0, 1 ; sprite dimensions
	dw BellsproutPicFront, BellsproutPicBackSW

	db VINE_WHIP, GROWTH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEECH_SEED,\
	PIN_MISSILE,\
	TOXIC,\
	SLASH,\
	DOUBLE_EDGE,\
	AMNESIA,\
	BARRIER,\
	RAZOR_LEAF,\
	SOLARBEAM,\
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


	dw BANK(BellsproutPicFront), BANK(BellsproutPicBack)

	dw 0000, BellsproutPicBack
