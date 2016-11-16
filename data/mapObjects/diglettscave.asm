DiglettsCaveObject:
	db $19 ; border block

	db $2 ; warps
	db $5, $5, $2, DIGLETTS_CAVE_EXIT
	db $1f, $25, $2, DIGLETTS_CAVE_ENTRANCE

	db $0 ; signs

	db $0 ; objects

	; warp-to
	EVENT_DISP DIGLETTS_CAVE_WIDTH, $5, $5 ; DIGLETTS_CAVE_EXIT
	EVENT_DISP DIGLETTS_CAVE_WIDTH, $1f, $25 ; DIGLETTS_CAVE_ENTRANCE
