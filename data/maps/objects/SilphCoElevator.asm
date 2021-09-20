SilphCoElevator_Object:
	db $f ; border block

	def_warps
	warp  1,  3, 0, UNUSED_MAP_ED
	warp  2,  3, 0, UNUSED_MAP_ED

	def_bg_events
	bg_event  3,  0, 1 ; SilphCoElevatorText1

	def_objects

	def_warps_to SILPH_CO_ELEVATOR
