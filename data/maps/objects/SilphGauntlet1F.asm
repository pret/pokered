SilphGauntlet1F_Object:
	db $3 ; border block

	def_warp_events
	warp_event  14,  1, SILPH_CO_1F, 4
	warp_event  8,  9, SILPH_GAUNTLET_2F, 1

	def_bg_events

	def_object_events

	def_warps_to SILPH_GAUNTLET_1F
