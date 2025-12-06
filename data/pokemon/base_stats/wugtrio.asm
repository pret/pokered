	db DEX_WUGTRIO ; pokedex id

	db  35, 100,  50, 120,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 50 ; catch rate
	db 149 ; base exp

	INCBIN "gfx/pokemon/front/wugtrio.pic", 0, 1 ; sprite dimensions
	dw WugtrioPicFront, WugtrioPicBack

    db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; note: starting learnsets are part of regular learnsets
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         EARTHQUAKE,   FISSURE,      DIG,          MIMIC,        \
	     DOUBLE_TEAM,  BIDE,         REST,         ROCK_SLIDE,   SUBSTITUTE
	; end

	db BANK(WugtrioPicFront)
	assert BANK(WugtrioPicFront) == BANK(WugtrioPicBack)
