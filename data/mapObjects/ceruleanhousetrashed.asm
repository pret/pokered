CeruleanHouseTrashedObject:
	db $a ; border block

	db $3 ; warps
	db $7, $2, $0, $ff
	db $7, $3, $0, $ff
	db $0, $3, $7, $ff

	db $1 ; signs
	db $0, $3, $3 ; CeruleanHouseTrashedText3

	db $2 ; objects
	object SPRITE_FISHER, $2, $1, STAY, DOWN, $1 ; person
	object SPRITE_GIRL, $5, $6, WALK, $2, $2 ; person

	; warp-to
	EVENT_DISP TRASHED_HOUSE_WIDTH, $7, $2
	EVENT_DISP TRASHED_HOUSE_WIDTH, $7, $3
	EVENT_DISP TRASHED_HOUSE_WIDTH, $0, $3
