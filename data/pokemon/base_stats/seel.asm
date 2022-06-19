	db DEX_SEEL ; pokedex id

	db  65,  45,  55,  45,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 190 ; catch rate
	db 100 ; base exp

	INCBIN "gfx/pokemon/front/seel.pic", 0, 1 ; sprite dimensions
	dw SeelPicFront, SeelPicBackSW

	db HEADBUTT, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	HORN_DRILL,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	AMNESIA,\
	BARRIER,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	SLAM,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	GLARE,\
	SUBSTITUTE,\
	SURF,\
	STRENGTH,\
	FLASH
	; end


	dw BANK(SeelPicFront), BANK(SeelPicBack)

	dw 0000, SeelPicBack
