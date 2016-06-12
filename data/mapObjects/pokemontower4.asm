PokemonTower4Object:
	db $1 ; border block

	db $2 ; warps
	db $9, $3, $0, POKEMONTOWER_5
	db $9, $12, $1, POKEMONTOWER_3

	db $0 ; signs

	db $6 ; objects
	object SPRITE_MEDIUM, $5, $a, STAY, RIGHT, $1, OPP_CHANNELER, $9
	object SPRITE_MEDIUM, $f, $7, STAY, DOWN, $2, OPP_CHANNELER, $a
	object SPRITE_MEDIUM, $e, $c, STAY, LEFT, $3, OPP_CHANNELER, $c
	object SPRITE_BALL, $c, $a, STAY, NONE, $4, ELIXER
	object SPRITE_BALL, $9, $a, STAY, NONE, $5, AWAKENING
	object SPRITE_BALL, $c, $10, STAY, NONE, $6, HP_UP

	; warp-to
	EVENT_DISP POKEMONTOWER_4_WIDTH, $9, $3 ; POKEMONTOWER_5
	EVENT_DISP POKEMONTOWER_4_WIDTH, $9, $12 ; POKEMONTOWER_3
