SSAnneB1F_Object:
	db $c ; border block

	def_warp_events
IF DEF(_DEBUG)
	warp_event 23,  3, DEBUG_WARP5_MAP, DEBUG_WARP5_WHICH
	warp_event 19,  3, DEBUG_WARP4_MAP, DEBUG_WARP4_WHICH
	warp_event 15,  3, DEBUG_WARP3_MAP, DEBUG_WARP3_WHICH
	warp_event 11,  3, DEBUG_WARP2_MAP, DEBUG_WARP2_WHICH
	warp_event  7,  3, DEBUG_WARP1_MAP, DEBUG_WARP1_WHICH
	warp_event 27,  5, DEBUG_WARP6_MAP, DEBUG_WARP6_WHICH
ELSE
	warp_event 23,  3, SS_ANNE_B1F_ROOMS, 9
	warp_event 19,  3, SS_ANNE_B1F_ROOMS, 7
	warp_event 15,  3, SS_ANNE_B1F_ROOMS, 5
	warp_event 11,  3, SS_ANNE_B1F_ROOMS, 3
	warp_event  7,  3, SS_ANNE_B1F_ROOMS, 1
	warp_event 27,  5, SS_ANNE_1F, 10
ENDC

	def_bg_events

	def_object_events

	def_warps_to SS_ANNE_B1F
