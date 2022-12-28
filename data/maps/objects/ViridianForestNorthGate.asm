ViridianForestNorthGate_Object:
	db $a ; border block

	def_warp_events
	warp_event  4,  0, LAST_MAP, 2
	warp_event  5,  0, LAST_MAP, 2
	warp_event  4,  7, VIRIDIAN_FOREST, 1
	warp_event  5,  7, VIRIDIAN_FOREST, 1

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_SUPER_NERD, STAY, NONE, 1 ; person
	object_event  2,  5, SPRITE_GRAMPS, STAY, NONE, 2 ; person

	def_warps_to VIRIDIAN_FOREST_NORTH_GATE
