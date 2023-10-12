	object_const_def
	const_export CELADONMANSION1F_MEOWTH
	const_export CELADONMANSION1F_GRANNY
	const_export CELADONMANSION1F_CLEFAIRY
	const_export CELADONMANSION1F_NIDORANF

CeladonMansion1F_Object:
	db $f ; border block

	def_warp_events
	warp_event  4, 11, LAST_MAP, 3
	warp_event  5, 11, LAST_MAP, 3
	warp_event  4,  0, LAST_MAP, 5
	warp_event  7,  1, CELADON_MANSION_2F, 2
	warp_event  2,  1, CELADON_MANSION_2F, 3

	def_bg_events
	bg_event  4,  9, TEXT_CELADONMANSION1F_MANAGERS_SUITE_SIGN

	def_object_events
	object_event  0,  5, SPRITE_MONSTER, STAY, RIGHT, TEXT_CELADONMANSION1F_MEOWTH
	object_event  1,  5, SPRITE_GRANNY, STAY, DOWN, TEXT_CELADONMANSION1F_GRANNY
	object_event  1,  8, SPRITE_FAIRY, WALK, LEFT_RIGHT, TEXT_CELADONMANSION1F_CLEFAIRY
	object_event  4,  4, SPRITE_MONSTER, WALK, UP_DOWN, TEXT_CELADONMANSION1F_NIDORANF

	def_warps_to CELADON_MANSION_1F
