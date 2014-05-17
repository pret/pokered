SSAnne8Object: ; 0x61a60 (size=127)
	db $c ; border block

	db $6 ; warps
	db $0, $0, $2, SS_ANNE_1
	db $0, $a, $3, SS_ANNE_1
	db $0, $14, $4, SS_ANNE_1
	db $a, $0, $5, SS_ANNE_1
	db $a, $a, $6, SS_ANNE_1
	db $a, $14, $7, SS_ANNE_1

	db $0 ; signs

	db $b ; people
	db SPRITE_GENTLEMAN, $3 + 4, $2 + 4, $ff, $d2, $41, GENTLEMAN + $C8, $1 ; trainer
	db SPRITE_GENTLEMAN, $4 + 4, $b + 4, $ff, $d1, $42, GENTLEMAN + $C8, $2 ; trainer
	db SPRITE_BUG_CATCHER, $e + 4, $b + 4, $ff, $d1, $43, YOUNGSTER + $C8, $8 ; trainer
	db SPRITE_LASS, $b + 4, $d + 4, $ff, $d2, $44, LASS + $C8, $b ; trainer
	db SPRITE_GIRL, $3 + 4, $16 + 4, $fe, $1, $5 ; person
	db SPRITE_FAT_BALD_GUY, $e + 4, $0 + 4, $ff, $ff, $6 ; person
	db SPRITE_LITTLE_GIRL, $b + 4, $2 + 4, $ff, $d0, $7 ; person
	db SPRITE_CLEFAIRY, $b + 4, $3 + 4, $ff, $d0, $8 ; person
	db SPRITE_GIRL, $d + 4, $a + 4, $ff, $d3, $9 ; person
	db SPRITE_BALL, $f + 4, $c + 4, $ff, $ff, $8a, TM_08 ; item
	db SPRITE_GENTLEMAN, $d + 4, $15 + 4, $fe, $2, $b ; person

	; warp-to
	EVENT_DISP SS_ANNE_8_WIDTH, $0, $0 ; SS_ANNE_1
	EVENT_DISP SS_ANNE_8_WIDTH, $0, $a ; SS_ANNE_1
	EVENT_DISP SS_ANNE_8_WIDTH, $0, $14 ; SS_ANNE_1
	EVENT_DISP SS_ANNE_8_WIDTH, $a, $0 ; SS_ANNE_1
	EVENT_DISP SS_ANNE_8_WIDTH, $a, $a ; SS_ANNE_1
	EVENT_DISP SS_ANNE_8_WIDTH, $a, $14 ; SS_ANNE_1
