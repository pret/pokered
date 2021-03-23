CeruleanCity_Object:
	db $f ; border block

	def_warps
	warp 27, 11, 0, CERULEAN_TRASHED_HOUSE
	warp 13, 15, 0, CERULEAN_TRADE_HOUSE
	warp 19, 17, 0, CERULEAN_POKECENTER
	warp 30, 19, 0, CERULEAN_GYM
	warp 13, 25, 0, BIKE_SHOP
	warp 25, 25, 0, CERULEAN_MART
	warp  4, 11, 0, CERULEAN_CAVE_1F
	warp 27,  9, 2, CERULEAN_TRASHED_HOUSE
	warp  9, 11, 1, CERULEAN_BADGE_HOUSE
	warp  9,  9, 0, CERULEAN_BADGE_HOUSE

	def_signs
	sign 23, 19, 12 ; CeruleanCityText12
	sign 17, 29, 13 ; CeruleanCityText13
	sign 26, 25, 14 ; MartSignText
	sign 20, 17, 15 ; PokeCenterSignText
	sign 11, 25, 16 ; CeruleanCityText16
	sign 27, 21, 17 ; CeruleanCityText17

	def_objects
	object SPRITE_BLUE, 20, 2, STAY, DOWN, 1 ; person
	object SPRITE_ROCKET, 30, 8, STAY, NONE, 2, OPP_ROCKET, 5
	object SPRITE_COOLTRAINER_M, 31, 20, STAY, DOWN, 3 ; person
	object SPRITE_SUPER_NERD, 15, 18, WALK, UP_DOWN, 4 ; person
	object SPRITE_SUPER_NERD, 9, 21, WALK, LEFT_RIGHT, 5 ; person
	object SPRITE_GUARD, 28, 12, STAY, DOWN, 6 ; person
	object SPRITE_COOLTRAINER_F, 29, 26, STAY, LEFT, 7 ; person
	object SPRITE_MONSTER, 28, 26, STAY, DOWN, 8 ; person
	object SPRITE_COOLTRAINER_F, 9, 27, WALK, LEFT_RIGHT, 9 ; person
	object SPRITE_SUPER_NERD, 4, 12, STAY, DOWN, 10 ; person
	object SPRITE_GUARD, 27, 12, STAY, DOWN, 11 ; person

	def_warps_to CERULEAN_CITY
