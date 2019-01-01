IndigoPlateau_Object:
	db $e ; border block

	db 2 ; warps
	warp 9, 5, 0, INDIGO_PLATEAU_LOBBY
	warp 10, 5, 0, INDIGO_PLATEAU_LOBBY

	db 0 ; signs

	db 0 ; objects

	; warp-to
	warp_to 9, 5, INDIGO_PLATEAU_WIDTH ; INDIGO_PLATEAU_LOBBY
	warp_to 10, 5, INDIGO_PLATEAU_WIDTH ; INDIGO_PLATEAU_LOBBY
