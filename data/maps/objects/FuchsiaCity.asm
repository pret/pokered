FuchsiaCity_Object:
	db $f ; border block

	def_warps
	warp  5, 13, 0, FUCHSIA_MART
	warp 11, 27, 0, FUCHSIA_BILLS_GRANDPAS_HOUSE
	warp 19, 27, 0, FUCHSIA_POKECENTER
	warp 27, 27, 0, WARDENS_HOUSE
	warp 18,  3, 0, SAFARI_ZONE_GATE
	warp  5, 27, 0, FUCHSIA_GYM
	warp 22, 13, 0, FUCHSIA_MEETING_ROOM
	warp 31, 27, 1, FUCHSIA_GOOD_ROD_HOUSE
	warp 31, 24, 0, FUCHSIA_GOOD_ROD_HOUSE

	def_signs
	sign 15, 23, 11 ; FuchsiaCityText11
	sign 25, 15, 12 ; FuchsiaCityText12
	sign 17,  5, 13 ; FuchsiaCityText13
	sign  6, 13, 14 ; MartSignText
	sign 20, 27, 15 ; PokeCenterSignText
	sign 27, 29, 16 ; FuchsiaCityText16
	sign 21, 15, 17 ; FuchsiaCityText17
	sign  5, 29, 18 ; FuchsiaCityText18
	sign 33,  7, 19 ; FuchsiaCityText19
	sign 27,  7, 20 ; FuchsiaCityText20
	sign 13,  7, 21 ; FuchsiaCityText21
	sign 31, 13, 22 ; FuchsiaCityText22
	sign 13, 15, 23 ; FuchsiaCityText23
	sign  7,  7, 24 ; FuchsiaCityText24

	def_objects
	object SPRITE_YOUNGSTER, 10, 12, WALK, LEFT_RIGHT, 1 ; person
	object SPRITE_GAMBLER, 28, 17, WALK, LEFT_RIGHT, 2 ; person
	object SPRITE_FISHER, 30, 14, STAY, DOWN, 3 ; person
	object SPRITE_YOUNGSTER, 24, 8, STAY, UP, 4 ; person
	object SPRITE_FAIRY, 31, 5, WALK, ANY_DIR, 5 ; person
	object SPRITE_POKE_BALL, 25, 6, STAY, NONE, 6 ; person
	object SPRITE_MONSTER, 12, 6, WALK, LEFT_RIGHT, 7 ; person
	object SPRITE_MONSTER, 30, 12, WALK, LEFT_RIGHT, 8 ; person
	object SPRITE_SEEL, 8, 17, WALK, ANY_DIR, 9 ; person
	object SPRITE_FOSSIL, 6, 5, STAY, NONE, 10 ; person

	def_warps_to FUCHSIA_CITY
