PokemonFanClub_Object:
	db $d ; border block

	def_warps
	warp  2,  7, 1, LAST_MAP
	warp  3,  7, 1, LAST_MAP

	def_signs
	sign  1,  0, 7 ; FanClubText7
	sign  6,  0, 8 ; FanClubText8

	def_objects
	object SPRITE_FISHER, 6, 3, STAY, LEFT, 1 ; person
	object SPRITE_GIRL, 1, 3, STAY, RIGHT, 2 ; person
	object SPRITE_FAIRY, 6, 4, STAY, LEFT, 3 ; person
	object SPRITE_SEEL, 1, 4, STAY, RIGHT, 4 ; person
	object SPRITE_GENTLEMAN, 3, 1, STAY, DOWN, 5 ; person
	object SPRITE_LINK_RECEPTIONIST, 5, 1, STAY, DOWN, 6 ; person

	def_warps_to POKEMON_FAN_CLUB
