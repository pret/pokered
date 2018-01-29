CeruleanHouseTrashedObject:
	db $a ; border block

	db $3 ; warps
	warp $2, $7, $0, $ff
	warp $3, $7, $0, $ff
	warp $3, $0, $7, $ff

	db $1 ; signs
	sign $3, $0, $3 ; CeruleanHouseTrashedText3

	db $2 ; objects
	object SPRITE_FISHER, $2, $1, STAY, DOWN, $1 ; person
	object SPRITE_GIRL, $5, $6, WALK, $2, $2 ; person

	; warp-to
	warp_to $2, $7, TRASHED_HOUSE_WIDTH
	warp_to $3, $7, TRASHED_HOUSE_WIDTH
	warp_to $3, $0, TRASHED_HOUSE_WIDTH
