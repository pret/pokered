CinnabarVolcanoFloors_Object:
	db $03 ; border block

	def_warp_events
	warp_event  3, 15, LAST_MAP, 6
	warp_event  2, 15, LAST_MAP, 6
	warp_event  2,  2, CINNABAR_VOLCANO_FLOORS, 4
	warp_event 25,  3, CINNABAR_VOLCANO_FLOORS, 5
	warp_event 27, 12, CINNABAR_VOLCANO_FLOORS, 6
	warp_event 25, 37, CINNABAR_VOLCANO_FLOORS, 7
	warp_event 25, 25, CINNABAR_VOLCANO_FLOORS, 8
	warp_event  3, 25, CINNABAR_VOLCANO_FLOORS, 9
	warp_event 15, 25, CINNABAR_VOLCANO, 1

	def_bg_events

	def_object_events

	def_warps_to CINNABAR_VOLCANO_FLOORS
