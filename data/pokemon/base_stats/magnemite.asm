	db DEX_MAGNEMITE ; pokedex id

	db  25,  35,  70,  45,  95
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 190 ; catch rate
	db 89 ; base exp

	INCBIN "gfx/pokemon/front/magnemite.pic", 0, 1 ; sprite dimensions
	dw MagnemitePicFront, MagnemitePicBackSW

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	CRABHAMMER,\
	KINESIS,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	MEDITATE,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	PSYBEAM,\
	SUBSTITUTE,\
	FLASH
	; end


	dw BANK(MagnemitePicFront), BANK(MagnemitePicBack)

	dw 0000, MagnemitePicBack
