CeruleanHouse2_h:
	db SHIP ; tileset
	db CERULEAN_HOUSE_2_HEIGHT, CERULEAN_HOUSE_2_WIDTH ; dimensions (y, x)
	dw CeruleanHouse2Blocks, CeruleanHouse2TextPointers, CeruleanHouse2Script ; blocks, texts, scripts
	db 0 ; connections
	dw CeruleanHouse2Object ; objects
