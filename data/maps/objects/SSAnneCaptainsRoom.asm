SSAnneCaptainsRoom_Object:
	db $c ; border block

	def_warp_events
	warp_event  0,  7, 8, SS_ANNE_2F

	def_bg_events
	bg_event  4,  1, 2 ; SSAnne7Text2
	bg_event  1,  2, 3 ; SSAnne7Text3

	def_objects
	object SPRITE_CAPTAIN, 4, 2, STAY, UP, 1 ; person

	def_warps_to SS_ANNE_CAPTAINS_ROOM
