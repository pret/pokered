FuchsiaHouse3Object: ; 0x56221 (size=34)
	db $c ; border block

	db $3 ; warps
	db $0, $2, $8, $ff
	db $7, $2, $7, $ff
	db $7, $3, $7, $ff

	db $0 ; signs

	db $1 ; people
	db SPRITE_FISHER, $3 + 4, $5 + 4, $ff, $d3, $1 ; person

	; warp-to
	EVENT_DISP FUCHSIA_HOUSE_3_WIDTH, $0, $2
	EVENT_DISP FUCHSIA_HOUSE_3_WIDTH, $7, $2
	EVENT_DISP FUCHSIA_HOUSE_3_WIDTH, $7, $3
