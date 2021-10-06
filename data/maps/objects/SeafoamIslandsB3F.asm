SeafoamIslandsB3F_Object:
	db $7d ; border block

	def_warp_events
	warp_event  5, 12, SEAFOAM_ISLANDS_B2F, 2
	warp_event  8,  6, SEAFOAM_ISLANDS_B4F, 3
	warp_event 25,  4, SEAFOAM_ISLANDS_B4F, 4
	warp_event 25,  3, SEAFOAM_ISLANDS_B2F, 5
	warp_event 25, 14, SEAFOAM_ISLANDS_B2F, 7
	warp_event 20, 17, SEAFOAM_ISLANDS_B4F, 1
	warp_event 21, 17, SEAFOAM_ISLANDS_B4F, 2

	def_bg_events

	def_object_events
	object_event  5, 14, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 1 ; person
	object_event  3, 15, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 2 ; person
	object_event  8, 14, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 3 ; person
	object_event  9, 14, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 4 ; person
	object_event 18,  6, SPRITE_BOULDER, STAY, NONE, 5 ; person
	object_event 19,  6, SPRITE_BOULDER, STAY, NONE, 6 ; person

	def_warps_to SEAFOAM_ISLANDS_B3F
