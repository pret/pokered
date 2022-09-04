	db DEX_TANGROWTH ; pokedex id

	db 100, 100, 125,  50, 110
	;   hp  atk  def  spd  spc

	db GRASS, GRASS ; type
	db 45 ; catch rate
	db 166 ; base exp

	INCBIN "gfx/pokemon/front/tangela.pic", 0, 1 ; sprite dimensions
	dw TangelaPicFront, TangelaPicBack

	db CONSTRICT, BIND, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
		 RAGE,         MEGA_DRAIN,   SOLARBEAM,    EARTHQUAKE,   FISSURE,      \
		 MIMIC,        DOUBLE_TEAM,  BIDE,         SKULL_BASH,   REST,         \
		 ROCK_SLIDE,   SUBSTITUTE,   CUT
	; end

	db BANK(TangelaPicFront)
	assert BANK(TangelaPicFront) == BANK(TangelaPicBack)
