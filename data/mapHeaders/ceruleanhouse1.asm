CeruleanHouse1_h:
	db HOUSE ; tileset
	db CERULEAN_HOUSE_1_HEIGHT, CERULEAN_HOUSE_1_WIDTH ; dimensions (y, x)
	dw CeruleanHouse1Blocks, CeruleanHouse1TextPointers, CeruleanHouse1Script ; blocks, texts, scripts
	db $00 ; connections
	dw CeruleanHouse1Object ; objects
