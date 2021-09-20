Route16Gate1F_Object:
	db $a ; border block

	def_warp_events
	warp_event  0,  8, 0, LAST_MAP
	warp_event  0,  9, 1, LAST_MAP
	warp_event  7,  8, 2, LAST_MAP
	warp_event  7,  9, 2, LAST_MAP
	warp_event  0,  2, 4, LAST_MAP
	warp_event  0,  3, 5, LAST_MAP
	warp_event  7,  2, 6, LAST_MAP
	warp_event  7,  3, 7, LAST_MAP
	warp_event  6, 12, 0, ROUTE_16_GATE_2F

	def_bg_events

	def_object_events
	object_event SPRITE_GUARD, 4, 5, STAY, DOWN, 1 ; person
	object_event SPRITE_GAMBLER, 4, 3, STAY, NONE, 2 ; person

	def_warps_to ROUTE_16_GATE_1F
