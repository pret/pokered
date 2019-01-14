CeruleanTradeHouse_h:
	db HOUSE ; tileset
	db CERULEAN_TRADE_HOUSE_HEIGHT, CERULEAN_TRADE_HOUSE_WIDTH ; dimensions (y, x)
	dw CeruleanTradeHouse_Blocks ; blocks
	dw CeruleanTradeHouse_TextPointers ; texts
	dw CeruleanTradeHouse_Script ; scripts
	db 0 ; connections
	dw CeruleanTradeHouse_Object ; objects
