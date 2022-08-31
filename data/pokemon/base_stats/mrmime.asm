	db DEX_MR_MIME ; pokedex id

	db  40,  45,  65,  90, 100
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 136 ; base exp

	INCBIN "gfx/pokemon/front/mr.mime.pic", 0, 1 ; sprite dimensions
	dw MrMimePicFront, MrMimePicBack

	db CONFUSION, BARRIER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         SOLARBEAM,    THUNDERBOLT,  THUNDER,      PSYCHIC_M,    \
	     TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         \
	     METRONOME,    SKULL_BASH,   REST,         THUNDER_WAVE, PSYWAVE,      \
	     SUBSTITUTE,   FLASH
	; end

	db BANK(MrMimePicFront)
	assert BANK(MrMimePicFront) == BANK(MrMimePicBack)
