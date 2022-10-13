SilphGauntlet5F_Object:
	db $0 ; border block

	def_warp_events
	warp_event  2,  15, SILPH_GAUNTLET_4F, 2
	warp_event  2,  3, SILPH_GAUNTLET_6F, 1

	def_bg_events

	def_object_events

	def_warps_to SILPH_GAUNTLET_5F
