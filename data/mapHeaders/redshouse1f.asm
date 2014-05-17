RedsHouse1F_h: ; 4815c (12:415c)
	db REDS_HOUSE_1 ; tileset
	db REDS_HOUSE_1F_HEIGHT, REDS_HOUSE_1F_WIDTH ; dimensions
	dw RedsHouse1FBlocks, RedsHouse1FTextPointers, RedsHouse1FScript
	db 0 ; no connections
	dw RedsHouse1FObject
