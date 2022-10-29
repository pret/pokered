	db DEX_MISSINGNO ; pokedex id

	db 211, 157,  53,  31,  47
	;   hp  atk  def  spd  spc

	db BIRD, NORMAL ; type
	db 29 ; catch rate
	db 255 ; base exp

	INCBIN "gfx/pokemon/front/missingno.pic", 0, 1 ; sprite dimensions
	dw MissingNoPicFront, MissingNoPicBack

	db WATER_GUN, WATER_GUN, SKY_ATTACK, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   RAZOR_WIND,   SWORDS_DANCE, WHIRLWIND,    MEGA_KICK,    \
	     TOXIC,        HORN_DRILL,   BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     PAY_DAY,      SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     MEGA_DRAIN,   SOLARBEAM,    DRAGON_RAGE,  THUNDERBOLT,  THUNDER,      \
	     EARTHQUAKE,   FISSURE,      DIG,          PSYCHIC_M,    TELEPORT,     \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         METRONOME,    \
	     SELFDESTRUCT, EGG_BOMB,     FIRE_BLAST,   SWIFT,        SKULL_BASH,   \
	     SOFTBOILED,   DREAM_EATER,  SKY_ATTACK,   REST,         THUNDER_WAVE, \
	     PSYWAVE,      EXPLOSION,    ROCK_SLIDE,   TRI_ATTACK,   SUBSTITUTE,   \
	     CUT,          FLY,          SURF,         STRENGTH,     FLASH
	; end

	db BANK(MissingNoPicFront)
	assert BANK(MissingNoPicFront) == BANK(MissingNoPicBack)
