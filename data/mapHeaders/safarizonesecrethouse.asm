SafariZoneSecretHouse_h:
	db LAB ; tileset
	db SAFARI_ZONE_SECRET_HOUSE_HEIGHT, SAFARI_ZONE_SECRET_HOUSE_WIDTH ; dimensions (y, x)
	dw SafariZoneSecretHouseBlocks, SafariZoneSecretHouseTextPointers, SafariZoneSecretHouseScript ; blocks, texts, scripts
	db $00 ; connections
	dw SafariZoneSecretHouseObject ; objects
