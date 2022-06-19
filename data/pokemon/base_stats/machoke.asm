	db DEX_MACHOKE ; pokedex id

	db  80, 100,  70,  45,  50
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 90 ; catch rate
	db 146 ; base exp

	INCBIN "gfx/pokemon/front/machoke.pic", 0, 1 ; sprite dimensions
	dw MachokePicFront, MachokePicBackSW

	db KARATE_CHOP, LOW_KICK, LEER, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HI_JUMP_KICK,\
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

	dw BANK(MachokePicFront), BANK(MachokePicBack)

	dw 0000, MachokePicBack
