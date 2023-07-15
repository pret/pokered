	object_const_def
	const VICTORYROAD3F_COOLTRAINER_M1
	const VICTORYROAD3F_COOLTRAINER_F1
	const VICTORYROAD3F_COOLTRAINER_M2
	const VICTORYROAD3F_COOLTRAINER_F2
	const VICTORYROAD3F_MAX_REVIVE
	const VICTORYROAD3F_TM_EXPLOSION
	const VICTORYROAD3F_BOULDER1
	const VICTORYROAD3F_BOULDER2
	const VICTORYROAD3F_BOULDER3
	const VICTORYROAD3F_BOULDER4

VictoryRoad3F_Object:
	db $7d ; border block

	def_warp_events
	warp_event 23,  7, VICTORY_ROAD_2F, 4
	warp_event 26,  8, VICTORY_ROAD_2F, 6
	warp_event 27, 15, VICTORY_ROAD_2F, 5
	warp_event  2,  0, VICTORY_ROAD_2F, 7

	def_bg_events

	def_object_events
	object_event 28,  5, SPRITE_COOLTRAINER_M, STAY, LEFT, TEXT_VICTORYROAD3F_COOLTRAINER_M1, OPP_COOLTRAINER_M, 2
	object_event  7, 13, SPRITE_COOLTRAINER_F, STAY, RIGHT, TEXT_VICTORYROAD3F_COOLTRAINER_F1, OPP_COOLTRAINER_F, 2
	object_event  6, 14, SPRITE_COOLTRAINER_M, STAY, LEFT, TEXT_VICTORYROAD3F_COOLTRAINER_M2, OPP_COOLTRAINER_M, 3
	object_event 13,  3, SPRITE_COOLTRAINER_F, STAY, RIGHT, TEXT_VICTORYROAD3F_COOLTRAINER_F2, OPP_COOLTRAINER_F, 3
	object_event 26,  5, SPRITE_POKE_BALL, STAY, NONE, TEXT_VICTORYROAD3F_MAX_REVIVE, MAX_REVIVE
	object_event  7,  7, SPRITE_POKE_BALL, STAY, NONE, TEXT_VICTORYROAD3F_TM_EXPLOSION, TM_EXPLOSION
	object_event 22,  3, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, TEXT_VICTORYROAD3F_BOULDER1
	object_event 13, 12, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, TEXT_VICTORYROAD3F_BOULDER2
	object_event 24, 10, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, TEXT_VICTORYROAD3F_BOULDER3
	object_event 22, 15, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, TEXT_VICTORYROAD3F_BOULDER4

	def_warps_to VICTORY_ROAD_3F
