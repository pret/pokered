	db DEX_SLOWKING_G ; pokedex id

	db  95,  65, 80,  30,  110
	;   hp  atk  def  spd  spc

	db POISON, PSYCHIC_TYPE ; type
	db 75 ; catch rate
	db 164 ; base exp

	INCBIN "gfx/pokemon/front/slowkingg.pic", 0, 1 ; sprite dimensions
	dw SlowkingGPicFront, SlowkingGPicBack

	db CONFUSION, DISABLE, HEADBUTT, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   PAY_DAY,      SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         EARTHQUAKE,   FISSURE,      DIG,          PSYCHIC_M,    \
	     TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         \
	     FIRE_BLAST,   SWIFT,        SKULL_BASH,   REST,         THUNDER_WAVE, \
	     PSYWAVE,      TRI_ATTACK,   SUBSTITUTE,   SURF,         STRENGTH,     \
	     FLASH
	; end

	db BANK(SlowkingGPicFront)
	assert BANK(SlowkingGPicFront) == BANK(SlowkingGPicBack)
