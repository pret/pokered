BillsHouse_h: ; 0x1e75e to 0x1e76a (12 bytes) (bank=7) (id=88)
	db INTERIOR ; tileset
	db BILLS_HOUSE_HEIGHT, BILLS_HOUSE_WIDTH ; dimensions (y, x)
	dw BillsHouseBlocks, BillsHouseTextPointers, BillsHouseScript ; blocks, texts, scripts
	db $00 ; connections
	dw BillsHouseObject ; objects
