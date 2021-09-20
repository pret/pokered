MrPsychicsHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, 7, LAST_MAP
	warp_event  3,  7, 7, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_FISHING_GURU, 5, 3, STAY, LEFT, 1 ; person

	def_warps_to MR_PSYCHICS_HOUSE
