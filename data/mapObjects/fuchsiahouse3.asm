FuchsiaHouse3Object:
	db $c ; border block

	db $3 ; warps
	db $0, $2, $8, $ff
	db $7, $2, $7, $ff
	db $7, $3, $7, $ff

	db $0 ; signs

	db $1 ; objects
	object SPRITE_FISHER, $5, $3, STAY, RIGHT, $1 ; person

	; warp-to
	EVENT_DISP FUCHSIA_HOUSE_3_WIDTH, $0, $2
	EVENT_DISP FUCHSIA_HOUSE_3_WIDTH, $7, $2
	EVENT_DISP FUCHSIA_HOUSE_3_WIDTH, $7, $3
