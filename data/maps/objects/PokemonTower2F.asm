PokemonTower2F_Object:
	db $1 ; border block

	def_warps
	warp  3,  9, 0, POKEMON_TOWER_3F
	warp 18,  9, 2, POKEMON_TOWER_1F

	def_signs

	def_objects
	object SPRITE_BLUE, 14, 5, STAY, NONE, 1 ; person
	object SPRITE_CHANNELER, 3, 7, STAY, RIGHT, 2 ; person

	def_warps_to POKEMON_TOWER_2F
