BrunosRoom_Object:
	db $3 ; border block

	def_warp_events
	warp_event  4, 11, LORELEIS_ROOM, 3
	warp_event  5, 11, LORELEIS_ROOM, 4
	warp_event  4,  0, AGATHAS_ROOM, 1
	warp_event  5,  0, AGATHAS_ROOM, 2

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_BRUNO, STAY, DOWN, 1, OPP_BRUNO, 1

	def_warps_to BRUNOS_ROOM
