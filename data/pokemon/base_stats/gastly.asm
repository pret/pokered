	db DEX_GASTLY ; pokedex id

	db  30,  35,  30,  80, 100
	;   hp  atk  def  spd  spc

	db GHOST, POISON ; type
	db 190 ; catch rate
	db 95 ; base exp

	INCBIN "gfx/pokemon/front/gastly.pic", 0, 1 ; sprite dimensions
	dw GastlyPicFront, GastlyPicBackSW

	db LICK, CONFUSE_RAY, NIGHT_SHADE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	THUNDERBOLT,\
	THUNDER,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	KINESIS,\
	BIDE,\
	BARRAGE,\
	SLAM,\
	LOVELY_KISS,\
	PSYBEAM,\
	SLUDGE,\
	GLARE,\
	SUBSTITUTE,\
	FLASH
	; end


	dw BANK(GastlyPicFront), BANK(GastlyPicBack)

	dw 0000, GastlyPicBack
