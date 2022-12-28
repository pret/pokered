GameCorner_Object:
	db $f ; border block

	def_warp_events
	warp_event 15, 17, LAST_MAP, 8
	warp_event 16, 17, LAST_MAP, 8
	warp_event 17,  4, ROCKET_HIDEOUT_B1F, 2

	def_bg_events
	bg_event  9,  4, 12 ; CeladonGameCornerText12

	def_object_events
	object_event  2,  6, SPRITE_BEAUTY, STAY, DOWN, 1 ; person
	object_event  5,  6, SPRITE_CLERK, STAY, DOWN, 2 ; person
	object_event  2, 10, SPRITE_MIDDLE_AGED_MAN, STAY, LEFT, 3 ; person
	object_event  2, 13, SPRITE_BEAUTY, STAY, LEFT, 4 ; person
	object_event  5, 11, SPRITE_FISHING_GURU, STAY, RIGHT, 5 ; person
	object_event  8, 11, SPRITE_MIDDLE_AGED_WOMAN, STAY, LEFT, 6 ; person
	object_event  8, 14, SPRITE_GYM_GUIDE, STAY, LEFT, 7 ; person
	object_event 11, 15, SPRITE_GAMBLER, STAY, RIGHT, 8 ; person
	object_event 14, 11, SPRITE_CLERK, STAY, LEFT, 9 ; person
	object_event 17, 13, SPRITE_GENTLEMAN, STAY, RIGHT, 10 ; person
	object_event  9,  5, SPRITE_ROCKET, STAY, UP, 11, OPP_ROCKET, 7

	def_warps_to GAME_CORNER
