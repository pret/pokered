CinnabarVolcano_Object:
	db $7d ; border block

	def_warp_events 
	warp_event 13, 21, CINNABAR_VOLCANO_FLOORS, 9

	def_bg_events

	def_object_events
	object_event 14,  8, SPRITE_BIRD, STAY, UP, 1, MOLTRES, 50 | OW_POKEMON

	def_warps_to CINNABAR_VOLCANO
