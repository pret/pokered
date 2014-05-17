SafariZoneEntrance_h: ; 0x751c1 to 0x751cd (12 bytes) (id=156)
	db GATE ; tileset
	db SAFARI_ZONE_ENTRANCE_HEIGHT, SAFARI_ZONE_ENTRANCE_WIDTH ; dimensions (y, x)
	dw SafariZoneEntranceBlocks, SafariZoneEntranceTextPointers, SafariZoneEntranceScript ; blocks, texts, scripts
	db $00 ; connections
	dw SafariZoneEntranceObject ; objects
