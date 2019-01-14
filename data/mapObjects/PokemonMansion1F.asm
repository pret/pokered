PokemonMansion1F_Object:
	db $2e ; border block

	db 8 ; warps
	warp 4, 27, 0, -1
	warp 5, 27, 0, -1
	warp 6, 27, 0, -1
	warp 7, 27, 0, -1
	warp 5, 10, 0, POKEMON_MANSION_2F
	warp 21, 23, 0, POKEMON_MANSION_B1F
	warp 26, 27, 0, -1
	warp 27, 27, 0, -1

	db 0 ; signs

	db 3 ; objects
	object SPRITE_OAK_AIDE, 17, 17, STAY, LEFT, 1, OPP_SCIENTIST, 4
	object SPRITE_BALL, 14, 3, STAY, NONE, 2, ESCAPE_ROPE
	object SPRITE_BALL, 18, 21, STAY, NONE, 3, CARBOS

	; warp-to
	warp_to 4, 27, POKEMON_MANSION_1F_WIDTH
	warp_to 5, 27, POKEMON_MANSION_1F_WIDTH
	warp_to 6, 27, POKEMON_MANSION_1F_WIDTH
	warp_to 7, 27, POKEMON_MANSION_1F_WIDTH
	warp_to 5, 10, POKEMON_MANSION_1F_WIDTH ; POKEMON_MANSION_2F
	warp_to 21, 23, POKEMON_MANSION_1F_WIDTH ; POKEMON_MANSION_B1F
	warp_to 26, 27, POKEMON_MANSION_1F_WIDTH
	warp_to 27, 27, POKEMON_MANSION_1F_WIDTH
