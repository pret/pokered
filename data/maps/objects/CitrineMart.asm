CitrineMart_Object:
	db $0e ; border block

	def_warp_events
	warp_event  2,  7, CITRINE_CITY, 4
	warp_event  3,  7, CITRINE_CITY, 4

	def_bg_events

	def_object_events
	object_event  2,  1, SPRITE_CLERK, STAY, RIGHT, 1 ; person
	object_event  6,  6, SPRITE_COOLTRAINER_F, STAY, UP, 2 ; person
	object_event  7,  6, SPRITE_CAT, STAY, UP, 3 ; person
	object_event  1,  1, SPRITE_CLEFAIRY, STAY, DOWN, 4 ; person

	def_warps_to CITRINE_MART
