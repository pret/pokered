	object_const_def
	const_export HALLOFFAME_OAK

HallOfFame_Object:
	db $3 ; border block

	def_warp_events
	warp_event  4,  7, CHAMPIONS_ROOM, 3
	warp_event  5,  7, CHAMPIONS_ROOM, 4

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OAK, STAY, DOWN, TEXT_HALLOFFAME_OAK

	def_warps_to HALL_OF_FAME
