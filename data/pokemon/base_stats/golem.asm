	db DEX_GOLEM ; pokedex id

	db  80, 110, 130,  45,  55
	;   hp  atk  def  spd  spc

	db ROCK, GROUND ; type
	db 45 ; catch rate
	db 177 ; base exp

	INCBIN "gfx/pokemon/front/golem.pic", 0, 1 ; sprite dimensions
	dw GolemPicFront, GolemPicBackSW

	db TACKLE, DEFENSE_CURL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	THUNDERPUNCH,\
	ROLLING_KICK,\
	EARTHQUAKE,\
	CRABHAMMER,\
	DIG,\
	BIDE,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\
	KARATE_CHOP,\
	MEDITATE,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH
	; end

	dw BANK(GolemPicFront), BANK(GolemPicBack)

	dw 0000, GolemPicBack
