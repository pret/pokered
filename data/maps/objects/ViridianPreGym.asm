ViridianPreGym_Object:
	db $0 ; border block

	def_warp_events
	warp_event 5, 13, LAST_MAP, 7
	warp_event 4, 13, LAST_MAP, 7

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_YOUNGSTER, STAY, NONE, 1 ; person, Yujirou
	object_event  5,  2, SPRITE_YOUNGSTER, STAY, NONE, 2 ; person, Yujirou 2

	def_warps_to VIRIDIAN_PRE_GYM