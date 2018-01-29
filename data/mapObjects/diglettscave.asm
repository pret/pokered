DiglettsCaveObject:
	db $19 ; border block

	db $2 ; warps
	warp $5, $5, $2, DIGLETTS_CAVE_EXIT
	warp $25, $1f, $2, DIGLETTS_CAVE_ENTRANCE

	db $0 ; signs

	db $0 ; objects

	; warp-to
	warp_to $5, $5, DIGLETTS_CAVE_WIDTH ; DIGLETTS_CAVE_EXIT
	warp_to $25, $1f, DIGLETTS_CAVE_WIDTH ; DIGLETTS_CAVE_ENTRANCE
