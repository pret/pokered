	object_const_def
	const_export ROUTE18GATE2F_YOUNGSTER

Route18Gate2F_Object:
	db $a ; border block

	def_warp_events
	warp_event  7,  7, ROUTE_18_GATE_1F, 5

	def_bg_events
	bg_event  1,  2, TEXT_ROUTE18GATE2F_LEFT_BINOCULARS
	bg_event  6,  2, TEXT_ROUTE18GATE2F_RIGHT_BINOCULARS

	def_object_events
	object_event  4,  2, SPRITE_YOUNGSTER, WALK, LEFT_RIGHT, TEXT_ROUTE18GATE2F_YOUNGSTER

	def_warps_to ROUTE_18_GATE_2F
