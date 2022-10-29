	db DEX_HINAAZU ; pokedex id

	db  20,  70,  30,  60,  20	; +5 to all stats
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 255 ; catch rate
	db 66 ; base exp

	INCBIN "gfx/pokemon/front/hinaazu.pic", 0, 1 ; sprite dimensions
	dw HinaazuPicFront, HinaazuPicBack

	db PECK, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm WHIRLWIND,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     RAGE,         MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         \
	     SKULL_BASH,   SKY_ATTACK,   REST,         TRI_ATTACK,   SUBSTITUTE,   \
	     FLY
	; end

	db BANK(HinaazuPicFront)
	assert BANK(HinaazuPicFront) == BANK(HinaazuPicBack)
