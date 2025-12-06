	db DEX_GMOLTRES ; pokedex id

	db  90,  85,  90,  90, 135
	;   hp  atk  def  spd  spc

	db DARK, FLYING ; type
	db 3 ; catch rate
	db 217 ; base exp

	INCBIN "gfx/pokemon/front/gmoltres.pic", 0, 1 ; sprite dimensions
	dw GMoltresPicFront, GMoltresPicBack

    db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; note: starting learnsets are part of regular learnsets
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   FLAMETHROWER,    TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         FIRE_BLAST,   SWIFT,        SKY_ATTACK,   REST,         \
	     SUBSTITUTE,   FLY
	; end

	db BANK(GMoltresPicFront)
	assert BANK(GMoltresPicFront) == BANK(GMoltresPicBack)
