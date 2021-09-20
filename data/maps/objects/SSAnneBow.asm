SSAnneBow_Object:
	db $23 ; border block

	def_warp_events
	warp_event 13,  6, 0, SS_ANNE_3F
	warp_event 13,  7, 0, SS_ANNE_3F

	def_bg_events

	def_object_events
	object_event SPRITE_SUPER_NERD, 5, 2, STAY, UP, 1 ; person
	object_event SPRITE_SAILOR, 4, 9, STAY, NONE, 2 ; person
	object_event SPRITE_COOLTRAINER_M, 7, 11, STAY, NONE, 3 ; person
	object_event SPRITE_SAILOR, 4, 4, STAY, DOWN, 4, OPP_SAILOR, 1
	object_event SPRITE_SAILOR, 10, 8, STAY, UP, 5, OPP_SAILOR, 2

	def_warps_to SS_ANNE_BOW
