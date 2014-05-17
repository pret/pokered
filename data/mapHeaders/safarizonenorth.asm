SafariZoneNorth_h: ; 0x4599f to 0x459ab (12 bytes) (bank=11) (id=218)
	db FOREST ; tileset
	db SAFARI_ZONE_NORTH_HEIGHT, SAFARI_ZONE_NORTH_WIDTH ; dimensions (y, x)
	dw SafariZoneNorthBlocks, SafariZoneNorthTextPointers, SafariZoneNorthScript ; blocks, texts, scripts
	db $00 ; connections
	dw SafariZoneNorthObject ; objects
