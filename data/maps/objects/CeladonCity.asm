CeladonCity_Object:
	db $f ; border block

	def_warp_events
	warp_event  8, 13, 0, CELADON_MART_1F
	warp_event 10, 13, 2, CELADON_MART_1F
	warp_event 24,  9, 0, CELADON_MANSION_1F
	warp_event 24,  3, 2, CELADON_MANSION_1F
	warp_event 25,  3, 2, CELADON_MANSION_1F
	warp_event 41,  9, 0, CELADON_POKECENTER
	warp_event 12, 27, 0, CELADON_GYM
	warp_event 28, 19, 0, GAME_CORNER
	warp_event 39, 19, 0, CELADON_MART_5F ; beta warp_event! no longer used
	warp_event 33, 19, 0, GAME_CORNER_PRIZE_ROOM
	warp_event 31, 27, 0, CELADON_DINER
	warp_event 35, 27, 0, CELADON_CHIEF_HOUSE
	warp_event 43, 27, 0, CELADON_HOTEL

	def_bg_events
	bg_event 27, 15, 10 ; CeladonCityText10
	bg_event 19, 15, 11 ; CeladonCityText11
	bg_event 42,  9, 12 ; PokeCenterSignText
	bg_event 13, 29, 13 ; CeladonCityText13
	bg_event 21,  9, 14 ; CeladonCityText14
	bg_event 12, 13, 15 ; CeladonCityText15
	bg_event 39, 21, 16 ; CeladonCityText16
	bg_event 33, 21, 17 ; CeladonCityText17
	bg_event 27, 21, 18 ; CeladonCityText18

	def_object_events
	object_event SPRITE_LITTLE_GIRL, 8, 17, WALK, ANY_DIR, 1 ; person
	object_event SPRITE_GRAMPS, 11, 28, STAY, UP, 2 ; person
	object_event SPRITE_GIRL, 14, 19, WALK, UP_DOWN, 3 ; person
	object_event SPRITE_GRAMPS, 25, 22, STAY, DOWN, 4 ; person
	object_event SPRITE_GRAMPS, 22, 16, STAY, DOWN, 5 ; person
	object_event SPRITE_FISHER, 32, 12, STAY, LEFT, 6 ; person
	object_event SPRITE_MONSTER, 30, 12, STAY, RIGHT, 7 ; person
	object_event SPRITE_ROCKET, 32, 29, WALK, LEFT_RIGHT, 8 ; person
	object_event SPRITE_ROCKET, 42, 14, WALK, LEFT_RIGHT, 9 ; person

	def_warps_to CELADON_CITY
