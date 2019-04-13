SafariZoneEntrance_h:
	db GATE ; tileset
	db SAFARI_ZONE_ENTRANCE_HEIGHT, SAFARI_ZONE_ENTRANCE_WIDTH ; dimensions (y, x)
	dw SafariZoneEntranceBlocks, SafariZoneEntranceTextPointers, SafariZoneEntranceScript ; blocks, texts, scripts
	db 0 ; connections
	dw SafariZoneEntranceObject ; objects
