SeafoamIslandsB4F_Object:
	db $7d ; border block

	def_warp_events
	warp_event 20, 17, SEAFOAM_ISLANDS_B3F, 6
	warp_event 21, 17, SEAFOAM_ISLANDS_B3F, 7
	warp_event 11,  7, SEAFOAM_ISLANDS_B3F, 2
	warp_event 25,  4, SEAFOAM_ISLANDS_B3F, 3

	def_bg_events
	bg_event  9, 15, 4 ; SeafoamIslands5Text4
	bg_event 23,  1, 5 ; SeafoamIslands5Text5

	def_object_events
	object_event  4, 15, SPRITE_BOULDER, STAY, NONE, 1 ; person
	object_event  5, 15, SPRITE_BOULDER, STAY, NONE, 2 ; person
	object_event  6,  1, SPRITE_BIRD, STAY, DOWN, 3, ARTICUNO, 50

	def_warps_to SEAFOAM_ISLANDS_B4F
