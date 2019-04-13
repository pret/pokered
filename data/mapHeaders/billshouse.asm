BillsHouse_h:
	db INTERIOR ; tileset
	db BILLS_HOUSE_HEIGHT, BILLS_HOUSE_WIDTH ; dimensions (y, x)
	dw BillsHouseBlocks, BillsHouseTextPointers, BillsHouseScript ; blocks, texts, scripts
	db 0 ; connections
	dw BillsHouseObject ; objects
