	db DEX_DEWGONG ; pokedex id

	db  90,  70,  80,  70,  95
	;   hp  atk  def  spd  spc

	db WATER, ICE ; type
	db 75 ; catch rate
	db 176 ; base exp

	INCBIN "gfx/pokemon/front/dewgong.pic", 0, 1 ; sprite dimensions
	dw DewgongPicFront, DewgongPicBackSW

	db HEADBUTT, GROWL, AURORA_BEAM, NO_MOVE ; level 1 learnset
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
	HYPER_BEAM,\
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

	dw BANK(DewgongPicFront), BANK(DewgongPicBack)

	dw 0000, DewgongPicBack
