	object_const_def
	const_export VIRIDIANMART_CLERK
	const_export VIRIDIANMART_YOUNGSTER
	const_export VIRIDIANMART_COOLTRAINER_M

ViridianMart_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 2
	warp_event  4,  7, LAST_MAP, 2

	def_bg_events

	def_object_events
	object_event  0,  5, SPRITE_CLERK, STAY, RIGHT, TEXT_VIRIDIANMART_CLERK
	object_event  5,  5, SPRITE_YOUNGSTER, WALK, UP_DOWN, TEXT_VIRIDIANMART_YOUNGSTER
	object_event  3,  3, SPRITE_COOLTRAINER_M, STAY, NONE, TEXT_VIRIDIANMART_COOLTRAINER_M

	def_warps_to VIRIDIAN_MART
