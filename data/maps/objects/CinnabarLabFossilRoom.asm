	object_const_def
	const_export CINNABARLABFOSSILROOM_SCIENTIST1
	const_export CINNABARLABFOSSILROOM_SCIENTIST2

CinnabarLabFossilRoom_Object:
	db $17 ; border block

	def_warp_events
	warp_event  2,  7, CINNABAR_LAB, 5
	warp_event  3,  7, CINNABAR_LAB, 5

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_SCIENTIST, WALK, LEFT_RIGHT, TEXT_CINNABARLABFOSSILROOM_SCIENTIST1
	object_event  7,  6, SPRITE_SCIENTIST, STAY, UP, TEXT_CINNABARLABFOSSILROOM_SCIENTIST2

	def_warps_to CINNABAR_LAB_FOSSIL_ROOM
