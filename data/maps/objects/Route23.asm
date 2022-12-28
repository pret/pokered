Route23_Object:
	db $f ; border block

	def_warp_events
	warp_event  7, 139, ROUTE_22_GATE, 3
	warp_event  8, 139, ROUTE_22_GATE, 4
	warp_event  4, 31, VICTORY_ROAD_1F, 1
	warp_event 14, 31, VICTORY_ROAD_2F, 2

	def_bg_events
	bg_event  3, 33, 8 ; Route23Text8

	def_object_events
	object_event  4, 35, SPRITE_GUARD, STAY, DOWN, 1 ; person
	object_event 10, 56, SPRITE_GUARD, STAY, DOWN, 2 ; person
	object_event  8, 85, SPRITE_SWIMMER, STAY, DOWN, 3 ; person
	object_event 11, 96, SPRITE_SWIMMER, STAY, DOWN, 4 ; person
	object_event 12, 105, SPRITE_GUARD, STAY, DOWN, 5 ; person
	object_event  8, 119, SPRITE_GUARD, STAY, DOWN, 6 ; person
	object_event  8, 136, SPRITE_GUARD, STAY, DOWN, 7 ; person

	def_warps_to ROUTE_23
