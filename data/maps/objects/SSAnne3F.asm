	object_const_def
	const_export SSANNE3F_SAILOR

SSAnne3F_Object:
	db $c ; border block

	def_warp_events
	warp_event  0,  3, SS_ANNE_BOW, 1
	warp_event 19,  3, SS_ANNE_2F, 8

	def_bg_events

	def_object_events
	object_event  9,  3, SPRITE_SAILOR, WALK, LEFT_RIGHT, TEXT_SSANNE3F_SAILOR

	def_warps_to SS_ANNE_3F
