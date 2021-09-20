Route2_Object:
	db $f ; border block

	def_warp_events
	warp_event 12,  9, 0, DIGLETTS_CAVE_ROUTE_2
	warp_event  3, 11, 1, VIRIDIAN_FOREST_NORTH_GATE
	warp_event 15, 19, 0, ROUTE_2_TRADE_HOUSE
	warp_event 16, 35, 1, ROUTE_2_GATE
	warp_event 15, 39, 2, ROUTE_2_GATE
	warp_event  3, 43, 2, VIRIDIAN_FOREST_SOUTH_GATE

	def_bg_events
	bg_event  5, 65, 3 ; Route2Text3
	bg_event 11, 11, 4 ; Route2Text4

	def_object_events
	object_event SPRITE_POKE_BALL, 13, 54, STAY, NONE, 1, MOON_STONE
	object_event SPRITE_POKE_BALL, 13, 45, STAY, NONE, 2, HP_UP

	def_warps_to ROUTE_2

	; unused
	warp_to 2, 7, 4
	db $12, $c7, $9, $7
	warp_to 2, 7, 4
	warp_to 2, 7, 4
	warp_to 2, 7, 4
