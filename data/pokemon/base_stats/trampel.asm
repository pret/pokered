	db DEX_TRAMPEL ; pokedex id

	db 130, 100,  90,  56,  64
	;   hp  atk  def  spd  spc

	db NORMAL, GROUND ; type
	db 45 ; catch rate
	db 204 ; base exp

	INCBIN "gfx/pokemon/front/trampel.pic", 0, 1 ; sprite dimensions
	dw TrampelPicFront, TrampelPicBack

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        HORN_DRILL,   BODY_SLAM,    \
	     TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     \
	     BLIZZARD,     HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         THUNDERBOLT,  THUNDER,      EARTHQUAKE,   FISSURE,      \
	     MIMIC,        DOUBLE_TEAM,  BIDE,         FIRE_BLAST,   SWIFT,        \
	     SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   STRENGTH
	; end

	db BANK(TrampelPicFront)
	assert BANK(TrampelPicFront) == BANK(TrampelPicBack)
