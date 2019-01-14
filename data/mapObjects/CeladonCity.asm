CeladonCity_Object:
	db $f ; border block

	db 13 ; warps
	warp 8, 13, 0, CELADON_MART_1F
	warp 10, 13, 2, CELADON_MART_1F
	warp 24, 9, 0, CELADON_MANSION_1F
	warp 24, 3, 2, CELADON_MANSION_1F
	warp 25, 3, 2, CELADON_MANSION_1F
	warp 41, 9, 0, CELADON_POKECENTER
	warp 12, 27, 0, CELADON_GYM
	warp 28, 19, 0, GAME_CORNER
	warp 39, 19, 0, CELADON_MART_5F ; beta warp! no longer used
	warp 33, 19, 0, GAME_CORNER_PRIZE_ROOM
	warp 31, 27, 0, CELADON_DINER
	warp 35, 27, 0, CELADON_CHIEF_HOUSE
	warp 43, 27, 0, CELADON_HOTEL

	db 9 ; signs
	sign 27, 15, 10 ; CeladonCityText10
	sign 19, 15, 11 ; CeladonCityText11
	sign 42, 9, 12 ; PokeCenterSignText
	sign 13, 29, 13 ; CeladonCityText13
	sign 21, 9, 14 ; CeladonCityText14
	sign 12, 13, 15 ; CeladonCityText15
	sign 39, 21, 16 ; CeladonCityText16
	sign 33, 21, 17 ; CeladonCityText17
	sign 27, 21, 18 ; CeladonCityText18

	db 9 ; objects
	object SPRITE_LITTLE_GIRL, 8, 17, WALK, 0, 1 ; person
	object SPRITE_OLD_PERSON, 11, 28, STAY, UP, 2 ; person
	object SPRITE_GIRL, 14, 19, WALK, 1, 3 ; person
	object SPRITE_OLD_PERSON, 25, 22, STAY, DOWN, 4 ; person
	object SPRITE_OLD_PERSON, 22, 16, STAY, DOWN, 5 ; person
	object SPRITE_FISHER2, 32, 12, STAY, LEFT, 6 ; person
	object SPRITE_SLOWBRO, 30, 12, STAY, RIGHT, 7 ; person
	object SPRITE_ROCKET, 32, 29, WALK, 2, 8 ; person
	object SPRITE_ROCKET, 42, 14, WALK, 2, 9 ; person

	; warp-to
	warp_to 8, 13, CELADON_CITY_WIDTH ; CELADON_MART_1F
	warp_to 10, 13, CELADON_CITY_WIDTH ; CELADON_MART_1F
	warp_to 24, 9, CELADON_CITY_WIDTH ; CELADON_MANSION_1F
	warp_to 24, 3, CELADON_CITY_WIDTH ; CELADON_MANSION_1F
	warp_to 25, 3, CELADON_CITY_WIDTH ; CELADON_MANSION_1F
	warp_to 41, 9, CELADON_CITY_WIDTH ; CELADON_POKECENTER
	warp_to 12, 27, CELADON_CITY_WIDTH ; CELADON_GYM
	warp_to 28, 19, CELADON_CITY_WIDTH ; GAME_CORNER
	warp_to 39, 19, CELADON_CITY_WIDTH ; CELADON_MART_5F
	warp_to 33, 19, CELADON_CITY_WIDTH ; GAME_CORNER_PRIZE_ROOM
	warp_to 31, 27, CELADON_CITY_WIDTH ; CELADON_DINER
	warp_to 35, 27, CELADON_CITY_WIDTH ; CELADON_CHIEF_HOUSE
	warp_to 43, 27, CELADON_CITY_WIDTH ; CELADON_HOTEL
