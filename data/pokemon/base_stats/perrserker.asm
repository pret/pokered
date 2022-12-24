	db DEX_PERRSERKER ; pokedex id

	db  60, 110, 100,  50,  60
	;   hp  atk  def  spd  spc

	db STEEL, STEEL ; type
	db 90 ; catch rate
	db 148 ; base exp

	INCBIN "gfx/pokemon/front/perrserker.pic", 0, 1 ; sprite dimensions
	dw PerrserkerPicFront, PerrserkerPicBack

	db GROWL, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     BUBBLEBEAM,   WATER_GUN,    HYPER_BEAM,   PAY_DAY,      RAGE,         \
	     THUNDERBOLT,  THUNDER,      DIG,          MIMIC,        BIDE,         \
	     SWIFT,        SKULL_BASH,   REST,         SUBSTITUTE,   CUT
	; end

	db BANK(PerrserkerPicFront)
	assert BANK(PerrserkerPicFront) == BANK(PerrserkerPicBack)
