	object_const_def
	const_export MRPSYCHICSHOUSE_MR_PSYCHIC

MrPsychicsHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 8
	warp_event  3,  7, LAST_MAP, 8

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_FISHING_GURU, STAY, LEFT, TEXT_MRPSYCHICSHOUSE_MR_PSYCHIC

	def_warps_to MR_PSYCHICS_HOUSE
