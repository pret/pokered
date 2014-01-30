Route6GateObject: ; 0x1e0be (size=42)
	db $a ; border tile

	db $4 ; warps
	db $5, $3, $2, $ff
	db $5, $4, $2, $ff
	db $0, $3, $1, $ff
	db $0, $4, $1, $ff

	db $0 ; signs

	db $1 ; people
	db SPRITE_GUARD, $2 + 4, $6 + 4, $ff, $d2, $1 ; person

	; warp-to
	EVENT_DISP $4, $5, $3
	EVENT_DISP $4, $5, $4
	EVENT_DISP $4, $0, $3
	EVENT_DISP $4, $0, $4
