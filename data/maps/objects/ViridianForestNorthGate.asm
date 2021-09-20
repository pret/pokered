ViridianForestNorthGate_Object:
	db $a ; border block

	def_warp_events
	warp_event  4,  0, 1, LAST_MAP
	warp_event  5,  0, 1, LAST_MAP
	warp_event  4,  7, 0, VIRIDIAN_FOREST
	warp_event  5,  7, 0, VIRIDIAN_FOREST

	def_bg_events

	def_object_events
	object_event SPRITE_SUPER_NERD, 3, 2, STAY, NONE, 1 ; person
	object_event SPRITE_GRAMPS, 2, 5, STAY, NONE, 2 ; person

	def_warps_to VIRIDIAN_FOREST_NORTH_GATE
