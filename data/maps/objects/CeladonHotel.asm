CeladonHotel_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, 12, LAST_MAP
	warp_event  4,  7, 12, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_GRANNY, 3, 1, STAY, DOWN, 1 ; person
	object_event SPRITE_BEAUTY, 2, 4, STAY, NONE, 2 ; person
	object_event SPRITE_SUPER_NERD, 8, 4, WALK, LEFT_RIGHT, 3 ; person

	def_warps_to CELADON_HOTEL
