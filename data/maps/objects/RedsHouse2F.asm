RedsHouse2F_Object:
	db $a ; border block

	def_warp_events
	warp_event  7,  1, REDS_HOUSE_1F, 3

	def_bg_events

	def_object_events

	def_warps_to REDS_HOUSE_2F
