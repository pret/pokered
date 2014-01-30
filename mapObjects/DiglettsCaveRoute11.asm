DiglettsCaveEntranceRoute11Object: ; 0x1e5ca (size=34)
	db $7d ; border tile

	db $3 ; warps
	db $7, $2, $4, $ff
	db $7, $3, $4, $ff
	db $4, $4, $1, DIGLETTS_CAVE

	db $0 ; signs

	db $1 ; people
	db SPRITE_GAMBLER, $3 + 4, $2 + 4, $ff, $ff, $1 ; person

	; warp-to
	EVENT_DISP $4, $7, $2
	EVENT_DISP $4, $7, $3
	EVENT_DISP $4, $4, $4 ; DIGLETTS_CAVE
