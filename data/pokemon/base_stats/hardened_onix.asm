; PureRGBnote: ADDED: powered up version of onix with better stats and less weaknesses.
	db DEX_ONIX ; pokedex id

	db  80,  85, 180,  80,  75
	;   hp  atk  def  spd  spc

	db CRYSTAL, GROUND ; type
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
	KINESIS,\ ; FIREWALL
	SWORDS_DANCE,\
	BIDE,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; FILTHY SLAM
	SLUDGE,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH
	; end

	dw BANK(OnixPicFront), BANK(OnixPicBack)

	dw OnixPicFrontAlt, OnixPicBack
