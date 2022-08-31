	db DEX_GOROTORA ; pokedex id

	db  90, 105,  85,  80,  95
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 60 ; catch rate
	db 197 ; base exp

	INCBIN "gfx/pokemon/front/gorotora.pic", 0, 1 ; sprite dimensions
	dw GorotoraPicFront, GorotoraPicBack

	db THUNDERSHOCK, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         THUNDERBOLT,  THUNDER,      EARTHQUAKE,   FISSURE,      \
	     MIMIC,        DOUBLE_TEAM,  BIDE,         SWIFT,        SKULL_BASH,   \
	     REST,         THUNDER_WAVE, SUBSTITUTE
	; end

	db BANK(GorotoraPicFront)
	assert BANK(GorotoraPicFront) == BANK(GorotoraPicBack)
