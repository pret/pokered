	db DEX_EXEGGUTOR ; pokedex id

	db  95,  95,  85,  55, 125
	;   hp  atk  def  spd  spc

	db GRASS, FIRE ; type
	db 65 ; catch rate
	db 212 ; base exp

	INCBIN "gfx/battle/spirit_torched.pic", 0, 1 ; sprite dimensions
	dw TorchedPicFront, ExeggutorPicBackSW

	db BARRIER, FLAMETHROWER, SELFDESTRUCT, MEGA_DRAIN ; level 1 learnset
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
	SLAM,\ ; FILTHY SLAM
	LIGHT_SCREEN,\
	PSYBEAM,\
	SUBSTITUTE,\
	STRENGTH,\
	FLASH
	; end

	db BANK(TorchedPicFront)
	db 0
	db BANK(ExeggutorPicBack)
	db BANK(ExeggutorPicBackSW)

	dw ExeggutorPicFrontAlt, ExeggutorPicBack

