PokemonTower7Object:
	db $1 ; border block

	db $1 ; warps
	warp $9, $10, $1, POKEMONTOWER_6

	db $0 ; signs

	db 4 ; objects
	object SPRITE_ROCKET, $9, $b, STAY, RIGHT, $1, OPP_ROCKET, $13
	object SPRITE_ROCKET, $c, $9, STAY, LEFT, $2, OPP_ROCKET, $14
	object SPRITE_ROCKET, $9, $7, STAY, RIGHT, $3, OPP_ROCKET, $15
	object SPRITE_MR_FUJI, $a, $3, STAY, DOWN, $4 ; person

	; warp-to
	warp_to $9, $10, POKEMONTOWER_7_WIDTH ; POKEMONTOWER_6
