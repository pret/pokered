BillsGarden_Object:
	db $2c ; border block

	def_warp_events
	warp_event 11, 17, BILLS_HOUSE, 3
	warp_event 12, 17, BILLS_HOUSE, 3

	def_bg_events

	def_object_events

	def_warps_to BILLS_GARDEN