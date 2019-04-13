SaffronCity_Object:
	db $f ; border block

	db 8 ; warps
	warp 7, 5, 0, COPYCATS_HOUSE_1F
	warp 26, 3, 0, FIGHTING_DOJO
	warp 34, 3, 0, SAFFRON_GYM
	warp 13, 11, 0, SAFFRON_PIDGEY_HOUSE
	warp 25, 11, 0, SAFFRON_MART
	warp 18, 21, 0, SILPH_CO_1F
	warp 9, 29, 0, SAFFRON_POKECENTER
	warp 29, 29, 0, MR_PSYCHICS_HOUSE

	db 10 ; signs
	sign 17, 5, 16 ; SaffronCityText16
	sign 27, 5, 17 ; SaffronCityText17
	sign 35, 5, 18 ; SaffronCityText18
	sign 26, 11, 19 ; MartSignText
	sign 39, 19, 20 ; SaffronCityText20
	sign 5, 21, 21 ; SaffronCityText21
	sign 15, 21, 22 ; SaffronCityText22
	sign 10, 29, 23 ; PokeCenterSignText
	sign 27, 29, 24 ; SaffronCityText24
	sign 1, 19, 25 ; SaffronCityText25

	db 15 ; objects
	object SPRITE_ROCKET, 7, 6, STAY, NONE, 1 ; person
	object SPRITE_ROCKET, 20, 8, WALK, 2, 2 ; person
	object SPRITE_ROCKET, 34, 4, STAY, NONE, 3 ; person
	object SPRITE_ROCKET, 13, 12, STAY, NONE, 4 ; person
	object SPRITE_ROCKET, 11, 25, WALK, 2, 5 ; person
	object SPRITE_ROCKET, 32, 13, WALK, 2, 6 ; person
	object SPRITE_ROCKET, 18, 30, WALK, 2, 7 ; person
	object SPRITE_OAK_AIDE, 8, 14, WALK, 0, 8 ; person
	object SPRITE_LAPRAS_GIVER, 23, 23, STAY, NONE, 9 ; person
	object SPRITE_ERIKA, 17, 30, WALK, 2, 10 ; person
	object SPRITE_GENTLEMAN, 30, 12, STAY, DOWN, 11 ; person
	object SPRITE_BIRD, 31, 12, STAY, DOWN, 12 ; person
	object SPRITE_ROCKER, 18, 8, STAY, UP, 13 ; person
	object SPRITE_ROCKET, 18, 22, STAY, DOWN, 14 ; person
	object SPRITE_ROCKET, 19, 22, STAY, DOWN, 15 ; person

	; warp-to
	warp_to 7, 5, SAFFRON_CITY_WIDTH ; COPYCATS_HOUSE_1F
	warp_to 26, 3, SAFFRON_CITY_WIDTH ; FIGHTING_DOJO
	warp_to 34, 3, SAFFRON_CITY_WIDTH ; SAFFRON_GYM
	warp_to 13, 11, SAFFRON_CITY_WIDTH ; SAFFRON_PIDGEY_HOUSE
	warp_to 25, 11, SAFFRON_CITY_WIDTH ; SAFFRON_MART
	warp_to 18, 21, SAFFRON_CITY_WIDTH ; SILPH_CO_1F
	warp_to 9, 29, SAFFRON_CITY_WIDTH ; SAFFRON_POKECENTER
	warp_to 29, 29, SAFFRON_CITY_WIDTH ; MR_PSYCHICS_HOUSE
