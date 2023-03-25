BillsHouse_Object:
	db $d ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 1
	warp_event  3,  7, LAST_MAP, 1
	warp_event 11,  0, BILLS_GARDEN, 1

	def_bg_events

	def_object_events
	object_event  6,  5, SPRITE_MONSTER, STAY, NONE, 1 ; person
	object_event  1,  4, SPRITE_SUPER_NERD, STAY, NONE, 2 ; person
	object_event  6,  5, SPRITE_SUPER_NERD, STAY, NONE, 3 ; person
	object_event 11,  1, SPRITE_MONSTER, STAY, NONE, 5 ; nidorino

	def_warps_to BILLS_HOUSE
