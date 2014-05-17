Route20Object: ; 0x50113 (size=106)
	db $43 ; border block

	db $2 ; warps
	db $5, $30, $0, SEAFOAM_ISLANDS_1
	db $9, $3a, $2, SEAFOAM_ISLANDS_1

	db $2 ; signs
	db $7, $33, $b ; Route20Text11
	db $b, $39, $c ; Route20Text12

	db $a ; people
	db SPRITE_SWIMMER, $8 + 4, $57 + 4, $ff, $d1, $41, SWIMMER + $C8, $9 ; trainer
	db SPRITE_SWIMMER, $b + 4, $44 + 4, $ff, $d1, $42, BEAUTY + $C8, $f ; trainer
	db SPRITE_SWIMMER, $a + 4, $2d + 4, $ff, $d0, $43, BEAUTY + $C8, $6 ; trainer
	db SPRITE_SWIMMER, $e + 4, $37 + 4, $ff, $d3, $44, JR__TRAINER_F + $C8, $18 ; trainer
	db SPRITE_SWIMMER, $d + 4, $26 + 4, $ff, $d0, $45, SWIMMER + $C8, $a ; trainer
	db SPRITE_SWIMMER, $d + 4, $57 + 4, $ff, $d1, $46, SWIMMER + $C8, $b ; trainer
	db SPRITE_BLACK_HAIR_BOY_1, $9 + 4, $22 + 4, $ff, $d1, $47, BIRD_KEEPER + $C8, $b ; trainer
	db SPRITE_SWIMMER, $7 + 4, $19 + 4, $ff, $d1, $48, BEAUTY + $C8, $7 ; trainer
	db SPRITE_SWIMMER, $c + 4, $18 + 4, $ff, $d0, $49, JR__TRAINER_F + $C8, $10 ; trainer
	db SPRITE_SWIMMER, $8 + 4, $f + 4, $ff, $d1, $4a, BEAUTY + $C8, $8 ; trainer

	; warp-to
	EVENT_DISP ROUTE_20_WIDTH, $5, $30 ; SEAFOAM_ISLANDS_1
	EVENT_DISP ROUTE_20_WIDTH, $9, $3a ; SEAFOAM_ISLANDS_1
