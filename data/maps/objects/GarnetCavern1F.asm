GarnetCavern1F_Object:
	db $7d ; border block

	def_warp_events
	warp_event 24, 17, CITRINE_CITY, 5
	warp_event 25, 17, CITRINE_CITY, 5
	
	warp_event 27,  1, GARNET_CAVERN_2F, 1
	warp_event 23,  7, GARNET_CAVERN_2F, 2
	warp_event 18,  9, GARNET_CAVERN_2F, 3
	warp_event  7,  1, GARNET_CAVERN_2F, 4
	warp_event  1,  3, GARNET_CAVERN_2F, 5
	warp_event  3, 11, GARNET_CAVERN_2F, 6
	warp_event  0,  6, GARNET_CAVERN_B1F, 1
	
	def_bg_events

	def_object_events

	def_warps_to GARNET_CAVERN_1F
