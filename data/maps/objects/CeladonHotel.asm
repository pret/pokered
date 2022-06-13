CeladonHotel_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 13
	warp_event  4,  7, LAST_MAP, 13

	def_bg_events

	def_object_events
	object_event 11,  7, SPRITE_CHANNELER, WALK, UP_DOWN, 1, OPP_CHANNELER, 1  ; person
	object_event  3,  1, SPRITE_GRANNY, STAY, DOWN, 2 ; person
	object_event  2,  4, SPRITE_BEAUTY, STAY, NONE, 3 ; person
	object_event  8,  4, SPRITE_SUPER_NERD, WALK, LEFT_RIGHT, 4 ; person

	def_warps_to CELADON_HOTEL
