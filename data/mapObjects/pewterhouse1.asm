PewterHouse1Object: ; 0x1d616 (size=38)
	db $a ; border block

	db $2 ; warps
	db $7, $2, $3, $ff
	db $7, $3, $3, $ff

	db $0 ; signs

	db $3 ; people
	db SPRITE_SLOWBRO, $5 + 4, $4 + 4, $ff, $d2, $1 ; person
	db SPRITE_YOUNG_BOY, $5 + 4, $3 + 4, $ff, $d3, $2 ; person
	db SPRITE_FAT_BALD_GUY, $2 + 4, $1 + 4, $ff, $ff, $3 ; person

	; warp-to
	EVENT_DISP PEWTER_HOUSE_1_WIDTH, $7, $2
	EVENT_DISP PEWTER_HOUSE_1_WIDTH, $7, $3
