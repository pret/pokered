	db DEX_BAWLIGUA ; pokedex id

	db  72,  53,  46,  98,  81
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 45 ; catch rate
	db 144 ; base exp

	INCBIN "gfx/pokemon/front/bawligua.pic", 0, 1 ; sprite dimensions
	dw BawliguaPicFront, BawliguaPicBack

	db SCRATCH, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    RAGE,         DRAGON_RAGE,  THUNDERBOLT,  THUNDER,      \
	     DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         SWIFT,        \
	     SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   CUT,          \
	     SURF,         STRENGTH
	; end

	db BANK(BawliguaPicFront)
	assert BANK(BawliguaPicFront) == BANK(BawliguaPicBack)
