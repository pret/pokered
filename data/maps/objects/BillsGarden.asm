BillsGarden_Object:
	db $03 ; border block

	def_warp_events
	warp_event  6, 17, BILLS_HOUSE, 1
	warp_event  7, 17, BILLS_HOUSE, 1

	def_bg_events

	def_object_events

	def_warps_to BILLS_GARDEN