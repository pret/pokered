MtMoonPokecenter_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 1
	warp_event  4,  7, LAST_MAP, 1

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, 1 ; person
	object_event  4,  3, SPRITE_YOUNGSTER, STAY, UP, 2 ; person
	object_event  7,  3, SPRITE_GENTLEMAN, STAY, UP, 3 ; person
	object_event 10,  6, SPRITE_MIDDLE_AGED_MAN, WALK, LEFT_RIGHT, 4 ; person
	object_event  7,  2, SPRITE_CLIPBOARD, STAY, NONE, 5 ; person
	object_event 11,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, 6 ; person

	def_warps_to MT_MOON_POKECENTER
