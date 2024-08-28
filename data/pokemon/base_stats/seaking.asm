	db DEX_SEAKING ; pokedex id

	db  90, 102,  65,  68,  95
	;   hp  atk  def  spd  spc

	db WATER, NORMAL ; type
	db 90 ; catch rate
	db 170 ; base exp

	INCBIN "gfx/pokemon/front/seaking.pic", 0, 1 ; sprite dimensions
	dw SeakingPicFront, SeakingPicBackSW

	db PECK, WATER_GUN, NO_MOVE, NO_MOVE ; level 1 learnset
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
	BARRIER,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\ ; FILTHY SLAM
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SUBSTITUTE,\
	SURF,\
	FLASH
	; end

	db BANK(SeakingPicFront)
	db 0
	db BANK(SeakingPicBack)
	db BANK(SeakingPicBackSW)

	dw 0, SeakingPicBack

