CeladonMart5F_Object:
	db $f ; border block

	def_warp_events
	warp_event 12,  1, CELADON_MART_ROOF, 1
	warp_event 16,  1, CELADON_MART_4F, 2
	warp_event  1,  1, CELADON_MART_ELEVATOR, 1

	def_bg_events
	bg_event 14,  1, 5 ; CeladonMart5Text5

	def_object_events
	object_event 14,  5, SPRITE_GENTLEMAN, WALK, UP_DOWN, 1 ; person
	object_event  2,  6, SPRITE_SAILOR, STAY, NONE, 2 ; person
	object_event  5,  3, SPRITE_CLERK, STAY, DOWN, 3 ; person
	object_event  6,  3, SPRITE_CLERK, STAY, DOWN, 4 ; person

	def_warps_to CELADON_MART_5F
