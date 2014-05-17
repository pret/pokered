SafariZoneWest_h: ; 0x4a1a9 to 0x4a1b5 (12 bytes) (id=219)
	db FOREST ; tileset
	db SAFARI_ZONE_WEST_HEIGHT, SAFARI_ZONE_WEST_WIDTH ; dimensions (y, x)
	dw SafariZoneWestBlocks, SafariZoneWestTextPointers, SafariZoneWestScript ; blocks, texts, scripts
	db $00 ; connections
	dw SafariZoneWestObject ; objects
