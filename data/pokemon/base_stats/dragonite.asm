	db DEX_DRAGONITE ; pokedex id

	db  91, 134,  95,  80, 100
	;   hp  atk  def  spd  spc

	db DRAGON, FLYING ; type
	db 45 ; catch rate
	db 218 ; base exp

	INCBIN "gfx/pokemon/front/dragonite.pic", 0, 1 ; sprite dimensions
	dw DragonitePicFront, DragonitePicBack

	db WRAP, LEER, THUNDER_WAVE, AGILITY ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   TOXIC,        HORN_DRILL,   BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   RAGE,         DRAGON_RAGE,  THUNDERBOLT,  THUNDER,      \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         FIRE_BLAST,   \
	     SWIFT,        SKULL_BASH,   REST,         THUNDER_WAVE, SUBSTITUTE,   \
	     SURF,         STRENGTH
	; end

	db BANK(DragonitePicFront)
	assert BANK(DragonitePicFront) == BANK(DragonitePicBack)
