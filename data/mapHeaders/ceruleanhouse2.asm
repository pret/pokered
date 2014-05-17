CeruleanHouse2_h: ; 0x74dfd to 0x74e09 (12 bytes) (id=230)
	db SHIP ; tileset
	db CERULEAN_HOUSE_2_HEIGHT, CERULEAN_HOUSE_2_WIDTH ; dimensions (y, x)
	dw CeruleanHouse2Blocks, CeruleanHouse2TextPointers, CeruleanHouse2Script ; blocks, texts, scripts
	db $00 ; connections
	dw CeruleanHouse2Object ; objects
