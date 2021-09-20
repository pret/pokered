VictoryRoad2F_Object:
	db $7d ; border block

	def_warp_events
	warp_event  0,  8, 2, VICTORY_ROAD_1F
	warp_event 29,  7, 3, LAST_MAP
	warp_event 29,  8, 3, LAST_MAP
	warp_event 23,  7, 0, VICTORY_ROAD_3F
	warp_event 25, 14, 2, VICTORY_ROAD_3F
	warp_event 27,  7, 1, VICTORY_ROAD_3F
	warp_event  1,  1, 3, VICTORY_ROAD_3F

	def_bg_events

	def_object_events
	object_event SPRITE_HIKER, 12, 9, STAY, LEFT, 1, OPP_BLACKBELT, 9
	object_event SPRITE_SUPER_NERD, 21, 13, STAY, LEFT, 2, OPP_JUGGLER, 2
	object_event SPRITE_COOLTRAINER_M, 19, 8, STAY, DOWN, 3, OPP_TAMER, 5
	object_event SPRITE_SUPER_NERD, 4, 2, STAY, DOWN, 4, OPP_POKEMANIAC, 6
	object_event SPRITE_SUPER_NERD, 26, 3, STAY, LEFT, 5, OPP_JUGGLER, 5
	object_event SPRITE_BIRD, 11, 5, STAY, UP, 6, MOLTRES, 50
	object_event SPRITE_POKE_BALL, 27, 5, STAY, NONE, 7, TM_SUBMISSION
	object_event SPRITE_POKE_BALL, 18, 9, STAY, NONE, 8, FULL_HEAL
	object_event SPRITE_POKE_BALL, 9, 11, STAY, NONE, 9, TM_MEGA_KICK
	object_event SPRITE_POKE_BALL, 11, 0, STAY, NONE, 10, GUARD_SPEC
	object_event SPRITE_BOULDER, 4, 14, STAY, BOULDER_MOVEMENT_BYTE_2, 11 ; person
	object_event SPRITE_BOULDER, 5, 5, STAY, BOULDER_MOVEMENT_BYTE_2, 12 ; person
	object_event SPRITE_BOULDER, 23, 16, STAY, BOULDER_MOVEMENT_BYTE_2, 13 ; person

	def_warps_to VICTORY_ROAD_2F
