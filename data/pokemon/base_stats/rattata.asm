	db DEX_RATTATA ; pokedex id

	db  30,  56,  35,  72,  25
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 255 ; catch rate
	db 57 ; base exp

	INCBIN "gfx/pokemon/front/rattata.pic", 0, 1 ; sprite dimensions
	dw RattataPicFront, RattataPicBackSW

	db TACKLE, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
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
	AMNESIA,\
	ROLLING_KICK,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	SWORDS_DANCE,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end


	dw BANK(RattataPicFront), BANK(RattataPicBack)

	dw 0000, RattataPicBack
