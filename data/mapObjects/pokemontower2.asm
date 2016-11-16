PokemonTower2Object:
	db $1 ; border block

	db $2 ; warps
	db $9, $3, $0, POKEMONTOWER_3
	db $9, $12, $2, POKEMONTOWER_1

	db $0 ; signs

	db $2 ; objects
	object SPRITE_BLUE, $e, $5, STAY, NONE, $1 ; person
	object SPRITE_MEDIUM, $3, $7, STAY, RIGHT, $2 ; person

	; warp-to
	EVENT_DISP POKEMONTOWER_2_WIDTH, $9, $3 ; POKEMONTOWER_3
	EVENT_DISP POKEMONTOWER_2_WIDTH, $9, $12 ; POKEMONTOWER_1
