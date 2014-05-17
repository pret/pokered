BikeShop_h: ; 0x1d730 to 0x1d73c (12 bytes) (bank=7) (id=66)
	db CLUB ; tileset
	db BIKE_SHOP_HEIGHT, BIKE_SHOP_WIDTH ; dimensions (y, x)
	dw BikeShopBlocks, BikeShopTextPointers, BikeShopScript ; blocks, texts, scripts
	db $00 ; connections
	dw BikeShopObject ; objects
