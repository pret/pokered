Route12SuperRodHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, 3, LAST_MAP
	warp_event  3,  7, 3, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_FISHING_GURU, 2, 4, STAY, RIGHT, 1 ; person

	def_warps_to ROUTE_12_SUPER_ROD_HOUSE
