PokemonTower6Object:
	db $1 ; border block

	db $2 ; warps
	db $9, $12, $1, POKEMONTOWER_5
	db $10, $9, $0, POKEMONTOWER_7

	db $0 ; signs

	db $5 ; objects
	object SPRITE_MEDIUM, $c, $a, STAY, RIGHT, $1, OPP_CHANNELER, $13
	object SPRITE_MEDIUM, $9, $5, STAY, DOWN, $2, OPP_CHANNELER, $14
	object SPRITE_MEDIUM, $10, $5, STAY, LEFT, $3, OPP_CHANNELER, $15
	object SPRITE_BALL, $6, $8, STAY, NONE, $4, RARE_CANDY
	object SPRITE_BALL, $e, $e, STAY, NONE, $5, X_ACCURACY

	; warp-to
	EVENT_DISP POKEMONTOWER_6_WIDTH, $9, $12 ; POKEMONTOWER_5
	EVENT_DISP POKEMONTOWER_6_WIDTH, $10, $9 ; POKEMONTOWER_7
