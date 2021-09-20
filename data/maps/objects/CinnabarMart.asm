CinnabarMart_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, 4, LAST_MAP
	warp_event  4,  7, 4, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_CLERK, 0, 5, STAY, RIGHT, 1 ; person
	object_event SPRITE_ERIKA, 6, 2, STAY, NONE, 2 ; person
	object_event SPRITE_SCIENTIST, 3, 4, STAY, NONE, 3 ; person

	def_warps_to CINNABAR_MART
