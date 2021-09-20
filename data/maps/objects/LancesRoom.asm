LancesRoom_Object:
	db $3 ; border block

	def_warp_events
	warp_event 24, 16, 2, AGATHAS_ROOM
	warp_event  5,  0, 0, CHAMPIONS_ROOM
	warp_event  6,  0, 0, CHAMPIONS_ROOM

	def_bg_events

	def_object_events
	object_event SPRITE_LANCE, 6, 1, STAY, DOWN, 1, OPP_LANCE, 1

	def_warps_to LANCES_ROOM
