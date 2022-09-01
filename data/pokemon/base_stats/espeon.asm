	db DEX_ESPEON ; pokedex id

	db  60,  65,  60, 110, 130
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 196 ; base exp

	INCBIN "gfx/pokemon/front/espeon.pic", 0, 1 ; sprite dimensions
	dw EspeonPicFront, EspeonPicBack

	db TACKLE, SAND_ATTACK, QUICK_ATTACK, CONFUSION ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         PSYCHIC_M,    TELEPORT,     MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      BIDE,         SWIFT,        SKULL_BASH,   DREAM_EATER,  \
	     REST,         PSYWAVE,      SUBSTITUTE
	; end

	db BANK(EspeonPicFront)
	assert BANK(EspeonPicFront) == BANK(EspeonPicBack)
