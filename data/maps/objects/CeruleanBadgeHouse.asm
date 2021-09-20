CeruleanBadgeHouse_Object:
	db $c ; border block

	def_warp_events
	warp_event  2,  0, 9, LAST_MAP
	warp_event  2,  7, 8, LAST_MAP
	warp_event  3,  7, 8, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_MIDDLE_AGED_MAN, 5, 3, STAY, RIGHT, 1 ; person

	def_warps_to CERULEAN_BADGE_HOUSE
