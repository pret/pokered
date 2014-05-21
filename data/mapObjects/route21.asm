Route21Object: ; 0x55021 (size=76)
	db $43 ; border block

	db $0 ; warps

	db $0 ; signs

	db $9 ; people
	db SPRITE_FISHER2, $18 + 4, $4 + 4, $ff, $d2, TRAINER | $1, FISHER + $C8, $7
	db SPRITE_FISHER2, $19 + 4, $6 + 4, $ff, $d0, TRAINER | $2, FISHER + $C8, $9
	db SPRITE_SWIMMER, $1f + 4, $a + 4, $ff, $d1, TRAINER | $3, SWIMMER + $C8, $c
	db SPRITE_SWIMMER, $1e + 4, $c + 4, $ff, $d3, TRAINER | $4, CUE_BALL + $C8, $9
	db SPRITE_SWIMMER, $3f + 4, $10 + 4, $ff, $d0, TRAINER | $5, SWIMMER + $C8, $d
	db SPRITE_SWIMMER, $47 + 4, $5 + 4, $ff, $d3, TRAINER | $6, SWIMMER + $C8, $e
	db SPRITE_SWIMMER, $47 + 4, $f + 4, $ff, $d2, TRAINER | $7, SWIMMER + $C8, $f
	db SPRITE_FISHER2, $38 + 4, $e + 4, $ff, $d2, TRAINER | $8, FISHER + $C8, $8
	db SPRITE_FISHER2, $39 + 4, $11 + 4, $ff, $d3, TRAINER | $9, FISHER + $C8, $a
