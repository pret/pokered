	db DEX_PARASECT ; pokedex id

	db  60,  95,  80,  30,  80
	;   hp  atk  def  spd  spc

	db BUG, GRASS ; type
	db 75 ; catch rate
	db 128 ; base exp

	INCBIN "gfx/pokemon/front/parasect.pic", 0, 1 ; sprite dimensions
	dw ParasectPicFront, ParasectPicBackSW

	db SCRATCH, STUN_SPORE, LEECH_LIFE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	LEECH_SEED,\
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\
	BARRIER,\
	RAZOR_LEAF,\
	SOLARBEAM,\
	EARTHQUAKE,\
	CRABHAMMER,\
	DIG,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	SLAM,\
	KARATE_CHOP,\
	LIGHT_SCREEN,\
	SLUDGE,\
	ROCK_SLIDE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	dw BANK(ParasectPicFront), BANK(ParasectPicBack)

	dw 0000, ParasectPicBack
