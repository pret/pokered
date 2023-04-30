CitrineCity_Object:
	db $43 ; border block

	def_warp_events
	warp_event  9, 27, CITRINE_ROCKET_HOUSE, 1
	warp_event  9, 17, CITRINE_TRADEBACK_HOUSE, 1
	warp_event 15, 17, CITRINE_POKECENTER, 1
	warp_event 15, 27, CITRINE_MART, 1
	warp_event 22,  5, GARNET_CAVERN_1F, 1

	def_bg_events

	def_object_events

	def_warps_to CITRINE_CITY
