BillsHouse_Object:
	db $d ; border block

	def_warp_events
	warp_event  2,  7, 0, LAST_MAP
	warp_event  3,  7, 0, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_MONSTER, 6, 5, STAY, NONE, 1 ; person
	object_event SPRITE_SUPER_NERD, 4, 4, STAY, NONE, 2 ; person
	object_event SPRITE_SUPER_NERD, 6, 5, STAY, NONE, 3 ; person

	def_warps_to BILLS_HOUSE
