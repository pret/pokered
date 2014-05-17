Route21Object: ; 0x55021 (size=76)
	db $43 ; border block

	db $0 ; warps

	db $0 ; signs

	db $9 ; people
	db SPRITE_FISHER2, $18 + 4, $4 + 4, $ff, $d2, $41, FISHER + $C8, $7 ; trainer
	db SPRITE_FISHER2, $19 + 4, $6 + 4, $ff, $d0, $42, FISHER + $C8, $9 ; trainer
	db SPRITE_SWIMMER, $1f + 4, $a + 4, $ff, $d1, $43, SWIMMER + $C8, $c ; trainer
	db SPRITE_SWIMMER, $1e + 4, $c + 4, $ff, $d3, $44, CUE_BALL + $C8, $9 ; trainer
	db SPRITE_SWIMMER, $3f + 4, $10 + 4, $ff, $d0, $45, SWIMMER + $C8, $d ; trainer
	db SPRITE_SWIMMER, $47 + 4, $5 + 4, $ff, $d3, $46, SWIMMER + $C8, $e ; trainer
	db SPRITE_SWIMMER, $47 + 4, $f + 4, $ff, $d2, $47, SWIMMER + $C8, $f ; trainer
	db SPRITE_FISHER2, $38 + 4, $e + 4, $ff, $d2, $48, FISHER + $C8, $8 ; trainer
	db SPRITE_FISHER2, $39 + 4, $11 + 4, $ff, $d3, $49, FISHER + $C8, $a ; trainer
