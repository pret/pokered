SilphGauntlet4F_Object:
	db $1 ; border block

	def_warp_events
	warp_event  1,  5, SILPH_GAUNTLET_3F, 2
	warp_event  3,  16, SILPH_GAUNTLET_5F, 1

	def_bg_events

	def_object_events

	def_warps_to SILPH_GAUNTLET_4F
