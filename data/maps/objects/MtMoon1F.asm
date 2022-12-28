MtMoon1F_Object:
	db $3 ; border block

	def_warp_events
	warp_event 14, 35, LAST_MAP, 2
	warp_event 15, 35, LAST_MAP, 2
	warp_event  5,  5, MT_MOON_B1F, 1
	warp_event 17, 11, MT_MOON_B1F, 3
	warp_event 25, 15, MT_MOON_B1F, 4

	def_bg_events
	bg_event 15, 23, 14 ; MtMoon1Text14

	def_object_events
	object_event  5,  6, SPRITE_HIKER, STAY, DOWN, 1, OPP_HIKER, 1
	object_event 12, 16, SPRITE_YOUNGSTER, STAY, RIGHT, 2, OPP_YOUNGSTER, 3
	object_event 30,  4, SPRITE_COOLTRAINER_F, STAY, DOWN, 3, OPP_LASS, 5
	object_event 24, 31, SPRITE_SUPER_NERD, STAY, UP, 4, OPP_SUPER_NERD, 1
	object_event 16, 23, SPRITE_COOLTRAINER_F, STAY, DOWN, 5, OPP_LASS, 6
	object_event  7, 22, SPRITE_YOUNGSTER, STAY, DOWN, 6, OPP_BUG_CATCHER, 7
	object_event 30, 27, SPRITE_YOUNGSTER, STAY, RIGHT, 7, OPP_BUG_CATCHER, 8
	object_event  2, 20, SPRITE_POKE_BALL, STAY, NONE, 8, POTION
	object_event  2,  2, SPRITE_POKE_BALL, STAY, NONE, 9, MOON_STONE
	object_event 35, 31, SPRITE_POKE_BALL, STAY, NONE, 10, RARE_CANDY
	object_event 36, 23, SPRITE_POKE_BALL, STAY, NONE, 11, ESCAPE_ROPE
	object_event 20, 33, SPRITE_POKE_BALL, STAY, NONE, 12, POTION
	object_event  5, 32, SPRITE_POKE_BALL, STAY, NONE, 13, TM_WATER_GUN

	def_warps_to MT_MOON_1F
