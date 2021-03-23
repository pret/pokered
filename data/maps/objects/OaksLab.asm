OaksLab_Object:
	db $3 ; border block

	def_warps
	warp  4, 11, 2, LAST_MAP
	warp  5, 11, 2, LAST_MAP

	def_signs

	def_objects
	object SPRITE_BLUE, 4, 3, STAY, NONE, 1, OPP_RIVAL1, 1
	object SPRITE_POKE_BALL, 6, 3, STAY, NONE, 2 ; person
	object SPRITE_POKE_BALL, 7, 3, STAY, NONE, 3 ; person
	object SPRITE_POKE_BALL, 8, 3, STAY, NONE, 4 ; person
	object SPRITE_OAK, 5, 2, STAY, DOWN, 5 ; person
	object SPRITE_POKEDEX, 2, 1, STAY, NONE, 6 ; person
	object SPRITE_POKEDEX, 3, 1, STAY, NONE, 7 ; person
	object SPRITE_OAK, 5, 10, STAY, UP, 8 ; person
	object SPRITE_GIRL, 1, 9, WALK, UP_DOWN, 9 ; person
	object SPRITE_SCIENTIST, 2, 10, STAY, NONE, 10 ; person
	object SPRITE_SCIENTIST, 8, 10, STAY, NONE, 11 ; person

	def_warps_to OAKS_LAB
