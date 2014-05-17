VictoryRoad3Object: ; 0x44acd (size=106)
	db $7d ; border block

	db $4 ; warps
	db $7, $17, $3, VICTORY_ROAD_2
	db $8, $1a, $5, VICTORY_ROAD_2
	db $f, $1b, $4, VICTORY_ROAD_2
	db $0, $2, $6, VICTORY_ROAD_2

	db $0 ; signs

	db $a ; people
	db SPRITE_BLACK_HAIR_BOY_1, $5 + 4, $1c + 4, $ff, $d2, $41, COOLTRAINER_M + $C8, $2 ; trainer
	db SPRITE_LASS, $d + 4, $7 + 4, $ff, $d3, $42, COOLTRAINER_F + $C8, $2 ; trainer
	db SPRITE_BLACK_HAIR_BOY_1, $e + 4, $6 + 4, $ff, $d2, $43, COOLTRAINER_M + $C8, $3 ; trainer
	db SPRITE_LASS, $3 + 4, $d + 4, $ff, $d3, $44, COOLTRAINER_F + $C8, $3 ; trainer
	db SPRITE_BALL, $5 + 4, $1a + 4, $ff, $ff, $85, MAX_REVIVE ; item
	db SPRITE_BALL, $7 + 4, $7 + 4, $ff, $ff, $86, TM_47 ; item
	db SPRITE_BOULDER, $3 + 4, $16 + 4, $ff, $10, $7 ; person
	db SPRITE_BOULDER, $c + 4, $d + 4, $ff, $10, $8 ; person
	db SPRITE_BOULDER, $a + 4, $18 + 4, $ff, $10, $9 ; person
	db SPRITE_BOULDER, $f + 4, $16 + 4, $ff, $10, $a ; person

	; warp-to
	EVENT_DISP VICTORY_ROAD_3_WIDTH, $7, $17 ; VICTORY_ROAD_2
	EVENT_DISP VICTORY_ROAD_3_WIDTH, $8, $1a ; VICTORY_ROAD_2
	EVENT_DISP VICTORY_ROAD_3_WIDTH, $f, $1b ; VICTORY_ROAD_2
	EVENT_DISP VICTORY_ROAD_3_WIDTH, $0, $2 ; VICTORY_ROAD_2
