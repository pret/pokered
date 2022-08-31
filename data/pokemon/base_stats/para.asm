	db DEX_PARA ; pokedex id

	db  20,  55,  40,  10,  40
	;   hp  atk  def  spd  spc

	db BUG, GRASS ; type
	db 255 ; catch rate
	db 53 ; base exp

	INCBIN "gfx/pokemon/front/para.pic", 0, 1 ; sprite dimensions
	dw ParaPicFront, ParaPicBack

	db SCRATCH, ABSORB, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     RAGE,         MEGA_DRAIN,   SOLARBEAM,    DIG,          MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      BIDE,         SKULL_BASH,   REST,         \
	     SUBSTITUTE,   CUT
	; end

	db BANK(ParaPicFront)
	assert BANK(ParaPicFront) == BANK(ParaPicBack)
