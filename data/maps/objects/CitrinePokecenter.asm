CitrinePokecenter_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 3
	warp_event  4,  7, LAST_MAP, 3

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, 1 ; person
	object_event  5,  4, SPRITE_BRUNETTE_GIRL, WALK, LEFT_RIGHT, 2 ; person
	object_event 10,  5, SPRITE_COOLTRAINER_M, WALK, ANY_DIR, 3 ; person
	object_event 11,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, 4 ; person
	object_event  8,  3, SPRITE_GAMEBOY_KID, STAY, DOWN, 5 ; Sandslash Trader
	object_event  4,  1, SPRITE_CHANSEY, STAY, DOWN, 6 ; Chansey

	def_warps_to CITRINE_POKECENTER
