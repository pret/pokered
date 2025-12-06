	db DEX_WIGLETT ; pokedex id

	db  10,  55,  25,  95,  35
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 255 ; catch rate
	db 49 ; base exp

	INCBIN "gfx/pokemon/front/wiglett.pic", 0, 1 ; sprite dimensions
	dw WiglettPicFront, WiglettPicBack

    db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; note: starting learnsets are part of regular learnsets
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         \
	     EARTHQUAKE,   FISSURE,      DIG,          MIMIC,        DOUBLE_TEAM,  \
	     BIDE,         REST,         ROCK_SLIDE,   SUBSTITUTE
	; end

	db BANK(WiglettPicFront)
	assert BANK(WiglettPicFront) == BANK(WiglettPicBack)
