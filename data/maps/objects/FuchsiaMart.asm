FuchsiaMart_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, 0, LAST_MAP
	warp_event  4,  7, 0, LAST_MAP

	def_bg_events

	def_objects
	object SPRITE_CLERK, 0, 5, STAY, RIGHT, 1 ; person
	object SPRITE_MIDDLE_AGED_MAN, 4, 2, STAY, NONE, 2 ; person
	object SPRITE_COOLTRAINER_F, 6, 5, WALK, UP_DOWN, 3 ; person

	def_warps_to FUCHSIA_MART
