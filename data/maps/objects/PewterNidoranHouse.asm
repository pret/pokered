PewterNidoranHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, 3, LAST_MAP
	warp_event  3,  7, 3, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_MONSTER, 4, 5, STAY, LEFT, 1 ; person
	object_event SPRITE_LITTLE_BOY, 3, 5, STAY, RIGHT, 2 ; person
	object_event SPRITE_MIDDLE_AGED_MAN, 1, 2, STAY, NONE, 3 ; person

	def_warps_to PEWTER_NIDORAN_HOUSE
