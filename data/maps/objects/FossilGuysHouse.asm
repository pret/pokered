FossilGuysHouse_Object:
	db $d ; border block

	def_warp_events
	warp_event  6,  7, LAST_MAP, 9
	warp_event  7,  7, LAST_MAP, 9

	def_bg_events
	bg_event 2,  1, 4 
	bg_event 3,  1, 5 
	bg_event 8,  0, 6 
	bg_event 1,  4, 7

	def_object_events
	object_event  1,  5, SPRITE_SUPER_NERD, STAY, UP, 1 ; person
	object_event  7,  4, SPRITE_PAPER, STAY, NONE, 2 ; person
	object_event  8,  4, SPRITE_OLD_AMBER, STAY, NONE, 3 ; 

	def_warps_to FOSSIL_GUYS_HOUSE
