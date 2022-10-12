	db DEX_BLOTTLE ; pokedex id

	db  60,  35,  60,  50,  65
	;   hp  atk  def  spd  spc

	db WATER, FAIRY ; type
	db 190 ; catch rate
	db 97 ; base exp

	INCBIN "gfx/pokemon/front/blottle.pic", 0, 1 ; sprite dimensions
	dw BlottlePicFront, BlottlePicBack

	db CONSTRICT, SMOKESCREEN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    \
	     ICE_BEAM,     BLIZZARD,     RAGE,         MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      BIDE,         REST,         SUBSTITUTE,   SURF,         \
	     FLASH
	; end

	db BANK(BlottlePicFront)
	assert BANK(BlottlePicFront) == BANK(BlottlePicBack)
