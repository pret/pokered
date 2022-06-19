	db DEX_EXEGGUTOR ; pokedex id

	db  95,  95,  85,  55, 125
	;   hp  atk  def  spd  spc

	db GRASS, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 212 ; base exp

	INCBIN "gfx/pokemon/front/exeggutor.pic", 0, 1 ; sprite dimensions
	dw ExeggutorPicFrontY, ExeggutorPicBackSW

	db BARRAGE, HYPNOSIS, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEECH_SEED,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\
	ROLLING_KICK,\
	BARRIER,\
	RAZOR_LEAF,\
	SOLARBEAM,\
	EARTHQUAKE,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	SLAM,\
	LIGHT_SCREEN,\
	PSYBEAM,\
	SUBSTITUTE,\
	STRENGTH,\
	FLASH
	; end

	dw BANK(ExeggutorPicFront), BANK(ExeggutorPicBack)

	dw ExeggutorPicFront, ExeggutorPicBack
