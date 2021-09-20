LoreleisRoom_Object:
	db $3 ; border block

	def_warp_events
	warp_event  4, 11, 2, INDIGO_PLATEAU_LOBBY
	warp_event  5, 11, 2, INDIGO_PLATEAU_LOBBY
	warp_event  4,  0, 0, BRUNOS_ROOM
	warp_event  5,  0, 1, BRUNOS_ROOM

	def_bg_events

	def_objects
	object SPRITE_LORELEI, 5, 2, STAY, DOWN, 1, OPP_LORELEI, 1

	def_warps_to LORELEIS_ROOM
