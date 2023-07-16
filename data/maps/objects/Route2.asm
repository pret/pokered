	object_const_def
	const ROUTE2_BUG_CATCHER
	const ROUTE2_JR_TRAINER_M
	const ROUTE2_JR_TRAINER_F
	const ROUTE2_ITEM1
	const ROUTE2_ITEM2
	const ROUTE2_ITEM3

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
	bg_event  5, 65, TEXT_ROUTE2_SIGN
	bg_event 11, 11, TEXT_ROUTE2_DIGLETTS_CAVE_SIGN

	def_object_events
	object_event 18, 65, SPRITE_YOUNGSTER, STAY, LEFT, TEXT_ROUTE2_BUG_CATCHER, OPP_BUG_CATCHER, 12
	object_event 18, 45, SPRITE_COOLTRAINER_M, STAY, LEFT, TEXT_ROUTE2_JR_TRAINER_M, OPP_JR_TRAINER_M, 6
	object_event 19, 30, SPRITE_COOLTRAINER_F, STAY, LEFT, TEXT_ROUTE2_JR_TRAINER_F, OPP_JR_TRAINER_F, 4
	object_event 13, 54, SPRITE_POKE_BALL, STAY, NONE, TEXT_ROUTE2_ITEM1, ITEM_ROUTE_2_SOUTH2
	object_event 13, 45, SPRITE_POKE_BALL, STAY, NONE, TEXT_ROUTE2_ITEM2, ITEM_ROUTE_2_SOUTH1
	object_event 13, 3, SPRITE_POKE_BALL, STAY, NONE, TEXT_ROUTE2_ITEM3, TM_ROUTE_2_ABOVE_DIGLETT_CAVE_NEW

	def_warps_to ROUTE_2

	; unused ; TODO: remove?
	warp_to 2, 7, 4
	db $12, $c7, $9, $7
	warp_to 2, 7, 4
	warp_to 2, 7, 4
	warp_to 2, 7, 4
