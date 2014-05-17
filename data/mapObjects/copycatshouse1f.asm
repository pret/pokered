CopycatsHouse1FObject: ; 0x75ee3 (size=46)
	db $a ; border block

	db $3 ; warps
	db $7, $2, $0, $ff
	db $7, $3, $0, $ff
	db $1, $7, $0, COPYCATS_HOUSE_2F

	db $0 ; signs

	db $3 ; people
	db SPRITE_MOM_GEISHA, $2 + 4, $2 + 4, $ff, $d0, $1 ; person
	db SPRITE_FAT_BALD_GUY, $4 + 4, $5 + 4, $ff, $d2, $2 ; person
	db SPRITE_CLEFAIRY, $4 + 4, $1 + 4, $fe, $1, $3 ; person

	; warp-to
	EVENT_DISP COPYCATS_HOUSE_1F_WIDTH, $7, $2
	EVENT_DISP COPYCATS_HOUSE_1F_WIDTH, $7, $3
	EVENT_DISP COPYCATS_HOUSE_1F_WIDTH, $1, $7 ; COPYCATS_HOUSE_2F
