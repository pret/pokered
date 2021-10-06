FuchsiaCity_Object:
	db $f ; border block

	def_warp_events
	warp_event  5, 13, FUCHSIA_MART, 1
	warp_event 11, 27, FUCHSIA_BILLS_GRANDPAS_HOUSE, 1
	warp_event 19, 27, FUCHSIA_POKECENTER, 1
	warp_event 27, 27, WARDENS_HOUSE, 1
	warp_event 18,  3, SAFARI_ZONE_GATE, 1
	warp_event  5, 27, FUCHSIA_GYM, 1
	warp_event 22, 13, FUCHSIA_MEETING_ROOM, 1
	warp_event 31, 27, FUCHSIA_GOOD_ROD_HOUSE, 2
	warp_event 31, 24, FUCHSIA_GOOD_ROD_HOUSE, 1

	def_bg_events
	bg_event 15, 23, 11 ; FuchsiaCityText11
	bg_event 25, 15, 12 ; FuchsiaCityText12
	bg_event 17,  5, 13 ; FuchsiaCityText13
	bg_event  6, 13, 14 ; MartSignText
	bg_event 20, 27, 15 ; PokeCenterSignText
	bg_event 27, 29, 16 ; FuchsiaCityText16
	bg_event 21, 15, 17 ; FuchsiaCityText17
	bg_event  5, 29, 18 ; FuchsiaCityText18
	bg_event 33,  7, 19 ; FuchsiaCityText19
	bg_event 27,  7, 20 ; FuchsiaCityText20
	bg_event 13,  7, 21 ; FuchsiaCityText21
	bg_event 31, 13, 22 ; FuchsiaCityText22
	bg_event 13, 15, 23 ; FuchsiaCityText23
	bg_event  7,  7, 24 ; FuchsiaCityText24

	def_object_events
	object_event 10, 12, SPRITE_YOUNGSTER, WALK, LEFT_RIGHT, 1 ; person
	object_event 28, 17, SPRITE_GAMBLER, WALK, LEFT_RIGHT, 2 ; person
	object_event 30, 14, SPRITE_FISHER, STAY, DOWN, 3 ; person
	object_event 24,  8, SPRITE_YOUNGSTER, STAY, UP, 4 ; person
	object_event 31,  5, SPRITE_FAIRY, WALK, ANY_DIR, 5 ; person
	object_event 25,  6, SPRITE_POKE_BALL, STAY, NONE, 6 ; person
	object_event 12,  6, SPRITE_MONSTER, WALK, LEFT_RIGHT, 7 ; person
	object_event 30, 12, SPRITE_MONSTER, WALK, LEFT_RIGHT, 8 ; person
	object_event  8, 17, SPRITE_SEEL, WALK, ANY_DIR, 9 ; person
	object_event  6,  5, SPRITE_FOSSIL, STAY, NONE, 10 ; person

	def_warps_to FUCHSIA_CITY
