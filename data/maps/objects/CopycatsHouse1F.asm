	object_const_def
	const_export COPYCATSHOUSE1F_MIDDLE_AGED_WOMAN
	const_export COPYCATSHOUSE1F_MIDDLE_AGED_MAN
	const_export COPYCATSHOUSE1F_CHANSEY

CopycatsHouse1F_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 1
	warp_event  3,  7, LAST_MAP, 1
	warp_event  7,  1, COPYCATS_HOUSE_2F, 1

	def_bg_events

	def_object_events
	object_event  2,  2, SPRITE_MIDDLE_AGED_WOMAN, STAY, DOWN, TEXT_COPYCATSHOUSE1F_MIDDLE_AGED_WOMAN
	object_event  5,  4, SPRITE_MIDDLE_AGED_MAN, STAY, LEFT, TEXT_COPYCATSHOUSE1F_MIDDLE_AGED_MAN
	object_event  1,  4, SPRITE_FAIRY, WALK, UP_DOWN, TEXT_COPYCATSHOUSE1F_CHANSEY

	def_warps_to COPYCATS_HOUSE_1F
