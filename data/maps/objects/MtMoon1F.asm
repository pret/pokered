MtMoon1F_Object:
	db $3 ; border block

	def_warp_events
	warp_event 14, 35, 1, LAST_MAP
	warp_event 15, 35, 1, LAST_MAP
	warp_event  5,  5, 0, MT_MOON_B1F
	warp_event 17, 11, 2, MT_MOON_B1F
	warp_event 25, 15, 3, MT_MOON_B1F

	def_bg_events
	bg_event 15, 23, 14 ; MtMoon1Text14

	def_object_events
	object_event SPRITE_HIKER, 5, 6, STAY, DOWN, 1, OPP_HIKER, 1
	object_event SPRITE_YOUNGSTER, 12, 16, STAY, RIGHT, 2, OPP_YOUNGSTER, 3
	object_event SPRITE_COOLTRAINER_F, 30, 4, STAY, DOWN, 3, OPP_LASS, 5
	object_event SPRITE_SUPER_NERD, 24, 31, STAY, UP, 4, OPP_SUPER_NERD, 1
	object_event SPRITE_COOLTRAINER_F, 16, 23, STAY, DOWN, 5, OPP_LASS, 6
	object_event SPRITE_YOUNGSTER, 7, 22, STAY, DOWN, 6, OPP_BUG_CATCHER, 7
	object_event SPRITE_YOUNGSTER, 30, 27, STAY, RIGHT, 7, OPP_BUG_CATCHER, 8
	object_event SPRITE_POKE_BALL, 2, 20, STAY, NONE, 8, POTION
	object_event SPRITE_POKE_BALL, 2, 2, STAY, NONE, 9, MOON_STONE
	object_event SPRITE_POKE_BALL, 35, 31, STAY, NONE, 10, RARE_CANDY
	object_event SPRITE_POKE_BALL, 36, 23, STAY, NONE, 11, ESCAPE_ROPE
	object_event SPRITE_POKE_BALL, 20, 33, STAY, NONE, 12, POTION
	object_event SPRITE_POKE_BALL, 5, 32, STAY, NONE, 13, TM_WATER_GUN

	def_warps_to MT_MOON_1F
