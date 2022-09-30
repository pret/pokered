	db DEX_TSUBOMITTO ; pokedex id

	db  80, 120,  65,  70,  85
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 191 ; base exp

	INCBIN "gfx/pokemon/front/tsubomitto.pic", 0, 1 ; sprite dimensions
	dw TsubomittoPicFront, TsubomittoPicBack

	db RAZOR_LEAF, SWORDS_DANCE, LOVELY_KISS, HYPER_BEAM ; level 1 learnset - used for trainers
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         MEGA_DRAIN,   SOLARBEAM,    MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      BIDE,         REST,         SUBSTITUTE,   \
	     CUT
	; end

	db BANK(TsubomittoPicFront)
	assert BANK(TsubomittoPicFront) == BANK(TsubomittoPicBack)
