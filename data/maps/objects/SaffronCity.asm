SaffronCity_Object:
	db $f ; border block

	def_warps
	warp  7,  5, 0, COPYCATS_HOUSE_1F
	warp 26,  3, 0, FIGHTING_DOJO
	warp 34,  3, 0, SAFFRON_GYM
	warp 13, 11, 0, SAFFRON_PIDGEY_HOUSE
	warp 25, 11, 0, SAFFRON_MART
	warp 18, 21, 0, SILPH_CO_1F
	warp  9, 29, 0, SAFFRON_POKECENTER
	warp 29, 29, 0, MR_PSYCHICS_HOUSE

	def_signs
	sign 17,  5, 16 ; SaffronCityText16
	sign 27,  5, 17 ; SaffronCityText17
	sign 35,  5, 18 ; SaffronCityText18
	sign 26, 11, 19 ; MartSignText
	sign 39, 19, 20 ; SaffronCityText20
	sign  5, 21, 21 ; SaffronCityText21
	sign 15, 21, 22 ; SaffronCityText22
	sign 10, 29, 23 ; PokeCenterSignText
	sign 27, 29, 24 ; SaffronCityText24
	sign  1, 19, 25 ; SaffronCityText25

	def_objects
	object SPRITE_ROCKET, 7, 6, STAY, NONE, 1 ; person
	object SPRITE_ROCKET, 20, 8, WALK, LEFT_RIGHT, 2 ; person
	object SPRITE_ROCKET, 34, 4, STAY, NONE, 3 ; person
	object SPRITE_ROCKET, 13, 12, STAY, NONE, 4 ; person
	object SPRITE_ROCKET, 11, 25, WALK, LEFT_RIGHT, 5 ; person
	object SPRITE_ROCKET, 32, 13, WALK, LEFT_RIGHT, 6 ; person
	object SPRITE_ROCKET, 18, 30, WALK, LEFT_RIGHT, 7 ; person
	object SPRITE_SCIENTIST, 8, 14, WALK, ANY_DIR, 8 ; person
	object SPRITE_SILPH_WORKER, 23, 23, STAY, NONE, 9 ; person
	object SPRITE_ERIKA, 17, 30, WALK, LEFT_RIGHT, 10 ; person
	object SPRITE_GENTLEMAN, 30, 12, STAY, DOWN, 11 ; person
	object SPRITE_BIRD, 31, 12, STAY, DOWN, 12 ; person
	object SPRITE_ROCKER, 18, 8, STAY, UP, 13 ; person
	object SPRITE_ROCKET, 18, 22, STAY, DOWN, 14 ; person
	object SPRITE_ROCKET, 19, 22, STAY, DOWN, 15 ; person

	def_warps_to SAFFRON_CITY
