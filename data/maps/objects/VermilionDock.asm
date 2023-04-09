VermilionDock_Object:
	db $f ; border block

	def_warp_events
	warp_event 14,  0, LAST_MAP, 6
	warp_event 14,  2, SS_ANNE_1F, 2

	def_bg_events

	def_object_events
	object_event 22,  0, SPRITE_POKE_BALL, STAY, NONE, 2, OLD_SEA_MAP

	def_warps_to VERMILION_DOCK
