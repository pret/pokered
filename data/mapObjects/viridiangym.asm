ViridianGymObject: ; 0x74bde (size=105)
	db $3 ; border block

	db $2 ; warps
	db $11, $10, $4, $ff
	db $11, $11, $4, $ff

	db $0 ; signs

	db $b ; people
	db SPRITE_GIOVANNI, $1 + 4, $2 + 4, $ff, $d0, $41, GIOVANNI + $C8, $3 ; trainer
	db SPRITE_BLACK_HAIR_BOY_1, $7 + 4, $c + 4, $ff, $d0, $42, COOLTRAINER_M + $C8, $9 ; trainer
	db SPRITE_HIKER, $b + 4, $b + 4, $ff, $d1, $43, BLACKBELT + $C8, $6 ; trainer
	db SPRITE_ROCKER, $7 + 4, $a + 4, $ff, $d0, $44, TAMER + $C8, $3 ; trainer
	db SPRITE_HIKER, $7 + 4, $3 + 4, $ff, $d2, $45, BLACKBELT + $C8, $7 ; trainer
	db SPRITE_BLACK_HAIR_BOY_1, $5 + 4, $d + 4, $ff, $d3, $46, COOLTRAINER_M + $C8, $a ; trainer
	db SPRITE_HIKER, $1 + 4, $a + 4, $ff, $d0, $47, BLACKBELT + $C8, $8 ; trainer
	db SPRITE_ROCKER, $10 + 4, $2 + 4, $ff, $d3, $48, TAMER + $C8, $4 ; trainer
	db SPRITE_BLACK_HAIR_BOY_1, $5 + 4, $6 + 4, $ff, $d0, $49, COOLTRAINER_M + $C8, $1 ; trainer
	db SPRITE_GYM_HELPER, $f + 4, $10 + 4, $ff, $d0, $a ; person
	db SPRITE_BALL, $9 + 4, $10 + 4, $ff, $ff, $8b, REVIVE ; item

	; warp-to
	EVENT_DISP VIRIDIAN_GYM_WIDTH, $11, $10
	EVENT_DISP VIRIDIAN_GYM_WIDTH, $11, $11
