ViridianCity_Object:
	db $f ; border block

	def_warps
	warp 23, 25, 0, VIRIDIAN_POKECENTER
	warp 29, 19, 0, VIRIDIAN_MART
	warp 21, 15, 0, VIRIDIAN_SCHOOL_HOUSE
	warp 21,  9, 0, VIRIDIAN_NICKNAME_HOUSE
	warp 32,  7, 0, VIRIDIAN_GYM

	def_signs
	sign 17, 17,  8 ; ViridianCityText8
	sign 19,  1,  9 ; ViridianCityText9
	sign 21, 29, 10 ; ViridianCityText10
	sign 30, 19, 11 ; MartSignText
	sign 24, 25, 12 ; PokeCenterSignText
	sign 27,  7, 13 ; ViridianCityText13

	def_objects
	object SPRITE_YOUNGSTER, 13, 20, WALK, ANY_DIR, 1 ; person
	object SPRITE_GAMBLER, 30, 8, STAY, NONE, 2 ; person
	object SPRITE_YOUNGSTER, 30, 25, WALK, ANY_DIR, 3 ; person
	object SPRITE_GIRL, 17, 9, STAY, RIGHT, 4 ; person
	object SPRITE_GAMBLER_ASLEEP, 18, 9, STAY, NONE, 5 ; person
	object SPRITE_FISHER, 6, 23, STAY, DOWN, 6 ; person
	object SPRITE_GAMBLER, 17, 5, WALK, LEFT_RIGHT, 7 ; person

	def_warps_to VIRIDIAN_CITY
