	db DEX_RATICATE_A ; pokedex id

	db  75,  71,  70,  77,  40 ; lol
	;   hp  atk  def  spd  spc

	db DARK, NORMAL ; type
	db 90 ; catch rate
	db 116 ; base exp

	INCBIN "gfx/pokemon/front/raticatea.pic", 0, 1 ; sprite dimensions
	dw RaticateAPicFront, RaticateAPicBack

	db TACKLE, TAIL_WHIP, QUICK_ATTACK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   RAGE,         \
	     DIG,          MIMIC,        DOUBLE_TEAM,  \
	     BIDE,         SWIFT,        SKULL_BASH,   REST,         SUBSTITUTE
	; end

	db BANK(RaticateAPicFront)
	assert BANK(RaticateAPicFront) == BANK(RaticateAPicBack)
