IndigoPlateau_Object:
	db $e ; border block

	def_warp_events
	warp_event  9,  5, 0, INDIGO_PLATEAU_LOBBY
	warp_event 10,  5, 0, INDIGO_PLATEAU_LOBBY

	def_bg_events

	def_objects

	def_warps_to INDIGO_PLATEAU
