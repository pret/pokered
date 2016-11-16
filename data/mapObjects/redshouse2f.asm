RedsHouse2FObject:
	db $0A ; border block

	db $1 ; warps
	db $1, $7, $2, REDS_HOUSE_1F

	db $0 ; signs

	db $0 ; objects

	; warp-to
	EVENT_DISP REDS_HOUSE_2F_WIDTH, $1, $7
