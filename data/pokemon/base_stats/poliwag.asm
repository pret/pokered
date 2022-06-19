	db DEX_POLIWAG ; pokedex id

	db  40,  50,  40,  90,  40
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 255 ; catch rate
	db 77 ; base exp

	INCBIN "gfx/pokemon/front/poliwag.pic", 0, 1 ; sprite dimensions
	dw PoliwagPicFront, PoliwagPicBackSW

	db BUBBLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	AMNESIA,\
	BARRIER,\
	DIG,\
	PSYCHIC_M,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	MEDITATE,\
	LIGHT_SCREEN,\
	PSYBEAM,\
	GLARE,\
	SUBSTITUTE,\
	SURF,\
	FLASH
	; end


	dw BANK(PoliwagPicFront), BANK(PoliwagPicBack)

	dw 0000, PoliwagPicBack
