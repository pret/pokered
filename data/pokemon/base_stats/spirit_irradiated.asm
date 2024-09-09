	db DEX_HITMONCHAN ; pokedex id

	db  90, 115,  115,  50,  115
	;   hp  atk  def  spd  spc

	db FIGHTING, GHOST ; type
	db 95 ; catch rate
	db 140 ; base exp

	INCBIN "gfx/battle/spirit_irradiated.pic", 0, 1 ; sprite dimensions
	dw IrradiatedPicFront, HitmonchanPicBackSW

	db GROWTH, SLUDGE, STRUGGLE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	HI_JUMP_KICK,\
	THUNDERPUNCH,\
	ROLLING_KICK,\
	BARRIER,\
	EARTHQUAKE,\
	SWORDS_DANCE,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\ ; FILTHY SLAM
	KARATE_CHOP,\
	MEDITATE,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH
	; end

	db BANK(IrradiatedPicFront)
	db 0
	db BANK(HitmonchanPicBack)
	db BANK(HitmonchanPicBackSW)

	dw 0, HitmonchanPicBack

