Route7GateObject: ; 0x1e185 (size=42)
	db $a ; border tile

	db $4 ; warps
	db $3, $0, $3, $ff
	db $4, $0, $3, $ff
	db $3, $5, $0, $ff
	db $4, $5, $1, $ff

	db $0 ; signs

	db $1 ; people
	db SPRITE_GUARD, $1 + 4, $3 + 4, $ff, $d0, $1 ; person

	; warp-to
	EVENT_DISP $3, $3, $0
	EVENT_DISP $3, $4, $0
	EVENT_DISP $3, $3, $5
	EVENT_DISP $3, $4, $5
