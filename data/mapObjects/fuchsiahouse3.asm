FuchsiaHouse3Object:
	db $c ; border block

	db $3 ; warps
	warp $2, $0, $8, $ff
	warp $2, $7, $7, $ff
	warp $3, $7, $7, $ff

	db $0 ; signs

	db $1 ; objects
	object SPRITE_FISHER, $5, $3, STAY, RIGHT, $1 ; person

	; warp-to
	warp_to $2, $0, FUCHSIA_HOUSE_3_WIDTH
	warp_to $2, $7, FUCHSIA_HOUSE_3_WIDTH
	warp_to $3, $7, FUCHSIA_HOUSE_3_WIDTH
