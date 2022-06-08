CeruleanOldRodHouse_Object:
	db $c ; border block

	def_warp_events
	warp_event  3,  1, LAST_MAP, 12
	warp_event  2,  9, LAST_MAP, 11
	warp_event  3,  9, LAST_MAP, 11

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_FISHING_GURU, STAY, RIGHT, 1 ; person

	def_warps_to CERULEAN_OLD_ROD_HOUSE
