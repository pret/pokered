CinnabarLabFossilRoom_Object:
	db $17 ; border block

	def_warp_events
	warp_event  2,  7, 4, CINNABAR_LAB
	warp_event  3,  7, 4, CINNABAR_LAB

	def_bg_events

	def_object_events
	object_event SPRITE_SCIENTIST, 5, 2, WALK, LEFT_RIGHT, 1 ; person
	object_event SPRITE_SCIENTIST, 7, 6, STAY, UP, 2 ; person

	def_warps_to CINNABAR_LAB_FOSSIL_ROOM
