	db DEX_DUGTRIO ; pokedex id

	db  35,  80,  50, 120,  70
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 50 ; catch rate
	db 153 ; base exp

	INCBIN "gfx/pokemon/front/dugtrio.pic", 0, 1 ; sprite dimensions
	dw DugtrioPicFront, DugtrioPicBackSW

	db SCRATCH, GROWL, DIG, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	EARTHQUAKE,\
	DIG,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\
	KARATE_CHOP,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH
	; end

	dw BANK(DugtrioPicFront), BANK(DugtrioPicBack)

	dw 0000, DugtrioPicBack
