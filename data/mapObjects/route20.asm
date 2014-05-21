Route20Object: ; 0x50113 (size=106)
	db $43 ; border block

	db $2 ; warps
	db $5, $30, $0, SEAFOAM_ISLANDS_1
	db $9, $3a, $2, SEAFOAM_ISLANDS_1

	db $2 ; signs
	db $7, $33, $b ; Route20Text11
	db $b, $39, $c ; Route20Text12

	db $a ; people
	db SPRITE_SWIMMER, $8 + 4, $57 + 4, $ff, $d1, TRAINER | $1, SWIMMER + $C8, $9
	db SPRITE_SWIMMER, $b + 4, $44 + 4, $ff, $d1, TRAINER | $2, BEAUTY + $C8, $f
	db SPRITE_SWIMMER, $a + 4, $2d + 4, $ff, $d0, TRAINER | $3, BEAUTY + $C8, $6
	db SPRITE_SWIMMER, $e + 4, $37 + 4, $ff, $d3, TRAINER | $4, JR__TRAINER_F + $C8, $18
	db SPRITE_SWIMMER, $d + 4, $26 + 4, $ff, $d0, TRAINER | $5, SWIMMER + $C8, $a
	db SPRITE_SWIMMER, $d + 4, $57 + 4, $ff, $d1, TRAINER | $6, SWIMMER + $C8, $b
	db SPRITE_BLACK_HAIR_BOY_1, $9 + 4, $22 + 4, $ff, $d1, TRAINER | $7, BIRD_KEEPER + $C8, $b
	db SPRITE_SWIMMER, $7 + 4, $19 + 4, $ff, $d1, TRAINER | $8, BEAUTY + $C8, $7
	db SPRITE_SWIMMER, $c + 4, $18 + 4, $ff, $d0, TRAINER | $9, JR__TRAINER_F + $C8, $10
	db SPRITE_SWIMMER, $8 + 4, $f + 4, $ff, $d1, TRAINER | $a, BEAUTY + $C8, $8

	; warp-to
	EVENT_DISP ROUTE_20_WIDTH, $5, $30 ; SEAFOAM_ISLANDS_1
	EVENT_DISP ROUTE_20_WIDTH, $9, $3a ; SEAFOAM_ISLANDS_1
