	db DEX_WEEZING ; pokedex id

	db  65,  90, 120,  60,  85
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 60 ; catch rate
	db 173 ; base exp

	INCBIN "gfx/pokemon/front/weezing.pic", 0, 1 ; sprite dimensions
	dw WeezingPicFront, WeezingPicBackSW

	db TACKLE, SMOG, SLUDGE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	KINESIS,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\
	LIGHT_SCREEN,\
	SLUDGE,\
	SUBSTITUTE,\
	FLASH
	; end

	dw BANK(WeezingPicFront), BANK(WeezingPicBack)

	dw 0000, WeezingPicBack
