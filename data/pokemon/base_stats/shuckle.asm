	db DEX_SHUCKLE ; pokedex id

	db 20, 10, 230,  5,  10
	;   hp  atk  def  spd  spc

	db BUG, ROCK ; type
	db 190 ; catch rate
	db 177 ; base exp

	INCBIN "gfx/pokemon/front/shuckle.pic", 0, 1 ; sprite dimensions
	dw ShucklePicFront, ShucklePicBack

	db CONSTRICT, WITHDRAW, DOUBLE_EDGE, TOXIC ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        HORN_DRILL,   BODY_SLAM,    \
	     TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     \
	     BLIZZARD,     HYPER_BEAM,   PAY_DAY,      SUBMISSION,   COUNTER,      \
	     SEISMIC_TOSS, RAGE,         THUNDERBOLT,  THUNDER,      EARTHQUAKE,   \
	     FISSURE,      DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     FIRE_BLAST,   SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   \
	     SURF,         STRENGTH
	; end

	db 0 ; padding