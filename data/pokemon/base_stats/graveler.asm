	db DEX_GRAVELER ; pokedex id

	db  55,  95, 115,  35,  45
	;   hp  atk  def  spd  spc

	db ROCK, GROUND ; type
	db 120 ; catch rate
	db 134 ; base exp

	INCBIN "gfx/pokemon/front/graveler.pic", 0, 1 ; sprite dimensions
	dw GravelerPicFront, GravelerPicBackSW

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

	dw BANK(GravelerPicFront), BANK(GravelerPicBack)

	dw 0000, GravelerPicBack
