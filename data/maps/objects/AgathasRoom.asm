AgathasRoom_Object:
	db $0 ; border block

	def_warp_events
	warp_event  4, 11, 2, BRUNOS_ROOM
	warp_event  5, 11, 3, BRUNOS_ROOM
	warp_event  4,  0, 0, LANCES_ROOM
	warp_event  5,  0, 0, LANCES_ROOM

	def_bg_events

	def_object_events
	object_event SPRITE_AGATHA, 5, 2, STAY, DOWN, 1, OPP_AGATHA, 1

	def_warps_to AGATHAS_ROOM
