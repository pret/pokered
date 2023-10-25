	object_const_def
	const_export SEAFOAMISLANDSB2F_BOULDER1
	const_export SEAFOAMISLANDSB2F_BOULDER2

SeafoamIslandsB2F_Object:
	db $7d ; border block

	def_warp_events
	warp_event  5,  3, SEAFOAM_ISLANDS_B1F, 1
	warp_event  5, 13, SEAFOAM_ISLANDS_B3F, 1
	warp_event 13,  7, SEAFOAM_ISLANDS_B1F, 3
	warp_event 19, 15, SEAFOAM_ISLANDS_B1F, 4
	warp_event 25,  3, SEAFOAM_ISLANDS_B3F, 4
	warp_event 25, 11, SEAFOAM_ISLANDS_B1F, 6
	warp_event 25, 14, SEAFOAM_ISLANDS_B3F, 5

	def_bg_events

	def_object_events
	object_event 18,  6, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, TEXT_SEAFOAMISLANDSB2F_BOULDER1
	object_event 23,  6, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, TEXT_SEAFOAMISLANDSB2F_BOULDER2

	def_warps_to SEAFOAM_ISLANDS_B2F
