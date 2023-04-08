	db DEX_NINETALES_A ; pokedex id

	db  73,  67,  75, 109, 100
	;   hp  atk  def  spd  spc

	db ICE, FAIRY ; type
	db 75 ; catch rate
	db 178 ; base exp

	INCBIN "gfx/pokemon/front/ninetalesa.pic", 0, 1 ; sprite dimensions
	dw NinetalesAPicFront, NinetalesAPicBack

	db FAIRY_WIND, TAIL_WHIP, QUICK_ATTACK, ROAR  ; level 1 learnset - used for trainers
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  ICE_BEAM,     \
	     BLIZZARD,     HYPER_BEAM,   RAGE,         DIG,          MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      BIDE,         SWIFT,        SKULL_BASH,   \
	     REST,         SUBSTITUTE
	; end

	db BANK(NinetalesAPicFront)
	assert BANK(NinetalesAPicFront) == BANK(NinetalesAPicBack)