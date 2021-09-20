CinnabarLabMetronomeRoom_Object:
	db $17 ; border block

	def_warp_events
	warp_event  2,  7, 3, CINNABAR_LAB
	warp_event  3,  7, 3, CINNABAR_LAB

	def_bg_events
	bg_event  0,  4, 3 ; Lab3Text3
	bg_event  1,  4, 4 ; Lab3Text4
	bg_event  2,  1, 5 ; Lab3Text5

	def_object_events
	object_event SPRITE_SCIENTIST, 7, 2, STAY, DOWN, 1 ; person
	object_event SPRITE_SCIENTIST, 2, 3, WALK, LEFT_RIGHT, 2 ; person

	def_warps_to CINNABAR_LAB_METRONOME_ROOM
