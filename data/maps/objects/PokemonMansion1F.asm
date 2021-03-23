PokemonMansion1F_Object:
	db $2e ; border block

	def_warps
	warp  4, 27, 0, LAST_MAP
	warp  5, 27, 0, LAST_MAP
	warp  6, 27, 0, LAST_MAP
	warp  7, 27, 0, LAST_MAP
	warp  5, 10, 0, POKEMON_MANSION_2F
	warp 21, 23, 0, POKEMON_MANSION_B1F
	warp 26, 27, 0, LAST_MAP
	warp 27, 27, 0, LAST_MAP

	def_signs

	def_objects
	object SPRITE_SCIENTIST, 17, 17, STAY, LEFT, 1, OPP_SCIENTIST, 4
	object SPRITE_POKE_BALL, 14, 3, STAY, NONE, 2, ESCAPE_ROPE
	object SPRITE_POKE_BALL, 18, 21, STAY, NONE, 3, CARBOS

	def_warps_to POKEMON_MANSION_1F
