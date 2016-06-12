IndigoPlateauObject:
	db $e ; border block

	db $2 ; warps
	db $5, $9, $0, INDIGO_PLATEAU_LOBBY
	db $5, $a, $0, INDIGO_PLATEAU_LOBBY

	db $0 ; signs

	db $0 ; objects

	; warp-to
	EVENT_DISP INDIGO_PLATEAU_WIDTH, $5, $9 ; INDIGO_PLATEAU_LOBBY
	EVENT_DISP INDIGO_PLATEAU_WIDTH, $5, $a ; INDIGO_PLATEAU_LOBBY
