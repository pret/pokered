	db DEX_PINSIR ; pokedex id

	db  65, 125, 100,  85,  55
	;   hp  atk  def  spd  spc

	db BUG, BUG ; type
	db 45 ; catch rate
	db 200 ; base exp

	INCBIN "gfx/pokemon/front/pinsir.pic", 0, 1 ; sprite dimensions
	dw PinsirPicFront, PinsirPicBackSW

	db VICEGRIP, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	PIN_MISSILE,\
	FIRE_PUNCH,\
	TOXIC,\
	HORN_DRILL,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	HI_JUMP_KICK,\
	THUNDERPUNCH,\
	ROLLING_KICK,\
	BARRIER,\
	EARTHQUAKE,\
	CRABHAMMER,\
	DIG,\
	SWORDS_DANCE,\
	BIDE,\
	BARRAGE,\
	SLAM,\
	KARATE_CHOP,\
	MEDITATE,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	SURF,\
	STRENGTH
	; end


	dw BANK(PinsirPicFront), BANK(PinsirPicBack)

	dw 0000, PinsirPicBack
