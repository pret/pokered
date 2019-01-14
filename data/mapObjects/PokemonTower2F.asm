PokemonTower2F_Object:
	db $1 ; border block

	db 2 ; warps
	warp 3, 9, 0, POKEMON_TOWER_3F
	warp 18, 9, 2, POKEMON_TOWER_1F

	db 0 ; signs

	db 2 ; objects
	object SPRITE_BLUE, 14, 5, STAY, NONE, 1 ; person
	object SPRITE_MEDIUM, 3, 7, STAY, RIGHT, 2 ; person

	; warp-to
	warp_to 3, 9, POKEMON_TOWER_2F_WIDTH ; POKEMON_TOWER_3F
	warp_to 18, 9, POKEMON_TOWER_2F_WIDTH ; POKEMON_TOWER_1F
