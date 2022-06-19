Route2_Object:
	db $f ; border block

	def_warp_events
	warp_event 12,  9, DIGLETTS_CAVE_ROUTE_2, 1
	warp_event  3, 11, VIRIDIAN_FOREST_NORTH_GATE, 2
	warp_event 15, 19, ROUTE_2_TRADE_HOUSE, 1
	warp_event 16, 35, ROUTE_2_GATE, 2
	warp_event 15, 39, ROUTE_2_GATE, 3
	warp_event  3, 43, VIRIDIAN_FOREST_SOUTH_GATE, 3

	def_bg_events
	bg_event  5, 65, 7 ; Route2Text3
	bg_event 11, 11, 8 ; Route2Text4

	def_object_events
	object_event 18, 65, SPRITE_YOUNGSTER, STAY, LEFT, 1, OPP_BUG_CATCHER, 12
	object_event 18, 45, SPRITE_COOLTRAINER_M, STAY, LEFT, 2, OPP_JR_TRAINER_M, 6
	object_event 19, 30, SPRITE_COOLTRAINER_F, STAY, LEFT, 3, OPP_JR_TRAINER_F, 4
	object_event 13, 54, SPRITE_POKE_BALL, STAY, NONE, 4, MOON_STONE
	object_event 13, 45, SPRITE_POKE_BALL, STAY, NONE, 5, HP_UP
	object_event 13, 3, SPRITE_POKE_BALL, STAY, NONE, 6, TM_REFLECT

	def_warps_to ROUTE_2

	; unused
	warp_to 2, 7, 4
	db $12, $c7, $9, $7
	warp_to 2, 7, 4
	warp_to 2, 7, 4
	warp_to 2, 7, 4
