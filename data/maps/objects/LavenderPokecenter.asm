LavenderPokecenter_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, 0, LAST_MAP
	warp_event  4,  7, 0, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_NURSE, 3, 1, STAY, DOWN, 1 ; person
	object_event SPRITE_GENTLEMAN, 5, 3, STAY, NONE, 2 ; person
	object_event SPRITE_LITTLE_GIRL, 2, 6, WALK, UP_DOWN, 3 ; person
	object_event SPRITE_LINK_RECEPTIONIST, 11, 2, STAY, DOWN, 4 ; person

	def_warps_to LAVENDER_POKECENTER
