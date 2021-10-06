LavenderCuboneHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 5
	warp_event  3,  7, LAST_MAP, 5

	def_bg_events

	def_object_events
	object_event  3,  5, SPRITE_MONSTER, STAY, UP, 1 ; person
	object_event  2,  4, SPRITE_BRUNETTE_GIRL, STAY, RIGHT, 2 ; person

	def_warps_to LAVENDER_CUBONE_HOUSE
