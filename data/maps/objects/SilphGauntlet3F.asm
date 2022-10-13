SilphGauntlet3F_Object:
	db $c ; border block

	def_warp_events
	warp_event  6, 12, SILPH_GAUNTLET_2F, 2
	warp_event 16,  2, SILPH_GAUNTLET_4F, 1
	warp_event 11, 11, SILPH_GAUNTLET_3F, 4
	warp_event  2, 25, SILPH_GAUNTLET_3F, 3
	warp_event  3, 25, SILPH_GAUNTLET_3F, 3
	warp_event 15, 11, SILPH_GAUNTLET_3F, 7
	warp_event 12, 25, SILPH_GAUNTLET_3F, 6
	warp_event 13, 25, SILPH_GAUNTLET_3F, 6
	warp_event 19, 11, SILPH_GAUNTLET_3F, 10
	warp_event 22, 25, SILPH_GAUNTLET_3F, 9
	warp_event 23, 25, SILPH_GAUNTLET_3F, 9
	warp_event 23, 11, SILPH_GAUNTLET_3F, 13
	warp_event 32, 25, SILPH_GAUNTLET_3F, 12
	warp_event 33, 25, SILPH_GAUNTLET_3F, 12
	warp_event 32, 20, SILPH_GAUNTLET_3F, 16
	warp_event 25,  4, SILPH_GAUNTLET_3F, 15

	def_bg_events

	def_object_events

	def_warps_to SILPH_GAUNTLET_3F
