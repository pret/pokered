	db DEX_DRAGONAIR ; pokedex id

	db  61,  84,  65,  70,  70
	;   hp  atk  def  spd  spc

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 144 ; base exp

	INCBIN "gfx/pokemon/front/dragonair.pic", 0, 1 ; sprite dimensions
	dw DragonairPicFront, DragonairPicBackSW

	db WRAP, LEER, THUNDER_WAVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

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
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	FLASH
	; end

	dw BANK(DragonairPicFront), BANK(DragonairPicBack)

	dw 0000, DragonairPicBack
