CinnabarLab_Object:
	db $17 ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 3
	warp_event  3,  7, LAST_MAP, 3
	warp_event  8,  4, CINNABAR_LAB_TRADE_ROOM, 1
	warp_event 12,  4, CINNABAR_LAB_METRONOME_ROOM, 1
	warp_event 16,  4, CINNABAR_LAB_FOSSIL_ROOM, 1

	def_bg_events
	bg_event  3,  2, 2 ; Lab1Text2
	bg_event  9,  4, 3 ; Lab1Text3
	bg_event 13,  4, 4 ; Lab1Text4
	bg_event 17,  4, 5 ; Lab1Text5

	def_object_events
	object_event  1,  3, SPRITE_FISHING_GURU, STAY, NONE, 1 ; person

	def_warps_to CINNABAR_LAB
