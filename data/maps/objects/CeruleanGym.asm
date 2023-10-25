	object_const_def
	const_export CERULEANGYM_MISTY
	const_export CERULEANGYM_COOLTRAINER_F
	const_export CERULEANGYM_SWIMMER
	const_export CERULEANGYM_GYM_GUIDE

CeruleanGym_Object:
	db $3 ; border block

	def_warp_events
	warp_event  4, 13, LAST_MAP, 4
	warp_event  5, 13, LAST_MAP, 4

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_MISTY, STAY, DOWN, TEXT_CERULEANGYM_MISTY, OPP_MISTY, 1
	object_event  2,  3, SPRITE_COOLTRAINER_F, STAY, RIGHT, TEXT_CERULEANGYM_COOLTRAINER_F, OPP_JR_TRAINER_F, 1
	object_event  8,  7, SPRITE_SWIMMER, STAY, LEFT, TEXT_CERULEANGYM_SWIMMER, OPP_SWIMMER, 1
	object_event  7, 10, SPRITE_GYM_GUIDE, STAY, DOWN, TEXT_CERULEANGYM_GYM_GUIDE

	def_warps_to CERULEAN_GYM
