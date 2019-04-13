BikeShop_h:
	db CLUB ; tileset
	db BIKE_SHOP_HEIGHT, BIKE_SHOP_WIDTH ; dimensions (y, x)
	dw BikeShop_Blocks ; blocks
	dw BikeShop_TextPointers ; texts
	dw BikeShop_Script ; scripts
	db 0 ; connections
	dw BikeShop_Object ; objects
