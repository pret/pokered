CinnabarVolcano_Object:
	db $7d ; border block

	def_warp_events
	warp_event 2,  23, LAST_MAP, 6
	warp_event 3,  23, LAST_MAP, 6

	def_bg_events

	def_object_events
	object_event 14,  12, SPRITE_BIRD, STAY, UP, 1, MOLTRES, 50 | OW_POKEMON

	def_warps_to CINNABAR_VOLCANO
