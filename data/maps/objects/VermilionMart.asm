VermilionMart_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 3
	warp_event  4,  7, LAST_MAP, 3

	def_bg_events

	def_object_events
	object_event  0,  5, SPRITE_CLERK, STAY, RIGHT, 1 ; person
	object_event  5,  6, SPRITE_COOLTRAINER_M, STAY, NONE, 2 ; person
	object_event  3,  3, SPRITE_COOLTRAINER_F, WALK, LEFT_RIGHT, 3 ; person

	def_warps_to VERMILION_MART
