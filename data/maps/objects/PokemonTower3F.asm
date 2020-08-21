PokemonTower3F_Object:
	db $1 ; border block

	def_warps
	warp  3,  9, 0, POKEMON_TOWER_2F
	warp 18,  9, 1, POKEMON_TOWER_4F

	def_signs

	def_objects
	object SPRITE_CHANNELER, 12, 3, STAY, LEFT, 1, OPP_CHANNELER, 5
	object SPRITE_CHANNELER, 9, 8, STAY, DOWN, 2, OPP_CHANNELER, 6
	object SPRITE_CHANNELER, 10, 13, STAY, DOWN, 3, OPP_CHANNELER, 8
	object SPRITE_POKE_BALL, 12, 1, STAY, NONE, 4, ESCAPE_ROPE

	def_warps_to POKEMON_TOWER_3F
