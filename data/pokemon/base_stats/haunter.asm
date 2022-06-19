	db DEX_HAUNTER ; pokedex id

	db  45,  50,  45,  95, 115
	;   hp  atk  def  spd  spc

	db GHOST, POISON ; type
	db 90 ; catch rate
	db 126 ; base exp

	INCBIN "gfx/pokemon/front/haunter.pic", 0, 1 ; sprite dimensions
	dw HaunterPicFront, HaunterPicBackSW

	db LICK, CONFUSE_RAY, NIGHT_SHADE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	THUNDERPUNCH,\
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
	FLASH
	; end

	dw BANK(HaunterPicFront), BANK(HaunterPicBack)

	dw 0000, HaunterPicBack
