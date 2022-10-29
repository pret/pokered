	db DEX_RHYPERIOR ; pokedex id

	db 115, 140, 130,  40,  55
	;   hp  atk  def  spd  spc

	db GROUND, ROCK ; type
	db 30 ; catch rate
	db 217 ; base exp

	INCBIN "gfx/pokemon/front/rhyperior.pic", 0, 1 ; sprite dimensions
	dw RhyperiorPicFront, RhyperiorPicBack

	db HORN_ATTACK, STOMP, TAIL_WHIP, FURY_ATTACK ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        HORN_DRILL,   BODY_SLAM,    \
	     TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     \
	     BLIZZARD,     HYPER_BEAM,   PAY_DAY,      SUBMISSION,   COUNTER,      \
	     SEISMIC_TOSS, RAGE,         THUNDERBOLT,  THUNDER,      EARTHQUAKE,   \
	     FISSURE,      DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     FIRE_BLAST,   SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   \
	     SURF,         STRENGTH
	; end

	db BANK(RhyperiorPicFront)
	assert BANK(RhyperiorPicFront) == BANK(RhyperiorPicBack)
