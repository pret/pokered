VermilionOldRodHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, 8, LAST_MAP
	warp_event  3,  7, 8, LAST_MAP

	def_bg_events

	def_objects
	object SPRITE_FISHING_GURU, 2, 4, STAY, RIGHT, 1 ; person

	def_warps_to VERMILION_OLD_ROD_HOUSE
