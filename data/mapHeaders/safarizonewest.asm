SafariZoneWest_h:
	db FOREST ; tileset
	db SAFARI_ZONE_WEST_HEIGHT, SAFARI_ZONE_WEST_WIDTH ; dimensions (y, x)
	dw SafariZoneWestBlocks, SafariZoneWestTextPointers, SafariZoneWestScript ; blocks, texts, scripts
	db 0 ; connections
	dw SafariZoneWestObject ; objects
