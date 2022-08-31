	db DEX_CROAKOZUNA ; pokedex id

	db 134,  75,  70,  60,  75
	;   hp  atk  def  spd  spc

	db WATER, DARK ; type
	db 75 ; catch rate
	db 174 ; base exp

	INCBIN "gfx/pokemon/front/croakozuna.pic", 0, 1 ; sprite dimensions
	dw CroakozunaPicFront, CroakozunaPicBack

	db DOUBLE_TEAM, DOUBLESLAP, BUBBLE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   RAZOR_WIND,   SWORDS_DANCE, WHIRLWIND,    TOXIC,        \
	     BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    \
	     HYPER_BEAM,   PAY_DAY,      SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         DIG,          TELEPORT,     MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      BIDE,         METRONOME,    SWIFT,        REST,         \
	     PSYWAVE,      SUBSTITUTE,   CUT,          SURF,         FLASH
	; end

	db BANK(CroakozunaPicFront)
	assert BANK(CroakozunaPicFront) == BANK(CroakozunaPicBack)
