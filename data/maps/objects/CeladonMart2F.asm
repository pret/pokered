CeladonMart2F_Object:
	db $f ; border block

	def_warp_events
	warp_event 12,  1, CELADON_MART_1F, 5
	warp_event 16,  1, CELADON_MART_3F, 2
	warp_event  1,  1, CELADON_MART_ELEVATOR, 1

	def_bg_events
	bg_event 14,  1, 5 ; CeladonMart2Text5

	def_object_events
	object_event  5,  3, SPRITE_CLERK, STAY, DOWN, 1 ; person
	object_event  6,  3, SPRITE_CLERK, STAY, DOWN, 2 ; person
	object_event 19,  5, SPRITE_MIDDLE_AGED_MAN, STAY, NONE, 3 ; person
	object_event 14,  4, SPRITE_GIRL, WALK, UP_DOWN, 4 ; person

	def_warps_to CELADON_MART_2F
