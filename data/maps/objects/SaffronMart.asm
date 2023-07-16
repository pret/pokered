	object_const_def
	const SAFFRONMART_CLERK
	const SAFFRONMART_SUPER_NERD
	const SAFFRONMART_COOLTRAINER_F
	const SAFFRONMART_TM_KID

SaffronMart_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 5
	warp_event  4,  7, LAST_MAP, 5

	def_bg_events

	def_object_events
	object_event  0,  5, SPRITE_CLERK, STAY, RIGHT, TEXT_SAFFRONMART_CLERK
	object_event  4,  2, SPRITE_SUPER_NERD, STAY, NONE, TEXT_SAFFRONMART_SUPER_NERD
	object_event  6,  5, SPRITE_COOLTRAINER_F, WALK, ANY_DIR, TEXT_SAFFRONMART_COOLTRAINER_F
	object_event  1,  7, SPRITE_LITTLE_BOY, STAY, NONE, TEXT_SAFFRONMART_TM_KID

	def_warps_to SAFFRON_MART
