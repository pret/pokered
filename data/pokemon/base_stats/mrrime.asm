	db DEX_MR_RIME ; pokedex id

	db  80,  85,  75,  70, 100
	;   hp  atk  def  spd  spc

	db ICE, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 207 ; base exp

	INCBIN "gfx/pokemon/front/mr.rime.pic", 0, 1 ; sprite dimensions
	dw MrRimePicFront, MrRimePicBack

	db CONFUSION, REFLECT, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   SUBMISSION,   \
	     COUNTER,      SEISMIC_TOSS, RAGE,         SOLARBEAM,    THUNDERBOLT,  \
	     THUNDER,      PSYCHIC_M,    TELEPORT,     MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      BIDE,         METRONOME,    SKULL_BASH,   REST,         \
	     THUNDER_WAVE, PSYWAVE,      SUBSTITUTE,   FLASH
	; end

	db BANK(MrRimePicFront)
	assert BANK(MrRimePicFront) == BANK(MrRimePicBack)
