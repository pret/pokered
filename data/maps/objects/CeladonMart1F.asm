	object_const_def
	const_export CELADONMART1F_RECEPTIONIST

CeladonMart1F_Object:
	db $f ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 1
	warp_event  3,  7, LAST_MAP, 1
	warp_event 16,  7, LAST_MAP, 2
	warp_event 17,  7, LAST_MAP, 2
	warp_event 12,  1, CELADON_MART_2F, 1
	warp_event  1,  1, CELADON_MART_ELEVATOR, 1

	def_bg_events
	bg_event 11,  4, TEXT_CELADONMART1F_DIRECTORY_SIGN
	bg_event 14,  1, TEXT_CELADONMART1F_CURRENT_FLOOR_SIGN

	def_object_events
	object_event  8,  3, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, TEXT_CELADONMART1F_RECEPTIONIST

	def_warps_to CELADON_MART_1F
