	db DEX_WEEZING ; pokedex id

	db  85,  90, 120,  60,  85
	;   hp  atk  def  spd  spc

	db POISON, FLOATING ; type
	db 70 ; catch rate
	db 173 ; base exp

	INCBIN "gfx/pokemon/front/weezing.pic", 0, 1 ; sprite dimensions
	dw WeezingPicFront, WeezingPicBackSW

	db TACKLE, SMOG, NO_MOVE, NO_MOVE ; level 1 learnset
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
	KINESIS,\ ; FIREWALL
	REFLECT,\
	BIDE,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; FILTHY SLAM
	LIGHT_SCREEN,\
	SLUDGE,\
	SUBSTITUTE,\
	FLASH
	; end

	db BANK(WeezingPicFront)
	db 0
	db BANK(WeezingPicBack)
	db BANK(WeezingPicBackSW)

	dw 0, WeezingPicBack

