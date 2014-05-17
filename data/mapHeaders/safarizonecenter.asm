SafariZoneCenter_h: ; 0x45ba6 to 0x45bb2 (12 bytes) (bank=11) (id=220)
	db FOREST ; tileset
	db SAFARI_ZONE_CENTER_HEIGHT, SAFARI_ZONE_CENTER_WIDTH ; dimensions (y, x)
	dw SafariZoneCenterBlocks, SafariZoneCenterTextPointers, SafariZoneCenterScript ; blocks, texts, scripts
	db $00 ; connections
	dw SafariZoneCenterObject ; objects
