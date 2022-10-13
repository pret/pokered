SilphGauntlet2F_Object:
	db $3 ; border block

	def_warp_events
	warp_event  7,  5, SILPH_GAUNTLET_1F, 2
	warp_event  3,  13, SILPH_GAUNTLET_3F, 1

	def_bg_events

	def_object_events

	def_warps_to SILPH_GAUNTLET_2F
