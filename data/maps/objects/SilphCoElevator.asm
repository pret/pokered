SilphCoElevator_Object:
	db $f ; border block

	def_warp_events
	warp_event  1,  3, 0, UNUSED_MAP_ED
	warp_event  2,  3, 0, UNUSED_MAP_ED

	def_bg_events
	bg_event  3,  0, 1 ; SilphCoElevatorText1

	def_object_events

	def_warps_to SILPH_CO_ELEVATOR
