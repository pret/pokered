	db DEX_CROCKY ; pokedex id

	db  80,  90,  75,  95,  80
	;   hp  atk  def  spd  spc

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 167 ; base exp

	INCBIN "gfx/pokemon/front/crocky.pic", 0, 1 ; sprite dimensions
	dw CrockyPicFront, CrockyPicBack

	db SCRATCH, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   SUBMISSION,   \
	     COUNTER,      SEISMIC_TOSS, RAGE,         DRAGON_RAGE,  EARTHQUAKE,   \
	     FISSURE,      DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     FIRE_BLAST,   SWIFT,        SKULL_BASH,   REST,         ROCK_SLIDE,   \
	     SUBSTITUTE,   CUT,          FLASH
	; end

	db BANK(CrockyPicFront)
	assert BANK(CrockyPicFront) == BANK(CrockyPicBack)
