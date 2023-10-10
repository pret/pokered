	object_const_def
	const_export SSANNECAPTAINSROOM_CAPTAIN

SSAnneCaptainsRoom_Object:
	db $c ; border block

	def_warp_events
	warp_event  0,  7, SS_ANNE_2F, 9

	def_bg_events
	bg_event  4,  1, TEXT_SSANNECAPTAINSROOM_TRASH
	bg_event  1,  2, TEXT_SSANNECAPTAINSROOM_SEASICK_BOOK

	def_object_events
	object_event  4,  2, SPRITE_CAPTAIN, STAY, UP, TEXT_SSANNECAPTAINSROOM_CAPTAIN

	def_warps_to SS_ANNE_CAPTAINS_ROOM
