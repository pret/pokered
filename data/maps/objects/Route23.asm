	object_const_def
	const_export ROUTE23_GUARD1
	const_export ROUTE23_GUARD2
	const_export ROUTE23_SWIMMER1
	const_export ROUTE23_SWIMMER2
	const_export ROUTE23_GUARD3
	const_export ROUTE23_GUARD4
	const_export ROUTE23_GUARD5

Route23_Object:
	db $f ; border block

	def_warp_events
	warp_event  7, 139, ROUTE_22_GATE, 3
	warp_event  8, 139, ROUTE_22_GATE, 4
	warp_event  4, 31, VICTORY_ROAD_1F, 1
	warp_event 14, 31, VICTORY_ROAD_2F, 2

	def_bg_events
	bg_event  3, 33, TEXT_ROUTE23_VICTORY_ROAD_GATE_SIGN

	def_object_events
	object_event  4, 35, SPRITE_GUARD, STAY, DOWN, TEXT_ROUTE23_GUARD1
	object_event 10, 56, SPRITE_GUARD, STAY, DOWN, TEXT_ROUTE23_GUARD2
	object_event  8, 85, SPRITE_SWIMMER, STAY, DOWN, TEXT_ROUTE23_SWIMMER1
	object_event 11, 96, SPRITE_SWIMMER, STAY, DOWN, TEXT_ROUTE23_SWIMMER2
	object_event 12, 105, SPRITE_GUARD, STAY, DOWN, TEXT_ROUTE23_GUARD3
	object_event  8, 119, SPRITE_GUARD, STAY, DOWN, TEXT_ROUTE23_GUARD4
	object_event  8, 136, SPRITE_GUARD, STAY, DOWN, TEXT_ROUTE23_GUARD5

	def_warps_to ROUTE_23
