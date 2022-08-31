	db DEX_BITTYBAT ; pokedex id

	db  35,  40,  30,  50,  35
	;   hp  atk  def  spd  spc

	db POISON, FLYING ; type
	db 255 ; catch rate
	db 44 ; base exp

	INCBIN "gfx/pokemon/front/bittybat.pic", 0, 1 ; sprite dimensions
	dw BittybatPicFront, BittybatPicBack

	db LEECH_LIFE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   WHIRLWIND,    TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     RAGE,         MEGA_DRAIN,   MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     SWIFT,        REST,         SUBSTITUTE
	; end

	db BANK(BittybatPicFront)
	assert BANK(BittybatPicFront) == BANK(BittybatPicBack)
