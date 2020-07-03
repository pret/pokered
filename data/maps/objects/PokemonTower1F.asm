PokemonTower1F_Object:
	db $1 ; border block

	db 3 ; warps
	warp 10, 17, 1, -1
	warp 11, 17, 1, -1
	warp 18, 9, 1, POKEMON_TOWER_2F

	db 0 ; signs

	db 5 ; objects
	object SPRITE_CABLE_CLUB_WOMAN, 15, 13, STAY, UP, 1 ; person
	object SPRITE_MOM_GEISHA, 6, 8, STAY, NONE, 2 ; person
	object SPRITE_BALDING_GUY, 8, 12, STAY, NONE, 3 ; person
	object SPRITE_GIRL, 13, 7, STAY, NONE, 4 ; person
	object SPRITE_MEDIUM, 17, 7, STAY, LEFT, 5 ; person

	; warp-to
	warp_to 10, 17, POKEMON_TOWER_1F_WIDTH
	warp_to 11, 17, POKEMON_TOWER_1F_WIDTH
	warp_to 18, 9, POKEMON_TOWER_1F_WIDTH ; POKEMON_TOWER_2F
