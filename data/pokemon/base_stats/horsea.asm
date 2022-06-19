	db DEX_HORSEA ; pokedex id

	db  30,  40,  70,  60,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 225 ; catch rate
	db 83 ; base exp

	INCBIN "gfx/pokemon/front/horsea.pic", 0, 1 ; sprite dimensions
	dw HorseaPicFront, HorseaPicBackSW

	db BUBBLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	AMNESIA,\
	BARRIER,\
	DRAGON_RAGE,\
	MEGA_DRAIN,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SLUDGE,\
	SUBSTITUTE,\
	SURF,\
	FLASH
	; end


	dw BANK(HorseaPicFront), BANK(HorseaPicBack)

	dw 0000, HorseaPicBack
