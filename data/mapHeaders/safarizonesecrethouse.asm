SafariZoneSecretHouse_h: ; 0x4a30b to 0x4a317 (12 bytes) (id=222)
	db LAB ; tileset
	db SAFARI_ZONE_SECRET_HOUSE_HEIGHT, SAFARI_ZONE_SECRET_HOUSE_WIDTH ; dimensions (y, x)
	dw SafariZoneSecretHouseBlocks, SafariZoneSecretHouseTextPointers, SafariZoneSecretHouseScript ; blocks, texts, scripts
	db $00 ; connections
	dw SafariZoneSecretHouseObject ; objects
