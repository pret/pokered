	db DEX_DUGTRIO_A ; pokedex id

	db  35,  80,  60, 110,  70
	;   hp  atk  def  spd  spc

	db GROUND, STEEL ; type
	db 50 ; catch rate
	db 153 ; base exp

	INCBIN "gfx/pokemon/front/dugtrioa.pic", 0, 1 ; sprite dimensions
	dw DugtrioAPicFront, DugtrioAPicBack

	db SCRATCH, GROWL, DIG, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         EARTHQUAKE,   FISSURE,      DIG,          MIMIC,        \
	     DOUBLE_TEAM,  BIDE,         REST,         ROCK_SLIDE,   SUBSTITUTE,   \
	     CUT
	; end

	db BANK(DugtrioAPicFront)
	assert BANK(DugtrioAPicFront) == BANK(DugtrioAPicBack)
