VictoryRoad2F_Object:
	db $7d ; border block

	def_warp_events
	warp_event  0,  8, VICTORY_ROAD_1F, 3
	warp_event 29,  7, LAST_MAP, 4
	warp_event 29,  8, LAST_MAP, 4
	warp_event 23,  7, VICTORY_ROAD_3F, 1
	warp_event 25, 14, VICTORY_ROAD_3F, 3
	warp_event 27,  7, VICTORY_ROAD_3F, 2
	warp_event  1,  1, VICTORY_ROAD_3F, 4

	def_bg_events

	def_object_events
	object_event 12,  9, SPRITE_HIKER, STAY, LEFT, 1, OPP_BLACKBELT, 9
	object_event 21, 13, SPRITE_SUPER_NERD, STAY, LEFT, 2, OPP_JUGGLER, 2
	object_event 19,  8, SPRITE_COOLTRAINER_M, STAY, DOWN, 3, OPP_TAMER, 5
	object_event  4,  2, SPRITE_SUPER_NERD, STAY, DOWN, 4, OPP_POKEMANIAC, 6
	object_event 26,  3, SPRITE_SUPER_NERD, STAY, LEFT, 5, OPP_JUGGLER, 5
	object_event 11,  5, SPRITE_BIRD, STAY, UP, 6, MOLTRES, 50
	object_event 27,  5, SPRITE_POKE_BALL, STAY, NONE, 7, TM_SUBMISSION
	object_event 18,  9, SPRITE_POKE_BALL, STAY, NONE, 8, FULL_HEAL
	object_event  9, 11, SPRITE_POKE_BALL, STAY, NONE, 9, TM_MEGA_KICK
	object_event 11,  0, SPRITE_POKE_BALL, STAY, NONE, 10, GUARD_SPEC
	object_event  4, 14, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 11 ; person
	object_event  5,  5, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 12 ; person
	object_event 23, 16, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 13 ; person

	def_warps_to VICTORY_ROAD_2F
