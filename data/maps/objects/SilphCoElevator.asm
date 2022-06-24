SilphCoElevator_Object:
	db $f ; border block

	def_warp_events
	warp_event  1,  3, UNUSED_MAP_ED, 1
	warp_event  2,  3, UNUSED_MAP_ED, 1

	def_bg_events
	bg_event  3,  0, TEXT_SILPHCOELEVATOR_ELEVATOR

	def_object_events

	def_warps_to SILPH_CO_ELEVATOR
