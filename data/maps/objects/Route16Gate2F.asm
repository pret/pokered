	object_const_def
	const_export ROUTE16GATE2F_LITTLE_BOY
	const_export ROUTE16GATE2F_LITTLE_GIRL

Route16Gate2F_Object:
	db $a ; border block

	def_warp_events
	warp_event  7,  7, ROUTE_16_GATE_1F, 9

	def_bg_events
	bg_event  1,  2, TEXT_ROUTE16GATE2F_LEFT_BINOCULARS
	bg_event  6,  2, TEXT_ROUTE16GATE2F_RIGHT_BINOCULARS

	def_object_events
	object_event  4,  2, SPRITE_LITTLE_BOY, STAY, NONE, TEXT_ROUTE16GATE2F_LITTLE_BOY
	object_event  2,  5, SPRITE_LITTLE_GIRL, WALK, LEFT_RIGHT, TEXT_ROUTE16GATE2F_LITTLE_GIRL

	def_warps_to ROUTE_16_GATE_2F
