VictoryRoad2Object: ; 0x51915 (size=154)
	db $7d ; border block

	db $7 ; warps
	db $8, $0, $2, VICTORY_ROAD_1
	db $7, $1d, $3, $ff
	db $8, $1d, $3, $ff
	db $7, $17, $0, VICTORY_ROAD_3
	db $e, $19, $2, VICTORY_ROAD_3
	db $7, $1b, $1, VICTORY_ROAD_3
	db $1, $1, $3, VICTORY_ROAD_3

	db $0 ; signs

	db $d ; people
	db SPRITE_HIKER, $9 + 4, $c + 4, $ff, $d2, TRAINER | $1, BLACKBELT + $C8, $9
	db SPRITE_BLACK_HAIR_BOY_2, $d + 4, $15 + 4, $ff, $d2, TRAINER | $2, JUGGLER + $C8, $2
	db SPRITE_BLACK_HAIR_BOY_1, $8 + 4, $13 + 4, $ff, $d0, TRAINER | $3, TAMER + $C8, $5
	db SPRITE_BLACK_HAIR_BOY_2, $2 + 4, $4 + 4, $ff, $d0, TRAINER | $4, POKEMANIAC + $C8, $6
	db SPRITE_BLACK_HAIR_BOY_2, $3 + 4, $1a + 4, $ff, $d2, TRAINER | $5, JUGGLER + $C8, $5
	db SPRITE_BIRD, $5 + 4, $b + 4, $ff, $d1, TRAINER | $6, MOLTRES, 50
	db SPRITE_BALL, $5 + 4, $1b + 4, $ff, $ff, ITEM | $7, TM_17
	db SPRITE_BALL, $9 + 4, $12 + 4, $ff, $ff, ITEM | $8, FULL_HEAL
	db SPRITE_BALL, $b + 4, $9 + 4, $ff, $ff, ITEM | $9, TM_05
	db SPRITE_BALL, $0 + 4, $b + 4, $ff, $ff, ITEM | $a, GUARD_SPEC_
	db SPRITE_BOULDER, $e + 4, $4 + 4, $ff, BOULDER_MOVEMENT_BYTE_2, $b ; person
	db SPRITE_BOULDER, $5 + 4, $5 + 4, $ff, BOULDER_MOVEMENT_BYTE_2, $c ; person
	db SPRITE_BOULDER, $10 + 4, $17 + 4, $ff, BOULDER_MOVEMENT_BYTE_2, $d ; person

	; warp-to
	EVENT_DISP VICTORY_ROAD_2_WIDTH, $8, $0 ; VICTORY_ROAD_1
	EVENT_DISP VICTORY_ROAD_2_WIDTH, $7, $1d
	EVENT_DISP VICTORY_ROAD_2_WIDTH, $8, $1d
	EVENT_DISP VICTORY_ROAD_2_WIDTH, $7, $17 ; VICTORY_ROAD_3
	EVENT_DISP VICTORY_ROAD_2_WIDTH, $e, $19 ; VICTORY_ROAD_3
	EVENT_DISP VICTORY_ROAD_2_WIDTH, $7, $1b ; VICTORY_ROAD_3
	EVENT_DISP VICTORY_ROAD_2_WIDTH, $1, $1 ; VICTORY_ROAD_3
