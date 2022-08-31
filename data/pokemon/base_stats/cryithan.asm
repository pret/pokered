	db DEX_CRYITHAN ; pokedex id

	db  92,  83,  76, 118, 101
	;   hp  atk  def  spd  spc

	db WATER, DRAGON ; type
	db 9 ; catch rate
	db 210 ; base exp

	INCBIN "gfx/pokemon/front/cryithan.pic", 0, 1 ; sprite dimensions
	dw CryithanPicFront, CryithanPicBack

	db SCRATCH, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    HYPER_BEAM,   RAGE,         DRAGON_RAGE,  THUNDERBOLT,  \
	     THUNDER,      DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     SWIFT,        SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   \
	     CUT,          SURF,         STRENGTH
	; end

	db BANK(CryithanPicFront)
	assert BANK(CryithanPicFront) == BANK(CryithanPicBack)
