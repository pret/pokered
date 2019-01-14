DiglettsCave_Object:
	db $19 ; border block

	db 2 ; warps
	warp 5, 5, 2, DIGLETTS_CAVE_ROUTE_2
	warp 37, 31, 2, DIGLETTS_CAVE_ROUTE_11

	db 0 ; signs

	db 0 ; objects

	; warp-to
	warp_to 5, 5, DIGLETTS_CAVE_WIDTH ; DIGLETTS_CAVE_ROUTE_2
	warp_to 37, 31, DIGLETTS_CAVE_WIDTH ; DIGLETTS_CAVE_ROUTE_11
