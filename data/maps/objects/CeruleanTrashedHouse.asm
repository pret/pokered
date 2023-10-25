	object_const_def
	const_export CERULEANTRASHEDHOUSE_FISHING_GURU
	const_export CERULEANTRASHEDHOUSE_GIRL

CeruleanTrashedHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 1
	warp_event  3,  7, LAST_MAP, 1
	warp_event  3,  0, LAST_MAP, 8

	def_bg_events
	bg_event  3,  0, TEXT_CERULEANTRASHEDHOUSE_WALL_HOLE

	def_object_events
	object_event  2,  1, SPRITE_FISHING_GURU, STAY, DOWN, TEXT_CERULEANTRASHEDHOUSE_FISHING_GURU
	object_event  5,  6, SPRITE_GIRL, WALK, LEFT_RIGHT, TEXT_CERULEANTRASHEDHOUSE_GIRL

	def_warps_to CERULEAN_TRASHED_HOUSE
