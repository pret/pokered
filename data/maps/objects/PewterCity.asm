PewterCity_Object:
	db $a ; border block

	def_warps
	warp 14,  7, 0, MUSEUM_1F
	warp 19,  5, 2, MUSEUM_1F
	warp 16, 17, 0, PEWTER_GYM
	warp 29, 13, 0, PEWTER_NIDORAN_HOUSE
	warp 23, 17, 0, PEWTER_MART
	warp  7, 29, 0, PEWTER_SPEECH_HOUSE
	warp 13, 25, 0, PEWTER_POKECENTER

	def_bg_events
	bg_event 19, 29,  6 ; PewterCityText6
	bg_event 33, 19,  7 ; PewterCityText7
	bg_event 24, 17,  8 ; MartSignText
	bg_event 14, 25,  9 ; PokeCenterSignText
	bg_event 15,  9, 10 ; PewterCityText10
	bg_event 11, 17, 11 ; PewterCityText11
	bg_event 25, 23, 12 ; PewterCityText12

	def_objects
	object SPRITE_COOLTRAINER_F, 8, 15, STAY, NONE, 1 ; person
	object SPRITE_COOLTRAINER_M, 17, 25, STAY, NONE, 2 ; person
	object SPRITE_SUPER_NERD, 27, 17, STAY, NONE, 3 ; person
	object SPRITE_SUPER_NERD, 26, 25, WALK, LEFT_RIGHT, 4 ; person
	object SPRITE_YOUNGSTER, 35, 16, STAY, DOWN, 5 ; person

	def_warps_to PEWTER_CITY
