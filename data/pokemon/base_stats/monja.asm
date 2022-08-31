	db DEX_MONJA ; pokedex id

	db  45,  35,  85,  40,  80
	;   hp  atk  def  spd  spc

	db GRASS, GRASS ; type
	db 190 ; catch rate
	db 63 ; base exp

	INCBIN "gfx/pokemon/front/monja.pic", 0, 1 ; sprite dimensions
	dw MonjaPicFront, MonjaPicBack

	db CONSTRICT, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     RAGE,         MEGA_DRAIN,   SOLARBEAM,    MIMIC,        DOUBLE_TEAM,  \
	     BIDE,         SKULL_BASH,   REST,         SUBSTITUTE,   CUT
	; end

	db BANK(MonjaPicFront)
	assert BANK(MonjaPicFront) == BANK(MonjaPicBack)
