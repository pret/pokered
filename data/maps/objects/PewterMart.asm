	object_const_def
	const PEWTERMART_CLERK
	const PEWTERMART_YOUNGSTER
	const PEWTERMART_SUPER_NERD

PewterMart_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 5
	warp_event  4,  7, LAST_MAP, 5

	def_bg_events

	def_object_events
	object_event  0,  5, SPRITE_CLERK, STAY, RIGHT, TEXT_PEWTERMART_CLERK
	object_event  3,  3, SPRITE_YOUNGSTER, WALK, UP_DOWN, TEXT_PEWTERMART_YOUNGSTER
	object_event  5,  5, SPRITE_SUPER_NERD, STAY, NONE, TEXT_PEWTERMART_SUPER_NERD

	def_warps_to PEWTER_MART
