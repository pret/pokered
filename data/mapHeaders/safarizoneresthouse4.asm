SafariZoneRestHouse4_h:
	db GATE ; tileset
	db SAFARI_ZONE_REST_HOUSE_4_HEIGHT, SAFARI_ZONE_REST_HOUSE_4_WIDTH ; dimensions (y, x)
	dw SafariZoneRestHouse4Blocks, SafariZoneRestHouse4TextPointers, SafariZoneRestHouse4Script ; blocks, texts, scripts
	db $00 ; connections
	dw SafariZoneRestHouse4Object ; objects
