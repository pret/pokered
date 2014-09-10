VictoryRoad1Object: ; 0x5dab8 (size=76)
	db $7d ; border block

	db $3 ; warps
	db $11, $8, $2, $ff
	db $11, $9, $2, $ff
	db $1, $1, $0, VICTORY_ROAD_2

	db $0 ; signs

	db $7 ; people
	db SPRITE_LASS, $5 + 4, $7 + 4, $ff, $d3, TRAINER | $1, COOLTRAINER_F + $C8, $5
	db SPRITE_BLACK_HAIR_BOY_1, $2 + 4, $3 + 4, $ff, $d0, TRAINER | $2, COOLTRAINER_M + $C8, $5
	db SPRITE_BALL, $0 + 4, $b + 4, $ff, $ff, ITEM | $3, TM_43
	db SPRITE_BALL, $2 + 4, $9 + 4, $ff, $ff, ITEM | $4, RARE_CANDY
	db SPRITE_BOULDER, $f + 4, $5 + 4, $ff, BOULDER_MOVEMENT_BYTE_2, $5 ; person
	db SPRITE_BOULDER, $2 + 4, $e + 4, $ff, BOULDER_MOVEMENT_BYTE_2, $6 ; person
	db SPRITE_BOULDER, $a + 4, $2 + 4, $ff, BOULDER_MOVEMENT_BYTE_2, $7 ; person

	; warp-to
	EVENT_DISP VICTORY_ROAD_1_WIDTH, $11, $8
	EVENT_DISP VICTORY_ROAD_1_WIDTH, $11, $9
	EVENT_DISP VICTORY_ROAD_1_WIDTH, $1, $1 ; VICTORY_ROAD_2
