SafariZoneRestHouse4_h: ; 0x45db4 to 0x45dc0 (12 bytes) (bank=11) (id=225)
	db GATE ; tileset
	db SAFARI_ZONE_REST_HOUSE_4_HEIGHT, SAFARI_ZONE_REST_HOUSE_4_WIDTH ; dimensions (y, x)
	dw SafariZoneRestHouse4Blocks, SafariZoneRestHouse4TextPointers, SafariZoneRestHouse4Script ; blocks, texts, scripts
	db $00 ; connections
	dw SafariZoneRestHouse4Object ; objects
