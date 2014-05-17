SafariZoneRestHouse3_h: ; 0x45d69 to 0x45d75 (12 bytes) (bank=11) (id=224)
	db GATE ; tileset
	db SAFARI_ZONE_REST_HOUSE_3_HEIGHT, SAFARI_ZONE_REST_HOUSE_3_WIDTH ; dimensions (y, x)
	dw SafariZoneRestHouse3Blocks, SafariZoneRestHouse3TextPointers, SafariZoneRestHouse3Script ; blocks, texts, scripts
	db $00 ; connections
	dw SafariZoneRestHouse3Object ; objects
