	db DEX_MUK ; pokedex id

	db 105, 105,  75,  50,  65
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 75 ; catch rate
	db 157 ; base exp

	INCBIN "gfx/pokemon/front/muk.pic", 0, 1 ; sprite dimensions
	dw MukPicFront, MukPicBackSW

	db POUND, DISABLE, POISON_GAS, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	HYPER_BEAM,\
	AMNESIA,\
	THUNDERPUNCH,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	BARRIER,\
	MEGA_DRAIN,\
	KINESIS,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\
	KARATE_CHOP,\
	LIGHT_SCREEN,\
	SLUDGE,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	dw BANK(MukPicFront), BANK(MukPicBack)

	dw 0000, MukPicBack
