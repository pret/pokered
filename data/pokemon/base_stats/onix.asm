	db DEX_ONIX ; pokedex id

	db  55,  25, 180,  85,  80
	;   hp  atk  def  spd  spc

	db ROCK, GROUND ; type
	db 45 ; catch rate
	db 108 ; base exp

	INCBIN "gfx/pokemon/front/onix.pic", 0, 1 ; sprite dimensions
	dw OnixPicFront, OnixPicBackSW

	db TACKLE, HARDEN, GROWL, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	AMNESIA,\
	HYPER_BEAM,\
	BARRIER,\
	DRAGON_RAGE,\
	EARTHQUAKE,\
	CRABHAMMER,\
	DIG,\
	KINESIS,\
	SWORDS_DANCE,\
	BIDE,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\
	SLUDGE,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH
	; end

	dw BANK(OnixPicFront), BANK(OnixPicBack)

	dw 0000, OnixPicBack
