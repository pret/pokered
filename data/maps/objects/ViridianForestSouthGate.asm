ViridianForestSouthGate_Object:
	db $a ; border block

	def_warp_events
	warp_event  4,  0, 3, VIRIDIAN_FOREST
	warp_event  5,  0, 4, VIRIDIAN_FOREST
	warp_event  4,  7, 5, LAST_MAP
	warp_event  5,  7, 5, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_GIRL, 8, 4, STAY, LEFT, 1 ; person
	object_event SPRITE_LITTLE_GIRL, 2, 4, WALK, UP_DOWN, 2 ; person

	def_warps_to VIRIDIAN_FOREST_SOUTH_GATE
