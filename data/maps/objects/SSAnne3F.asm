SSAnne3F_Object:
	db $c ; border block

	def_warp_events
	warp_event  0,  3, 0, SS_ANNE_BOW
	warp_event 19,  3, 7, SS_ANNE_2F

	def_bg_events

	def_object_events
	object_event SPRITE_SAILOR, 9, 3, WALK, LEFT_RIGHT, 1 ; person

	def_warps_to SS_ANNE_3F
