	db DEX_SKIMPER ; pokedex id

	db  62,  43,  36,  88,  71
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 60 ; catch rate
	db 67 ; base exp

	INCBIN "gfx/pokemon/front/skimper.pic", 0, 1 ; sprite dimensions
	dw SkimperPicFront, SkimperPicBack

	db SCRATCH, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    RAGE,         DRAGON_RAGE,  THUNDERBOLT,  THUNDER,      \
	     DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         SWIFT,        \
	     SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   CUT,          \
	     SURF
	; end

	db BANK(SkimperPicFront)
	assert BANK(SkimperPicFront) == BANK(SkimperPicBack)
