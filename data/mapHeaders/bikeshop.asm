BikeShop_h:
	db CLUB ; tileset
	db BIKE_SHOP_HEIGHT, BIKE_SHOP_WIDTH ; dimensions (y, x)
	dw BikeShopBlocks, BikeShopTextPointers, BikeShopScript ; blocks, texts, scripts
	db $00 ; connections
	dw BikeShopObject ; objects
