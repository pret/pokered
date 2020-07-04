PokemonTower7F_Object:
	db $1 ; border block

	db 1 ; warps
	warp 9, 16, 1, POKEMON_TOWER_6F

	db 0 ; signs

	db 4 ; objects
	object SPRITE_ROCKET, 9, 11, STAY, RIGHT, 1, OPP_ROCKET, 19
	object SPRITE_ROCKET, 12, 9, STAY, LEFT, 2, OPP_ROCKET, 20
	object SPRITE_ROCKET, 9, 7, STAY, RIGHT, 3, OPP_ROCKET, 21
	object SPRITE_MR_FUJI, 10, 3, STAY, DOWN, 4 ; person

	; warp-to
	warp_to 9, 16, POKEMON_TOWER_7F_WIDTH ; POKEMON_TOWER_6F
