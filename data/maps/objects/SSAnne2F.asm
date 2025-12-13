	object_const_def
	const_export SSANNE2F_WAITER
	const_export SSANNE2F_RIVAL

SSAnne2F_Object:
	db $c ; border block

	def_warp_events
	warp_event  36, 13, CERULEAN_GYM, 3
	warp_event  37, 13, CERULEAN_GYM, 4
	warp_event  36, 4, VERMILION_GYM, 1


	def_bg_events

	def_object_events
	object_event  3,  7, SPRITE_WAITER, WALK, UP_DOWN, TEXT_SSANNE2F_WAITER
	object_event 36,  4, SPRITE_BLUE, STAY, DOWN, TEXT_SSANNE2F_RIVAL, OPP_RIVAL1, 1

	def_warps_to SS_ANNE_2F
