	db DEX_PIDGEOT ; pokedex id

	db  83,  80,  75,  91,  70
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 172 ; base exp

	INCBIN "gfx/pokemon/front/pidgeot.pic", 0, 1 ; sprite dimensions
	dw PidgeotPicFront, PidgeotPicBackSW

	db GUST, SAND_ATTACK, QUICK_ATTACK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	tmhm \
	RAZOR_WIND,\
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	BARRIER,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\
	SKY_ATTACK,\
	LIGHT_SCREEN,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	STRENGTH
	; end


	dw BANK(PidgeotPicFront), BANK(PidgeotPicBack)

	dw PidgeotPicFrontRG, PidgeotPicBack
