SafariZoneRestHouse2_h: ; 0x45d1e to 0x45d2a (12 bytes) (bank=11) (id=223)
	db GATE ; tileset
	db SAFARI_ZONE_REST_HOUSE_2_HEIGHT, SAFARI_ZONE_REST_HOUSE_2_WIDTH ; dimensions (y, x)
	dw SafariZoneRestHouse2Blocks, SafariZoneRestHouse2TextPointers, SafariZoneRestHouse2Script ; blocks, texts, scripts
	db $00 ; connections
	dw SafariZoneRestHouse2Object ; objects
