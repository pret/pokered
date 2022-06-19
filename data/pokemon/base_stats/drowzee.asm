	db DEX_DROWZEE ; pokedex id

	db  60,  48,  45,  42,  90
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 190 ; catch rate
	db 102 ; base exp

	INCBIN "gfx/pokemon/front/drowzee.pic", 0, 1 ; sprite dimensions
	dw DrowzeePicFront, DrowzeePicBackSW

	db POUND, HYPNOSIS, NO_MOVE, NO_MOVE ; level 1 learnset
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

	dw BANK(DrowzeePicFront), BANK(DrowzeePicBack)

	dw 0000, DrowzeePicBack
