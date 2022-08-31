	db DEX_KOTORA ; pokedex id

	db  50,  65,  45,  40,  55
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 180 ; catch rate
	db 88 ; base exp

	INCBIN "gfx/pokemon/front/kotora.pic", 0, 1 ; sprite dimensions
	dw KotoraPicFront, KotoraPicBack

	db THUNDERSHOCK, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         \
	     THUNDERBOLT,  THUNDER,      MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     SWIFT,        SKULL_BASH,   REST,         THUNDER_WAVE, SUBSTITUTE
	; end

	db BANK(KotoraPicFront)
	assert BANK(KotoraPicFront) == BANK(KotoraPicBack)
