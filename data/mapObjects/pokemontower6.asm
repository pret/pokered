PokemonTower6Object: ; 0x60c5b (size=58)
	db $1 ; border block

	db $2 ; warps
	db $9, $12, $1, POKEMONTOWER_5
	db $10, $9, $0, POKEMONTOWER_7

	db $0 ; signs

	db $5 ; objects
	object SPRITE_MEDIUM, $c, $a, FACE, LEFT, $1, CHANNELER + $C8, $13
	object SPRITE_MEDIUM, $9, $5, FACE, DOWN, $2, CHANNELER + $C8, $14
	object SPRITE_MEDIUM, $10, $5, FACE, RIGHT, $3, CHANNELER + $C8, $15
	object SPRITE_BALL, $6, $8, FACE, STAY, $4, RARE_CANDY
	object SPRITE_BALL, $e, $e, FACE, STAY, $5, X_ACCURACY

	; warp-to
	EVENT_DISP POKEMONTOWER_6_WIDTH, $9, $12 ; POKEMONTOWER_5
	EVENT_DISP POKEMONTOWER_6_WIDTH, $10, $9 ; POKEMONTOWER_7
