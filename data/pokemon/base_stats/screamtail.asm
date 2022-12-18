	db DEX_SCREAM_TAIL ; pokedex id

	db 115,  65,  99, 111,  65
	;   hp  atk  def  spd  spc

	db FAIRY, PSYCHIC_TYPE ; type
	db 50 ; catch rate
	db 210 ; base exp

	INCBIN "gfx/pokemon/front/screamtail.pic", 0, 1 ; sprite dimensions
	dw ScreamTailPicFront, ScreamTailPicBack

	db SING, FAIRY_WIND, DISABLE, BITE ; level 1 learnset
	db GROWTH_SLIGHTLY_FAST ; growth rate - reusing unused exp group, seems funny

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     SOLARBEAM,    THUNDERBOLT,  THUNDER,      PSYCHIC_M,    TELEPORT,     \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         FIRE_BLAST,   \
	     SKULL_BASH,   REST,         THUNDER_WAVE, PSYWAVE,      TRI_ATTACK,   \
	     SUBSTITUTE,   STRENGTH,     FLASH
	; end

	db BANK(ScreamTailPicFront)
	assert BANK(ScreamTailPicFront) == BANK(ScreamTailPicBack)
