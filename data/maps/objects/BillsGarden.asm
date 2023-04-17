BillsGarden_Object:
	db $0 ; border block

	def_warp_events
	warp_event  8, 19, BILLS_HOUSE, 1
	warp_event  9, 19, BILLS_HOUSE, 1

	def_bg_events

	def_object_events

	def_warps_to BILLS_GARDEN