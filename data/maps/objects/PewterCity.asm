PewterCity_Object:
	db $a ; border block

	def_warp_events
	warp_event 14,  7, MUSEUM_1F, 1
	warp_event 19,  5, MUSEUM_1F, 3
	warp_event 16, 17, PEWTER_GYM, 1
	warp_event 29, 13, PEWTER_NIDORAN_HOUSE, 1
	warp_event 23, 17, PEWTER_MART, 1
	warp_event  7, 29, PEWTER_SPEECH_HOUSE, 1
	warp_event 13, 25, PEWTER_POKECENTER, 1

	def_bg_events
	bg_event 19, 29,  6 ; PewterCityText6
	bg_event 33, 19,  7 ; PewterCityText7
	bg_event 24, 17,  8 ; MartSignText
	bg_event 14, 25,  9 ; PokeCenterSignText
	bg_event 15,  9, 10 ; PewterCityText10
	bg_event 11, 17, 11 ; PewterCityText11
	bg_event 25, 23, 12 ; PewterCityText12

	def_object_events
	object_event  8, 15, SPRITE_COOLTRAINER_F, STAY, NONE, 1 ; person
	object_event 17, 25, SPRITE_COOLTRAINER_M, STAY, NONE, 2 ; person
	object_event 27, 17, SPRITE_SUPER_NERD, STAY, NONE, 3 ; person
	object_event 26, 25, SPRITE_SUPER_NERD, WALK, LEFT_RIGHT, 4 ; person
	object_event 35, 16, SPRITE_YOUNGSTER, STAY, DOWN, 5 ; person

	def_warps_to PEWTER_CITY
