ViridianSchoolHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, 2, LAST_MAP
	warp_event  3,  7, 2, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_BRUNETTE_GIRL, 3, 5, STAY, UP, 1 ; person
	object_event SPRITE_COOLTRAINER_F, 4, 1, STAY, DOWN, 2 ; person

	def_warps_to VIRIDIAN_SCHOOL_HOUSE
