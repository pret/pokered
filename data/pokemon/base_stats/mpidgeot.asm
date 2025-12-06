	db DEX_MPIDGEOT ; pokedex id

	db  83,  80,  80, 121, 135
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 172 ; base exp

	INCBIN "gfx/pokemon/front/mpidgeot.pic", 0, 1 ; sprite dimensions
	dw MPidgeotPicFront, MPidgeotPicBack

    db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; note: starting learnsets are part of regular learnsets
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   FLAMETHROWER,    TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         SWIFT,        SKY_ATTACK,   REST,         SUBSTITUTE,   \
	     FLY
	; end

	db BANK(MPidgeotPicFront)
	assert BANK(MPidgeotPicFront) == BANK(MPidgeotPicBack)
