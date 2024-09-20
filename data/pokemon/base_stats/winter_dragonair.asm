	db DEX_DRAGONAIR ; pokedex id

	db  91,  84,  75,  80,  130
	;   hp  atk  def  spd  spc

	db DRAGON, ICE ; type
	db 45 ; catch rate
	db 218 ; base exp

	INCBIN "gfx/pokemon/front_alt/dragonair.pic", 0, 1 ; sprite dimensions
	dw WinterDragonairPicFront, DragonairPicBackSW

	db WRAP, LEER, ROAR, NO_MOVE ; level 1 learnset
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
	HYPER_BEAM,\
	DRAGON_RAGE,\
	MEGA_DRAIN,\
	THUNDERBOLT,\
	THUNDER,\
	PSYCHIC_M,\
	KINESIS,\ ; FIREWALL
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; FILTHY SLAM
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	PSYBEAM,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	FLASH
	; end

	db BANK(WinterDragonairPicFront)
	db 0
	db BANK(DragonairPicBack)
	db BANK(DragonairPicBackSW)

	dw 0, DragonairPicBack

