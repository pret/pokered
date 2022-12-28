ViridianForestSouthGate_Object:
	db $a ; border block

	def_warp_events
	warp_event  4,  0, VIRIDIAN_FOREST, 4
	warp_event  5,  0, VIRIDIAN_FOREST, 5
	warp_event  4,  7, LAST_MAP, 6
	warp_event  5,  7, LAST_MAP, 6

	def_bg_events

	def_object_events
	object_event  8,  4, SPRITE_GIRL, STAY, LEFT, 1 ; person
	object_event  2,  4, SPRITE_LITTLE_GIRL, WALK, UP_DOWN, 2 ; person

	def_warps_to VIRIDIAN_FOREST_SOUTH_GATE
