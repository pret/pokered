	object_const_def
	const_export REDSHOUSE1F_MOM
	const_export REDSHOUSE1F_DAD

RedsHouse1F_Object:
	db $a ; border block

	def_warp_events
IF DEF(_DEBUG)
	warp_event  2,  7, REDS_HOUSE_1F_DEBUG_WARP_MAP, REDS_HOUSE_1F_DEBUG_WARP_WHICH
ELSE
	warp_event  2,  7, LAST_MAP, 1
ENDC
	warp_event  3,  7, LAST_MAP, 1
	warp_event  7,  1, REDS_HOUSE_2F, 1

	def_bg_events
	bg_event  3,  1, TEXT_REDSHOUSE1F_TV ; RedsHouse1FTVText

	def_object_events
	object_event  5,  4, SPRITE_MOM, STAY, LEFT, TEXT_REDSHOUSE1F_MOM
	object_event  2,  4, SPRITE_DAD, STAY, RIGHT, TEXT_REDSHOUSE1F_DAD

	def_warps_to REDS_HOUSE_1F
