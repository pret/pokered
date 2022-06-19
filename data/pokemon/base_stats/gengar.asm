	db DEX_GENGAR ; pokedex id

	db  60,  65,  60, 110, 130
	;   hp  atk  def  spd  spc

	db GHOST, POISON ; type
	db 45 ; catch rate
	db 190 ; base exp

	INCBIN "gfx/pokemon/front/gengar.pic", 0, 1 ; sprite dimensions
	dw GengarPicFront, GengarPicBackSW

	db LICK, CONFUSE_RAY, NIGHT_SHADE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	HYPER_BEAM,\
	HI_JUMP_KICK,\
	THUNDERPUNCH,\
	ROLLING_KICK,\
	THUNDERBOLT,\
	THUNDER,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	KINESIS,\
	BIDE,\
	BARRAGE,\
	SLAM,\
	KARATE_CHOP,\
	LOVELY_KISS,\
	PSYBEAM,\
	SLUDGE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	dw BANK(GengarPicFront), BANK(GengarPicBack)

	dw 0000, GengarPicBack
