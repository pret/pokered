CeruleanTrashedHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, 0, LAST_MAP
	warp_event  3,  7, 0, LAST_MAP
	warp_event  3,  0, 7, LAST_MAP

	def_bg_events
	bg_event  3,  0, 3 ; CeruleanHouseTrashedText3

	def_object_events
	object_event SPRITE_FISHING_GURU, 2, 1, STAY, DOWN, 1 ; person
	object_event SPRITE_GIRL, 5, 6, WALK, LEFT_RIGHT, 2 ; person

	def_warps_to CERULEAN_TRASHED_HOUSE
