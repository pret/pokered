CinnabarLabMetronomeRoom_Object:
	db $17 ; border block

	def_warp_events
	warp_event  2,  7, CINNABAR_LAB, 4
	warp_event  3,  7, CINNABAR_LAB, 4

	def_bg_events
	bg_event  0,  4, 3 ; Lab3Text3
	bg_event  1,  4, 4 ; Lab3Text4
	bg_event  2,  1, 5 ; Lab3Text5

	def_object_events
	object_event  7,  2, SPRITE_SCIENTIST, STAY, DOWN, 1 ; person
	object_event  2,  3, SPRITE_SCIENTIST, WALK, LEFT_RIGHT, 2 ; person

	def_warps_to CINNABAR_LAB_METRONOME_ROOM
