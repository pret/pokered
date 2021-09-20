CeladonMart2F_Object:
	db $f ; border block

	def_warp_events
	warp_event 12,  1, 4, CELADON_MART_1F
	warp_event 16,  1, 1, CELADON_MART_3F
	warp_event  1,  1, 0, CELADON_MART_ELEVATOR

	def_bg_events
	bg_event 14,  1, 5 ; CeladonMart2Text5

	def_object_events
	object_event SPRITE_CLERK, 5, 3, STAY, DOWN, 1 ; person
	object_event SPRITE_CLERK, 6, 3, STAY, DOWN, 2 ; person
	object_event SPRITE_MIDDLE_AGED_MAN, 19, 5, STAY, NONE, 3 ; person
	object_event SPRITE_GIRL, 14, 4, WALK, UP_DOWN, 4 ; person

	def_warps_to CELADON_MART_2F
