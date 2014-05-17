CeruleanHouseTrashedObject: ; 0x1d6bf (size=43)
	db $a ; border block

	db $3 ; warps
	db $7, $2, $0, $ff
	db $7, $3, $0, $ff
	db $0, $3, $7, $ff

	db $1 ; signs
	db $0, $3, $3 ; CeruleanHouseTrashedText3

	db $2 ; people
	db SPRITE_FISHER, $1 + 4, $2 + 4, $ff, $d0, $1 ; person
	db SPRITE_GIRL, $6 + 4, $5 + 4, $fe, $2, $2 ; person

	; warp-to
	EVENT_DISP TRASHED_HOUSE_WIDTH, $7, $2
	EVENT_DISP TRASHED_HOUSE_WIDTH, $7, $3
	EVENT_DISP TRASHED_HOUSE_WIDTH, $0, $3
