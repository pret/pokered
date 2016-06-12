PokemonTower5Object:
	db $1 ; border block

	db $2 ; warps
	db $9, $3, $0, POKEMONTOWER_4
	db $9, $12, $0, POKEMONTOWER_6

	db $0 ; signs

	db $6 ; objects
	object SPRITE_MEDIUM, $c, $8, STAY, NONE, $1 ; person
	object SPRITE_MEDIUM, $11, $7, STAY, LEFT, $2, OPP_CHANNELER, $e
	object SPRITE_MEDIUM, $e, $3, STAY, LEFT, $3, OPP_CHANNELER, $10
	object SPRITE_MEDIUM, $6, $a, STAY, RIGHT, $4, OPP_CHANNELER, $11
	object SPRITE_MEDIUM, $9, $10, STAY, RIGHT, $5, OPP_CHANNELER, $12
	object SPRITE_BALL, $6, $e, STAY, NONE, $6, NUGGET

	; warp-to
	EVENT_DISP POKEMONTOWER_5_WIDTH, $9, $3 ; POKEMONTOWER_4
	EVENT_DISP POKEMONTOWER_5_WIDTH, $9, $12 ; POKEMONTOWER_6
