Lab2Object: ; 0x75c45 (size=38)
	db $17 ; border block

	db $2 ; warps
	db $7, $2, $2, CINNABAR_LAB_1
	db $7, $3, $2, CINNABAR_LAB_1

	db $0 ; signs

	db $3 ; people
	db SPRITE_BLACK_HAIR_BOY_2, $2 + 4, $3 + 4, $ff, $d0, $1 ; person
	db SPRITE_OLD_PERSON, $4 + 4, $1 + 4, $ff, $ff, $2 ; person
	db SPRITE_FOULARD_WOMAN, $5 + 4, $5 + 4, $ff, $d1, $3 ; person

	; warp-to
	EVENT_DISP CINNABAR_LAB_2_WIDTH, $7, $2 ; CINNABAR_LAB_1
	EVENT_DISP CINNABAR_LAB_2_WIDTH, $7, $3 ; CINNABAR_LAB_1
