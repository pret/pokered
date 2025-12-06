	db DEX_MAERODACTYL ; pokedex id

	db  80, 135,  85, 150,  70
	;   hp  atk  def  spd  spc

	db ROCK, FLYING ; type
	db 45 ; catch rate
	db 202 ; base exp

	INCBIN "gfx/pokemon/front/maerodactyl.pic", 0, 1 ; sprite dimensions
	dw MAerodactylPicFront, MAerodactylPicBack

    db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; note: starting learnsets are part of regular learnsets
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   FLAMETHROWER,    TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         DRAGON_RAGE,  MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      BIDE,         FIRE_BLAST,   SWIFT,        SKY_ATTACK,   \
	     REST,         SUBSTITUTE,   FLY
	; end

	db BANK(MAerodactylPicFront)
	assert BANK(MAerodactylPicFront) == BANK(MAerodactylPicBack)
