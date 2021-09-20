BrunosRoom_Object:
	db $3 ; border block

	def_warp_events
	warp_event  4, 11, 2, LORELEIS_ROOM
	warp_event  5, 11, 3, LORELEIS_ROOM
	warp_event  4,  0, 0, AGATHAS_ROOM
	warp_event  5,  0, 1, AGATHAS_ROOM

	def_bg_events

	def_object_events
	object_event SPRITE_BRUNO, 5, 2, STAY, DOWN, 1, OPP_BRUNO, 1

	def_warps_to BRUNOS_ROOM
