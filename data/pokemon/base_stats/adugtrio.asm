	db DEX_ADUGTRIO ; pokedex id

	db  35, 100,  60, 110,  70
	;   hp  atk  def  spd  spc

	db GROUND, STEEL ; type
	db 50 ; catch rate
	db 153 ; base exp

	INCBIN "gfx/pokemon/front/adugtrio.pic", 0, 1 ; sprite dimensions
	dw ADugtrioPicFront, ADugtrioPicBack

    db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; note: starting learnsets are part of regular learnsets
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         EARTHQUAKE,   FISSURE,      DIG,          MIMIC,        \
	     DOUBLE_TEAM,  BIDE,         REST,         ROCK_SLIDE,   SUBSTITUTE
	; end

	db BANK(ADugtrioPicFront)
	assert BANK(ADugtrioPicFront) == BANK(ADugtrioPicBack)
