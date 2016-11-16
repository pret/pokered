DiglettsCaveEntranceRoute11Object:
	db $7d ; border block

	db $3 ; warps
	db $7, $2, $4, $ff
	db $7, $3, $4, $ff
	db $4, $4, $1, DIGLETTS_CAVE

	db $0 ; signs

	db $1 ; objects
	object SPRITE_GAMBLER, $2, $3, STAY, NONE, $1 ; person

	; warp-to
	EVENT_DISP DIGLETTS_CAVE_ENTRANCE_WIDTH, $7, $2
	EVENT_DISP DIGLETTS_CAVE_ENTRANCE_WIDTH, $7, $3
	EVENT_DISP DIGLETTS_CAVE_ENTRANCE_WIDTH, $4, $4 ; DIGLETTS_CAVE
