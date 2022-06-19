	db DEX_ARTICUNO ; pokedex id

	db  90,  85, 100,  85, 125
	;   hp  atk  def  spd  spc

	db ICE, FLYING ; type
	db 25 ; catch rate
	db 215 ; base exp

	INCBIN "gfx/pokemon/front/articuno.pic", 0, 1 ; sprite dimensions
	dw ArticunoPicFront, ArticunoPicBackSW

	db PECK, ICE_BEAM, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	RAZOR_WIND,\
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
	PSYCHIC_M,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SKY_ATTACK,\
	LIGHT_SCREEN,\
	PSYBEAM,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	FLASH
	; end


	dw BANK(ArticunoPicFront), BANK(ArticunoPicBack)

	dw 0000, ArticunoPicBack
