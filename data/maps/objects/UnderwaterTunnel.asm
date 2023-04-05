UnderwaterTunnel_Object:
	db $7d ; border block

	def_warp_events
	warp_event  9,  1, ROUTE_25, 2
	warp_event 27, 13, ROUTE_10, 5

	def_bg_events

	def_object_events
	object_event 19,  4, SPRITE_MONSTER, STAY, DOWN, 1, DRAGONITE, 55 | OW_POKEMON

	def_warps_to UNDERWATER_TUNNEL
