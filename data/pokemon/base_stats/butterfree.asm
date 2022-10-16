	db DEX_BUTTERFREE ; pokedex id

	db  70,  25,  75,  95,  92
	;   hp  atk  def  spd  spc

	db BUG, PSYCHIC_TYPE ; type
	db 105 ; catch rate
	db 160 ; base exp

	INCBIN "gfx/pokemon/front/butterfree.pic", 0, 1 ; sprite dimensions
	dw ButterfreePicFront, ButterfreePicBackSW

	db HARDEN, TACKLE, STRING_SHOT, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	RAZOR_WIND,\ ; ROOST
	LEECH_SEED,\
	TOXIC,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	HYPER_BEAM,\
	AMNESIA,\
	BARRIER,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	SLAM,\ ; FILTHY SLAM
	MEDITATE,\
	SKY_ATTACK,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	PSYBEAM,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	FLASH
	;end

	dw BANK(ButterfreePicFront), BANK(ButterfreePicBack)

	dw ButterfreePicFrontRG, ButterfreePicBack