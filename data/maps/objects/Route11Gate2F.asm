	object_const_def
	const_export ROUTE11GATE2F_YOUNGSTER
	const_export ROUTE11GATE2F_OAKS_AIDE

Route11Gate2F_Object:
	db $a ; border block

	def_warp_events
	warp_event  7,  7, ROUTE_11_GATE_1F, 5

	def_bg_events
	bg_event  1,  2, TEXT_ROUTE11GATE2F_LEFT_BINOCULARS
	bg_event  6,  2, TEXT_ROUTE11GATE2F_RIGHT_BINOCULARS

	def_object_events
	object_event  4,  2, SPRITE_YOUNGSTER, WALK, LEFT_RIGHT, TEXT_ROUTE11GATE2F_YOUNGSTER
	object_event  2,  6, SPRITE_SCIENTIST, STAY, NONE, TEXT_ROUTE11GATE2F_OAKS_AIDE

	def_warps_to ROUTE_11_GATE_2F
