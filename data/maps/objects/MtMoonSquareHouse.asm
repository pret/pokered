MtMoonSquareHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  4,  7, MT_MOON_SQUARE, 4
	warp_event  5,  7, MT_MOON_SQUARE, 4

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_BRUNETTE_GIRL, WALK, UP_DOWN, 1 ; person
	object_event  0,  2, SPRITE_GRAMPS, STAY, RIGHT, 2 ; person

	def_warps_to MT_MOON_SQUARE_HOUSE
