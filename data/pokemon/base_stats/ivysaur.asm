	db DEX_IVYSAUR ; pokedex id

	db  60,  62,  63,  60,  80
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 141 ; base exp

	INCBIN "gfx/pokemon/front/ivysaur.pic", 0, 1 ; sprite dimensions
	dw IvysaurPicFront, IvysaurPicBackSW

	db TACKLE, GROWL, LEECH_SEED, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEECH_SEED,\
	PIN_MISSILE,\ 
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	AMNESIA,\
	ROLLING_KICK,\ 
	BARRIER, \
	RAZOR_LEAF,\
	SOLARBEAM,\
	DIG,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\
	MEDITATE,\
	LIGHT_SCREEN,\
	SLUDGE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end

	dw BANK(IvysaurPicFront), BANK(IvysaurPicBack)

	dw 0000, IvysaurPicBack
