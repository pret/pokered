SeafoamIslandsB1F_Object:
	db $7d ; border block

	def_warp_events
	warp_event  4,  2, 0, SEAFOAM_ISLANDS_B2F
	warp_event  7,  5, 4, SEAFOAM_ISLANDS_1F
	warp_event 13,  7, 2, SEAFOAM_ISLANDS_B2F
	warp_event 19, 15, 3, SEAFOAM_ISLANDS_B2F
	warp_event 23, 15, 6, SEAFOAM_ISLANDS_1F
	warp_event 25, 11, 5, SEAFOAM_ISLANDS_B2F
	warp_event 25,  3, 5, SEAFOAM_ISLANDS_1F

	def_bg_events

	def_objects
	object SPRITE_BOULDER, 17, 6, STAY, BOULDER_MOVEMENT_BYTE_2, 1 ; person
	object SPRITE_BOULDER, 22, 6, STAY, BOULDER_MOVEMENT_BYTE_2, 2 ; person

	def_warps_to SEAFOAM_ISLANDS_B1F
