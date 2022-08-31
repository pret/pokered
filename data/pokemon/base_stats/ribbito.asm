	db DEX_RIBBITO ; pokedex id

	db  94,  55,  50,  40,  55
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 190 ; catch rate
	db 88 ; base exp

	INCBIN "gfx/pokemon/front/ribbito.pic", 0, 1 ; sprite dimensions
	dw RibbitoPicFront, RibbitoPicBack

	db DOUBLE_TEAM, DOUBLESLAP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   RAZOR_WIND,   SWORDS_DANCE, WHIRLWIND,    TOXIC,        \
	     BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    \
	     PAY_DAY,      SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     DIG,          TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         METRONOME,    SWIFT,        REST,         PSYWAVE,      \
	     SUBSTITUTE,   CUT,          SURF,         FLASH,
	; end

	db BANK(RibbitoPicFront)
	assert BANK(RibbitoPicFront) == BANK(RibbitoPicBack)
