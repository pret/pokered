CeruleanPokecenter_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 3
	warp_event  4,  7, LAST_MAP, 3

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, 1 ; person
	object_event 10,  5, SPRITE_SUPER_NERD, WALK, ANY_DIR, 2 ; person
	object_event  4,  3, SPRITE_GENTLEMAN, STAY, DOWN, 3 ; person
	object_event 11,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, 4 ; person

	def_warps_to CERULEAN_POKECENTER
