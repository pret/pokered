	db DEX_VAPOREON ; pokedex id

	db 130,  65,  60,  65, 110
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 45 ; catch rate
	db 196 ; base exp

	INCBIN "gfx/pokemon/front/vaporeon.pic", 0, 1 ; sprite dimensions
	dw VaporeonPicFront, VaporeonPicBackSW

	db TACKLE, SAND_ATTACK, QUICK_ATTACK, WATER_GUN ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	AMNESIA,\
	BARRIER,\
	ROLLING_KICK,\
	DIG,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\
	KARATE_CHOP,\
	LIGHT_SCREEN,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	dw BANK(VaporeonPicFront), BANK(VaporeonPicBack)

	dw 0000, VaporeonPicBack
