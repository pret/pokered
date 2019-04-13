SafariZoneEast_h:
	db FOREST ; tileset
	db SAFARI_ZONE_EAST_HEIGHT, SAFARI_ZONE_EAST_WIDTH ; dimensions (y, x)
	dw SafariZoneEastBlocks, SafariZoneEastTextPointers, SafariZoneEastScript ; blocks, texts, scripts
	db 0 ; connections
	dw SafariZoneEastObject ; objects
