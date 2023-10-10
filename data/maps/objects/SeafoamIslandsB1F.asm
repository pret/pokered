	object_const_def
	const_export SEAFOAMISLANDSB1F_BOULDER1
	const_export SEAFOAMISLANDSB1F_BOULDER2

SeafoamIslandsB1F_Object:
	db $7d ; border block

	def_warp_events
	warp_event  4,  2, SEAFOAM_ISLANDS_B2F, 1
	warp_event  7,  5, SEAFOAM_ISLANDS_1F, 5
	warp_event 13,  7, SEAFOAM_ISLANDS_B2F, 3
	warp_event 19, 15, SEAFOAM_ISLANDS_B2F, 4
	warp_event 23, 15, SEAFOAM_ISLANDS_1F, 7
	warp_event 25, 11, SEAFOAM_ISLANDS_B2F, 6
	warp_event 25,  3, SEAFOAM_ISLANDS_1F, 6

	def_bg_events

	def_object_events
	object_event 17,  6, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, TEXT_SEAFOAMISLANDSB1F_BOULDER1
	object_event 22,  6, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, TEXT_SEAFOAMISLANDSB1F_BOULDER2

	def_warps_to SEAFOAM_ISLANDS_B1F
