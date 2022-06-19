	db DEX_HYPNO ; pokedex id

	db  85,  73,  70,  67, 115
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 75 ; catch rate
	db 165 ; base exp

	INCBIN "gfx/pokemon/front/hypno.pic", 0, 1 ; sprite dimensions
	dw HypnoPicFront, HypnoPicBackSW

	db POUND, HYPNOSIS, DISABLE, CONFUSION ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	HYPER_BEAM,\
	AMNESIA,\
	THUNDERPUNCH,\
	ROLLING_KICK,\
	BARRIER,\
	PSYCHIC_M,\
	KINESIS,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	SLAM,\
	KARATE_CHOP,\
	MEDITATE,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	PSYBEAM,\
	SLUDGE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	dw BANK(HypnoPicFront), BANK(HypnoPicBack)

	dw 0000, HypnoPicBack
