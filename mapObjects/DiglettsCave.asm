DiglettsCaveObject: ; 0x61f72 (size=20)
	db $19 ; border tile

	db $2 ; warps
	db $5, $5, $2, DIGLETTS_CAVE_EXIT
	db $1f, $25, $2, DIGLETTS_CAVE_ENTRANCE

	db $0 ; signs

	db $0 ; people

	; warp-to
	EVENT_DISP $14, $5, $5 ; DIGLETTS_CAVE_EXIT
	EVENT_DISP $14, $1f, $25 ; DIGLETTS_CAVE_ENTRANCE
