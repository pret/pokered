NameRatersHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, 5, LAST_MAP
	warp_event  3,  7, 5, LAST_MAP

	def_bg_events

	def_objects
	object SPRITE_SILPH_PRESIDENT, 5, 3, STAY, LEFT, 1 ; person

	def_warps_to NAME_RATERS_HOUSE
