	db DEX_CHANSEY ; pokedex id

	db 250,   5,   5,  50, 105
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 255 ; base exp

	INCBIN "gfx/pokemon/front/chansey.pic", 0, 1 ; sprite dimensions
	dw ChanseyPicFront, ChanseyPicBackSW

	db POUND, DOUBLESLAP, NO_MOVE, NO_MOVE ; level 1 learnset
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
	HYPER_BEAM,\
	SOLARBEAM,\
	THUNDERBOLT,\
	THUNDER,\
	PSYCHIC_M,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	LIGHT_SCREEN,\
	PSYBEAM,\
	SUBSTITUTE,\
	STRENGTH,\
	FLASH
	; end


	dw BANK(ChanseyPicFront), BANK(ChanseyPicBack)

	dw 0000, ChanseyPicBack
