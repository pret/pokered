SafariZoneEast_h: ; 0x4585f to 0x4586b (12 bytes) (bank=11) (id=217)
	db FOREST ; tileset
	db SAFARI_ZONE_EAST_HEIGHT, SAFARI_ZONE_EAST_WIDTH ; dimensions (y, x)
	dw SafariZoneEastBlocks, SafariZoneEastTextPointers, SafariZoneEastScript ; blocks, texts, scripts
	db $00 ; connections
	dw SafariZoneEastObject ; objects
