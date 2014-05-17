SafariZoneRestHouse1_h: ; 0x45ce1 to 0x45ced (12 bytes) (bank=11) (id=221)
	db GATE ; tileset
	db SAFARI_ZONE_REST_HOUSE_1_HEIGHT, SAFARI_ZONE_REST_HOUSE_1_WIDTH ; dimensions (y, x)
	dw SafariZoneRestHouse1Blocks, SafariZoneRestHouse1TextPointers, SafariZoneRestHouse1Script ; blocks, texts, scripts
	db $00 ; connections
	dw SafariZoneRestHouse1Object ; objects
