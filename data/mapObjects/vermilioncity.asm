VermilionCityObject:
	db 67 ; border block

	db 9 ; warps
	warp 11, 3, 0, VERMILION_POKECENTER
	warp 9, 13, 0, POKEMON_FAN_CLUB
	warp 23, 13, 0, VERMILION_MART
	warp 12, 19, 0, VERMILION_GYM
	warp 23, 19, 0, VERMILION_HOUSE_1
	warp 18, 31, 0, VERMILION_DOCK
	warp 19, 31, 0, VERMILION_DOCK
	warp 15, 13, 0, VERMILION_HOUSE_3
	warp 7, 3, 0, VERMILION_HOUSE_2

	db 7 ; signs
	sign 27, 3, 7 ; VermilionCityText7
	sign 37, 13, 8 ; VermilionCityText8
	sign 24, 13, 9 ; MartSignText
	sign 12, 3, 10 ; PokeCenterSignText
	sign 7, 13, 11 ; VermilionCityText11
	sign 7, 19, 12 ; VermilionCityText12
	sign 29, 15, 13 ; VermilionCityText13

	db 6 ; objects
	object SPRITE_FOULARD_WOMAN, 19, 7, WALK, 2, 1 ; person
	object SPRITE_GAMBLER, 14, 6, STAY, NONE, 2 ; person
	object SPRITE_SAILOR, 19, 30, STAY, UP, 3 ; person
	object SPRITE_GAMBLER, 30, 7, STAY, NONE, 4 ; person
	object SPRITE_SLOWBRO, 29, 9, WALK, 1, 5 ; person
	object SPRITE_SAILOR, 25, 27, WALK, 2, 6 ; person

	; warp-to
	warp_to 11, 3, VERMILION_CITY_WIDTH ; VERMILION_POKECENTER
	warp_to 9, 13, VERMILION_CITY_WIDTH ; POKEMON_FAN_CLUB
	warp_to 23, 13, VERMILION_CITY_WIDTH ; VERMILION_MART
	warp_to 12, 19, VERMILION_CITY_WIDTH ; VERMILION_GYM
	warp_to 23, 19, VERMILION_CITY_WIDTH ; VERMILION_HOUSE_1
	warp_to 18, 31, VERMILION_CITY_WIDTH ; VERMILION_DOCK
	warp_to 19, 31, VERMILION_CITY_WIDTH ; VERMILION_DOCK
	warp_to 15, 13, VERMILION_CITY_WIDTH ; VERMILION_HOUSE_3
	warp_to 7, 3, VERMILION_CITY_WIDTH ; VERMILION_HOUSE_2
