	object_const_def
	const_export FUCHSIAMART_CLERK
	const_export FUCHSIAMART_MIDDLE_AGED_MAN
	const_export FUCHSIAMART_COOLTRAINER_F

FuchsiaMart_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 1
	warp_event  4,  7, LAST_MAP, 1

	def_bg_events

	def_object_events
	object_event  0,  5, SPRITE_CLERK, STAY, RIGHT, TEXT_FUCHSIAMART_CLERK
	object_event  4,  2, SPRITE_MIDDLE_AGED_MAN, STAY, NONE, TEXT_FUCHSIAMART_MIDDLE_AGED_MAN
	object_event  6,  5, SPRITE_COOLTRAINER_F, WALK, UP_DOWN, TEXT_FUCHSIAMART_COOLTRAINER_F

	def_warps_to FUCHSIA_MART
