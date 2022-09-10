VermilionDock_Object:
	db $f ; border block

	def_warp_events
	warp_event 14,  0, LAST_MAP, 6
	warp_event 14,  2, SS_ANNE_1F, 2

	def_bg_events

	def_object_events
	; object_event 0,  0, SPRITE_MONSTER, STAY, DOWN, 1, MEW, 30 | OW_POKEMON

	def_warps_to VERMILION_DOCK
