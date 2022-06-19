	db DEX_DRAGONITE ; pokedex id

	db  91, 134,  95,  80, 100
	;   hp  atk  def  spd  spc

	db DRAGON, FLYING ; type
	db 45 ; catch rate
	db 218 ; base exp

	INCBIN "gfx/pokemon/front/dragonite.pic", 0, 1 ; sprite dimensions
	dw DragonitePicFront, DragonitePicBackSW

	db WRAP, LEER, THUNDER_WAVE, AGILITY ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	FIRE_PUNCH,\
	TOXIC,\
	HORN_DRILL,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	DRAGON_RAGE,\
	THUNDERBOLT,\
	THUNDER,\
	KINESIS,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\
	KARATE_CHOP,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	dw BANK(DragonitePicFront), BANK(DragonitePicBack)

	dw 0000, DragonitePicBack
