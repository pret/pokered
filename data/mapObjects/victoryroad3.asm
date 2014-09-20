VictoryRoad3Object: ; 0x44acd (size=106)
	db $7d ; border block

	db $4 ; warps
	db $7, $17, $3, VICTORY_ROAD_2
	db $8, $1a, $5, VICTORY_ROAD_2
	db $f, $1b, $4, VICTORY_ROAD_2
	db $0, $2, $6, VICTORY_ROAD_2

	db $0 ; signs

	db $a ; people
	db SPRITE_BLACK_HAIR_BOY_1, $5 + 4, $1c + 4, $ff, $d2, TRAINER | $1, COOLTRAINER_M + $C8, $2
	db SPRITE_LASS, $d + 4, $7 + 4, $ff, $d3, TRAINER | $2, COOLTRAINER_F + $C8, $2
	db SPRITE_BLACK_HAIR_BOY_1, $e + 4, $6 + 4, $ff, $d2, TRAINER | $3, COOLTRAINER_M + $C8, $3
	db SPRITE_LASS, $3 + 4, $d + 4, $ff, $d3, TRAINER | $4, COOLTRAINER_F + $C8, $3
	db SPRITE_BALL, $5 + 4, $1a + 4, $ff, $ff, ITEM | $5, MAX_REVIVE
	db SPRITE_BALL, $7 + 4, $7 + 4, $ff, $ff, ITEM | $6, TM_47
	db SPRITE_BOULDER, $3 + 4, $16 + 4, $ff, BOULDER_MOVEMENT_BYTE_2, $7 ; person
	db SPRITE_BOULDER, $c + 4, $d + 4, $ff, BOULDER_MOVEMENT_BYTE_2, $8 ; person
	db SPRITE_BOULDER, $a + 4, $18 + 4, $ff, BOULDER_MOVEMENT_BYTE_2, $9 ; person
	db SPRITE_BOULDER, $f + 4, $16 + 4, $ff, BOULDER_MOVEMENT_BYTE_2, $a ; person

	; warp-to
	EVENT_DISP VICTORY_ROAD_3_WIDTH, $7, $17 ; VICTORY_ROAD_2
	EVENT_DISP VICTORY_ROAD_3_WIDTH, $8, $1a ; VICTORY_ROAD_2
	EVENT_DISP VICTORY_ROAD_3_WIDTH, $f, $1b ; VICTORY_ROAD_2
	EVENT_DISP VICTORY_ROAD_3_WIDTH, $0, $2 ; VICTORY_ROAD_2
