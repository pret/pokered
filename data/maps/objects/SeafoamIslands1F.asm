SeafoamIslands1F_Object:
	db $7d ; border block

	def_warp_events
	warp_event  4, 17, 0, LAST_MAP
	warp_event  5, 17, 0, LAST_MAP
	warp_event 26, 17, 1, LAST_MAP
	warp_event 27, 17, 1, LAST_MAP
	warp_event  7,  5, 1, SEAFOAM_ISLANDS_B1F
	warp_event 25,  3, 6, SEAFOAM_ISLANDS_B1F
	warp_event 23, 15, 4, SEAFOAM_ISLANDS_B1F

	def_bg_events

	def_object_events
	object_event SPRITE_BOULDER, 18, 10, STAY, BOULDER_MOVEMENT_BYTE_2, 1 ; person
	object_event SPRITE_BOULDER, 26, 7, STAY, BOULDER_MOVEMENT_BYTE_2, 2 ; person

	def_warps_to SEAFOAM_ISLANDS_1F

	; holes
	warp_to 17, 6, SEAFOAM_ISLANDS_1F_WIDTH
	warp_to 24, 6, SEAFOAM_ISLANDS_1F_WIDTH
