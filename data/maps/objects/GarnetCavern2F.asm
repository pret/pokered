GarnetCavern2F_Object:
	db $03 ; border block

	def_warp_events
	warp_event 29,  1, GARNET_CAVERN_1F, 3
	warp_event 22,  6, GARNET_CAVERN_1F, 4
	warp_event 19,  7, GARNET_CAVERN_1F, 5
	warp_event  9,  1, GARNET_CAVERN_1F, 6
	warp_event  1,  3, GARNET_CAVERN_1F, 7
	warp_event  3, 11, GARNET_CAVERN_1F, 8

	def_bg_events

	def_object_events

	def_warps_to GARNET_CAVERN_2F
