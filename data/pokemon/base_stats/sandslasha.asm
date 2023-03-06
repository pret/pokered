	db DEX_SANDSLASH_A ; pokedex id

	db  75, 100, 120,  65,  65
	;   hp  atk  def  spd  spc

	db ICE, STEEL ; type
	db 90 ; catch rate
	db 163 ; base exp

	INCBIN "gfx/pokemon/front/sandslasha.pic", 0, 1 ; sprite dimensions
	dw SandslashAPicFront, SandslashAPicBack

	db SCRATCH, SAND_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   SUBMISSION,   SEISMIC_TOSS, RAGE,         EARTHQUAKE,   \
	     FISSURE,      DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     SWIFT,        SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   \
	     CUT,          STRENGTH, BLIZZARD, ICE_BEAM
	; end

	db BANK(SandslashAPicFront)
	assert BANK(SandslashAPicFront) == BANK(SandslashAPicBack)