VictoryRoad2Object:
	db $7d ; border block

	db $7 ; warps
	warp $0, $8, $2, VICTORY_ROAD_1
	warp $1d, $7, $3, $ff
	warp $1d, $8, $3, $ff
	warp $17, $7, $0, VICTORY_ROAD_3
	warp $19, $e, $2, VICTORY_ROAD_3
	warp $1b, $7, $1, VICTORY_ROAD_3
	warp $1, $1, $3, VICTORY_ROAD_3

	db $0 ; signs

	db $d ; objects
	object SPRITE_HIKER, $c, $9, STAY, LEFT, $1, OPP_BLACKBELT, $9
	object SPRITE_BLACK_HAIR_BOY_2, $15, $d, STAY, LEFT, $2, OPP_JUGGLER, $2
	object SPRITE_BLACK_HAIR_BOY_1, $13, $8, STAY, DOWN, $3, OPP_TAMER, $5
	object SPRITE_BLACK_HAIR_BOY_2, $4, $2, STAY, DOWN, $4, OPP_POKEMANIAC, $6
	object SPRITE_BLACK_HAIR_BOY_2, $1a, $3, STAY, LEFT, $5, OPP_JUGGLER, $5
	object SPRITE_BIRD, $b, $5, STAY, UP, $6, MOLTRES, 50
	object SPRITE_BALL, $1b, $5, STAY, NONE, $7, TM_17
	object SPRITE_BALL, $12, $9, STAY, NONE, $8, FULL_HEAL
	object SPRITE_BALL, $9, $b, STAY, NONE, $9, TM_05
	object SPRITE_BALL, $b, $0, STAY, NONE, $a, GUARD_SPEC
	object SPRITE_BOULDER, $4, $e, STAY, BOULDER_MOVEMENT_BYTE_2, $b ; person
	object SPRITE_BOULDER, $5, $5, STAY, BOULDER_MOVEMENT_BYTE_2, $c ; person
	object SPRITE_BOULDER, $17, $10, STAY, BOULDER_MOVEMENT_BYTE_2, $d ; person

	; warp-to
	warp_to $0, $8, VICTORY_ROAD_2_WIDTH ; VICTORY_ROAD_1
	warp_to $1d, $7, VICTORY_ROAD_2_WIDTH
	warp_to $1d, $8, VICTORY_ROAD_2_WIDTH
	warp_to $17, $7, VICTORY_ROAD_2_WIDTH ; VICTORY_ROAD_3
	warp_to $19, $e, VICTORY_ROAD_2_WIDTH ; VICTORY_ROAD_3
	warp_to $1b, $7, VICTORY_ROAD_2_WIDTH ; VICTORY_ROAD_3
	warp_to $1, $1, VICTORY_ROAD_2_WIDTH ; VICTORY_ROAD_3
