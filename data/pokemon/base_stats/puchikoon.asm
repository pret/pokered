	db DEX_PUCHIKOON ; pokedex id

	db  30,  65,  35,  70,  45
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 255 ; catch rate
	db 88 ; base exp

	INCBIN "gfx/pokemon/front/puchikoon.pic", 0, 1 ; sprite dimensions
	dw PuchikoonPicFront, PuchikoonPicBack

	db EMBER, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        HORN_DRILL,   BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     RAGE,         MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         \
	     FIRE_BLAST,   SWIFT,        SKULL_BASH,   REST,         SUBSTITUTE
	; end

	db BANK(PuchikoonPicFront)
	assert BANK(PuchikoonPicFront) == BANK(PuchikoonPicBack)
