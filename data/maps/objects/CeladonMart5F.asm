CeladonMart5F_Object:
	db $f ; border block

	def_warp_events
	warp_event 12,  1, 0, CELADON_MART_ROOF
	warp_event 16,  1, 1, CELADON_MART_4F
	warp_event  1,  1, 0, CELADON_MART_ELEVATOR

	def_bg_events
	bg_event 14,  1, 5 ; CeladonMart5Text5

	def_object_events
	object_event SPRITE_GENTLEMAN, 14, 5, WALK, UP_DOWN, 1 ; person
	object_event SPRITE_SAILOR, 2, 6, STAY, NONE, 2 ; person
	object_event SPRITE_CLERK, 5, 3, STAY, DOWN, 3 ; person
	object_event SPRITE_CLERK, 6, 3, STAY, DOWN, 4 ; person

	def_warps_to CELADON_MART_5F
