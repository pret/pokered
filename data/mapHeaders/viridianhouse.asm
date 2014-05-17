ViridianHouse_h: ; 0x1d57d to 0x1d589 (12 bytes) (bank=7) (id=44)
	db HOUSE ; tileset
	db VIRIDIAN_HOUSE_HEIGHT, VIRIDIAN_HOUSE_WIDTH ; dimensions (y, x)
	dw ViridianHouseBlocks, ViridianHouseTextPointers, ViridianHouseScript ; blocks, texts, scripts
	db $00 ; connections
	dw ViridianHouseObject ; objects

	db $0
