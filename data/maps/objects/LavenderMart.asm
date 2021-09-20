LavenderMart_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, 3, LAST_MAP
	warp_event  4,  7, 3, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_CLERK, 0, 5, STAY, RIGHT, 1 ; person
	object_event SPRITE_BALDING_GUY, 3, 4, STAY, NONE, 2 ; person
	object_event SPRITE_COOLTRAINER_M, 7, 2, STAY, NONE, 3 ; person

	def_warps_to LAVENDER_MART
