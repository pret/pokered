ViridianHouse_h:
	db HOUSE ; tileset
	db VIRIDIAN_HOUSE_HEIGHT, VIRIDIAN_HOUSE_WIDTH ; dimensions (y, x)
	dw ViridianHouseBlocks, ViridianHouseTextPointers, ViridianHouseScript ; blocks, texts, scripts
	db 0 ; connections
	dw ViridianHouseObject ; objects
