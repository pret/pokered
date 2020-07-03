CeruleanCity_Object:
	db $f ; border block

	db 10 ; warps
	warp 27, 11, 0, CERULEAN_TRASHED_HOUSE
	warp 13, 15, 0, CERULEAN_TRADE_HOUSE
	warp 19, 17, 0, CERULEAN_POKECENTER
	warp 30, 19, 0, CERULEAN_GYM
	warp 13, 25, 0, BIKE_SHOP
	warp 25, 25, 0, CERULEAN_MART
	warp 4, 11, 0, CERULEAN_CAVE_1F
	warp 27, 9, 2, CERULEAN_TRASHED_HOUSE
	warp 9, 11, 1, CERULEAN_BADGE_HOUSE
	warp 9, 9, 0, CERULEAN_BADGE_HOUSE

	db 6 ; signs
	sign 23, 19, 12 ; CeruleanCityText12
	sign 17, 29, 13 ; CeruleanCityText13
	sign 26, 25, 14 ; MartSignText
	sign 20, 17, 15 ; PokeCenterSignText
	sign 11, 25, 16 ; CeruleanCityText16
	sign 27, 21, 17 ; CeruleanCityText17

	db 11 ; objects
	object SPRITE_BLUE, 20, 2, STAY, DOWN, 1 ; person
	object SPRITE_ROCKET, 30, 8, STAY, NONE, 2, OPP_ROCKET, 5
	object SPRITE_BLACK_HAIR_BOY_1, 31, 20, STAY, DOWN, 3 ; person
	object SPRITE_BLACK_HAIR_BOY_2, 15, 18, WALK, 1, 4 ; person
	object SPRITE_BLACK_HAIR_BOY_2, 9, 21, WALK, 2, 5 ; person
	object SPRITE_GUARD, 28, 12, STAY, DOWN, 6 ; person
	object SPRITE_LASS, 29, 26, STAY, LEFT, 7 ; person
	object SPRITE_SLOWBRO, 28, 26, STAY, DOWN, 8 ; person
	object SPRITE_LASS, 9, 27, WALK, 2, 9 ; person
	object SPRITE_BLACK_HAIR_BOY_2, 4, 12, STAY, DOWN, 10 ; person
	object SPRITE_GUARD, 27, 12, STAY, DOWN, 11 ; person

	; warp-to
	warp_to 27, 11, CERULEAN_CITY_WIDTH ; CERULEAN_TRASHED_HOUSE
	warp_to 13, 15, CERULEAN_CITY_WIDTH ; CERULEAN_TRADE_HOUSE
	warp_to 19, 17, CERULEAN_CITY_WIDTH ; CERULEAN_POKECENTER
	warp_to 30, 19, CERULEAN_CITY_WIDTH ; CERULEAN_GYM
	warp_to 13, 25, CERULEAN_CITY_WIDTH ; BIKE_SHOP
	warp_to 25, 25, CERULEAN_CITY_WIDTH ; CERULEAN_MART
	warp_to 4, 11, CERULEAN_CITY_WIDTH ; CERULEAN_CAVE_1F
	warp_to 27, 9, CERULEAN_CITY_WIDTH ; CERULEAN_TRASHED_HOUSE
	warp_to 9, 11, CERULEAN_CITY_WIDTH ; CERULEAN_BADGE_HOUSE
	warp_to 9, 9, CERULEAN_CITY_WIDTH ; CERULEAN_BADGE_HOUSE
