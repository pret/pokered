Lab4Object: ; 0x75df0 (size=32)
	db $17 ; border block

	db $2 ; warps
	db $7, $2, $4, CINNABAR_LAB_1
	db $7, $3, $4, CINNABAR_LAB_1

	db $0 ; signs

	db $2 ; people
	db SPRITE_OAK_AIDE, $2 + 4, $5 + 4, $fe, $2, $1 ; person
	db SPRITE_OAK_AIDE, $6 + 4, $7 + 4, $ff, $d1, $2 ; person

	; warp-to
	EVENT_DISP CINNABAR_LAB_4_WIDTH, $7, $2 ; CINNABAR_LAB_1
	EVENT_DISP CINNABAR_LAB_4_WIDTH, $7, $3 ; CINNABAR_LAB_1
