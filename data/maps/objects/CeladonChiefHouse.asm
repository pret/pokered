CeladonChiefHouse_Object:
	db $f ; border block

	def_warp_events
	warp_event  2,  7, 11, LAST_MAP
	warp_event  3,  7, 11, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_GRAMPS, 4, 2, STAY, DOWN, 1 ; person
	object_event SPRITE_ROCKET, 1, 4, WALK, ANY_DIR, 2 ; person
	object_event SPRITE_SAILOR, 5, 6, STAY, LEFT, 3 ; person

	def_warps_to CELADON_CHIEF_HOUSE
