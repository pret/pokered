	object_const_def
	const_export CELADONMART2F_CLERK1
	const_export CELADONMART2F_CLERK2
	const_export CELADONMART2F_MIDDLE_AGED_MAN
	const_export CELADONMART2F_GIRL

CeladonMart2F_Object:
	db $f ; border block

	def_warp_events
	warp_event 12,  1, CELADON_MART_1F, 5
	warp_event 16,  1, CELADON_MART_3F, 2
	warp_event  1,  1, CELADON_MART_ELEVATOR, 1

	def_bg_events
	bg_event 14,  1, TEXT_CELADONMART2F_CURRENT_FLOOR_SIGN

	def_object_events
	object_event  5,  3, SPRITE_CLERK, STAY, DOWN, TEXT_CELADONMART2F_CLERK1
	object_event  6,  3, SPRITE_CLERK, STAY, DOWN, TEXT_CELADONMART2F_CLERK2
	object_event 19,  5, SPRITE_MIDDLE_AGED_MAN, STAY, NONE, TEXT_CELADONMART2F_MIDDLE_AGED_MAN
	object_event 14,  4, SPRITE_GIRL, WALK, UP_DOWN, TEXT_CELADONMART2F_GIRL

	def_warps_to CELADON_MART_2F
