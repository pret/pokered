VictoryRoad1F_Object:
	db $7d ; border block

	def_warp_events
	warp_event  8, 17, 2, LAST_MAP
	warp_event  9, 17, 2, LAST_MAP
	warp_event  1,  1, 0, VICTORY_ROAD_2F

	def_bg_events

	def_object_events
	object_event SPRITE_COOLTRAINER_F, 7, 5, STAY, RIGHT, 1, OPP_COOLTRAINER_F, 5
	object_event SPRITE_COOLTRAINER_M, 3, 2, STAY, DOWN, 2, OPP_COOLTRAINER_M, 5
	object_event SPRITE_POKE_BALL, 11, 0, STAY, NONE, 3, TM_SKY_ATTACK
	object_event SPRITE_POKE_BALL, 9, 2, STAY, NONE, 4, RARE_CANDY
	object_event SPRITE_BOULDER, 5, 15, STAY, BOULDER_MOVEMENT_BYTE_2, 5 ; person
	object_event SPRITE_BOULDER, 14, 2, STAY, BOULDER_MOVEMENT_BYTE_2, 6 ; person
	object_event SPRITE_BOULDER, 2, 10, STAY, BOULDER_MOVEMENT_BYTE_2, 7 ; person

	def_warps_to VICTORY_ROAD_1F
