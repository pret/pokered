PewterPokecenter_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 7
	warp_event  4,  7, LAST_MAP, 7

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, 1 ; person
	object_event 11,  7, SPRITE_GENTLEMAN, STAY, LEFT, 2 ; person
	object_event  1,  3, SPRITE_JIGGLYPUFF, STAY, DOWN, 3 ; person
	object_event 11,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, 4 ; person
	object_event  7,  3, SPRITE_GAMEBOY_KID, STAY, DOWN, 5 ; Golem Trader
	object_event  4,  1, SPRITE_CHANSEY, STAY, DOWN, 6 ; Chansey

	def_warps_to PEWTER_POKECENTER
