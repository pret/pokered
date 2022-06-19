	db DEX_SLOWPOKE ; pokedex id

	db  90,  65,  65,  15,  40
	;   hp  atk  def  spd  spc

	db WATER, PSYCHIC_TYPE ; type
	db 190 ; catch rate
	db 99 ; base exp

	INCBIN "gfx/pokemon/front/slowpoke.pic", 0, 1 ; sprite dimensions
	dw SlowpokePicFront, SlowpokePicBackSW

	db CONFUSION, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	AMNESIA,\
	ROLLING_KICK,\
	EARTHQUAKE,\
	DIG,\
	PSYCHIC_M,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\
	MEDITATE,\
	LIGHT_SCREEN,\
	PSYBEAM,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end


	dw BANK(SlowpokePicFront), BANK(SlowpokePicBack)

	dw 0000, SlowpokePicBack
