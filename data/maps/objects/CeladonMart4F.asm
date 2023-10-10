	object_const_def
	const_export CELADONMART4F_CLERK
	const_export CELADONMART4F_SUPER_NERD
	const_export CELADONMART4F_YOUNGSTER

CeladonMart4F_Object:
	db $f ; border block

	def_warp_events
	warp_event 12,  1, CELADON_MART_3F, 1
	warp_event 16,  1, CELADON_MART_5F, 2
	warp_event  1,  1, CELADON_MART_ELEVATOR, 1

	def_bg_events
	bg_event 14,  1, TEXT_CELADONMART4F_CURRENT_FLOOR_SIGN

	def_object_events
	object_event  5,  7, SPRITE_CLERK, STAY, NONE, TEXT_CELADONMART4F_CLERK
	object_event 15,  5, SPRITE_SUPER_NERD, WALK, LEFT_RIGHT, TEXT_CELADONMART4F_SUPER_NERD
	object_event  5,  2, SPRITE_YOUNGSTER, WALK, LEFT_RIGHT, TEXT_CELADONMART4F_YOUNGSTER

	def_warps_to CELADON_MART_4F
