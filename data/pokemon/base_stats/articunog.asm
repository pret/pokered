	db DEX_ARTICUNO_G ; pokedex id

	db  90,  85,  85,  95, 125
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, FLYING ; type
	db 3 ; catch rate
	db 215 ; base exp

	INCBIN "gfx/pokemon/front/articunog.pic", 0, 1 ; sprite dimensions
	dw ArticunoGPicFront, ArticunoGPicBack

	db GUST, CONFUSION, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   WHIRLWIND,    TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         PSYCHIC_M,    TELEPORT,     MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      BIDE,         SWIFT,        SKY_ATTACK,   \
	     REST,         PSYWAVE,      SUBSTITUTE,   FLY
	; end

	db BANK(ArticunoGPicFront)
	assert BANK(ArticunoGPicFront) == BANK(ArticunoGPicBack)
