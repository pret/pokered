	db DEX_BUU ; pokedex id

	db  65,  93,  57,  95,  85
	;   hp  atk  def  spd  spc

	db ICE, ICE ; type
	db 45 ; catch rate
	db 167 ; base exp

	INCBIN "gfx/pokemon/front/buu.pic", 0, 1 ; sprite dimensions
	dw BuuPicFront, BuuPicBack

	db AURORA_BEAM, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   SUBMISSION,   \
	     COUNTER,      SEISMIC_TOSS, RAGE,         PSYCHIC_M,    TELEPORT,     \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         METRONOME,    \
	     SKULL_BASH,   REST,         PSYWAVE,      SUBSTITUTE,   STRENGTH
	; end

	db BANK(BuuPicFront)
	assert BANK(BuuPicFront) == BANK(BuuPicBack)
