	object_const_def
	const_export VERMILIONMART_CLERK
	const_export VERMILIONMART_COOLTRAINER_M
	const_export VERMILIONMART_COOLTRAINER_F

VermilionMart_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 3
	warp_event  4,  7, LAST_MAP, 3

	def_bg_events

	def_object_events
	object_event  0,  5, SPRITE_CLERK, STAY, RIGHT, TEXT_VERMILIONMART_CLERK
	object_event  5,  6, SPRITE_COOLTRAINER_M, STAY, NONE, TEXT_VERMILIONMART_COOLTRAINER_M
	object_event  3,  3, SPRITE_COOLTRAINER_F, WALK, LEFT_RIGHT, TEXT_VERMILIONMART_COOLTRAINER_F

	def_warps_to VERMILION_MART
