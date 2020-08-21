PokemonTower1F_Object:
	db $1 ; border block

	def_warps
	warp 10, 17, 1, LAST_MAP
	warp 11, 17, 1, LAST_MAP
	warp 18,  9, 1, POKEMON_TOWER_2F

	def_signs

	def_objects
	object SPRITE_LINK_RECEPTIONIST, 15, 13, STAY, UP, 1 ; person
	object SPRITE_MIDDLE_AGED_WOMAN, 6, 8, STAY, NONE, 2 ; person
	object SPRITE_BALDING_GUY, 8, 12, STAY, NONE, 3 ; person
	object SPRITE_GIRL, 13, 7, STAY, NONE, 4 ; person
	object SPRITE_CHANNELER, 17, 7, STAY, LEFT, 5 ; person

	def_warps_to POKEMON_TOWER_1F
