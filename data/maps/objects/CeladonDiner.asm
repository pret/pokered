	object_const_def
	const_export CELADONDINER_COOK
	const_export CELADONDINER_MIDDLE_AGED_WOMAN
	const_export CELADONDINER_MIDDLE_AGED_MAN
	const_export CELADONDINER_FISHER
	const_export CELADONDINER_GYM_GUIDE

CeladonDiner_Object:
	db $f ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 11
	warp_event  4,  7, LAST_MAP, 11

	def_bg_events

	def_object_events
	object_event  8,  5, SPRITE_COOK, WALK, LEFT_RIGHT, TEXT_CELADONDINER_COOK
	object_event  7,  2, SPRITE_MIDDLE_AGED_WOMAN, STAY, NONE, TEXT_CELADONDINER_MIDDLE_AGED_WOMAN
	object_event  1,  4, SPRITE_MIDDLE_AGED_MAN, STAY, DOWN, TEXT_CELADONDINER_MIDDLE_AGED_MAN
	object_event  5,  3, SPRITE_FISHER, STAY, RIGHT, TEXT_CELADONDINER_FISHER
	object_event  0,  1, SPRITE_GYM_GUIDE, STAY, DOWN, TEXT_CELADONDINER_GYM_GUIDE

	def_warps_to CELADON_DINER
