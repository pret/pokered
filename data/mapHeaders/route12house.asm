Route12House_h: ; 0x56473 to 0x5647f (12 bytes) (id=189)
	db HOUSE ; tileset
	db ROUTE_12_HOUSE_HEIGHT, ROUTE_12_HOUSE_WIDTH ; dimensions (y, x)
	dw Route12HouseBlocks, Route12HouseTextPointers, Route12HouseScript ; blocks, texts, scripts
	db $00 ; connections
	dw Route12HouseObject ; objects
