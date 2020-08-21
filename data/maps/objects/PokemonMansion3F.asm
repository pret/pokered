PokemonMansion3F_Object:
	db $1 ; border block

	def_warps
	warp  7, 10, 1, POKEMON_MANSION_2F
	warp  6,  1, 3, POKEMON_MANSION_2F
	warp 25, 14, 2, POKEMON_MANSION_2F

	def_signs

	def_objects
	object SPRITE_SUPER_NERD, 5, 11, WALK, LEFT_RIGHT, 1, OPP_BURGLAR, 8
	object SPRITE_SCIENTIST, 20, 11, STAY, LEFT, 2, OPP_SCIENTIST, 12
	object SPRITE_POKE_BALL, 1, 16, STAY, NONE, 3, MAX_POTION
	object SPRITE_POKE_BALL, 25, 5, STAY, NONE, 4, IRON
	object SPRITE_POKEDEX, 6, 12, STAY, NONE, 5 ; person

	def_warps_to POKEMON_MANSION_3F
