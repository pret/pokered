	db DEX_POLIWHIRL ; pokedex id

	db  65,  65,  65,  90,  50
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 120 ; catch rate
	db 131 ; base exp

	INCBIN "gfx/pokemon/front/poliwhirl.pic", 0, 1 ; sprite dimensions
	dw PoliwhirlPicFront, PoliwhirlPicBackSW

	db BUBBLE, HYPNOSIS, WATER_GUN, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	AMNESIA,\
	THUNDERPUNCH,\
	ROLLING_KICK,\
	BARRIER,\
	DIG,\
	PSYCHIC_M,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	KARATE_CHOP,\
	MEDITATE,\
	LIGHT_SCREEN,\
	PSYBEAM,\
	GLARE,\
	SUBSTITUTE,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	dw BANK(PoliwhirlPicFront), BANK(PoliwhirlPicBack)

	dw 0000, PoliwhirlPicBack
