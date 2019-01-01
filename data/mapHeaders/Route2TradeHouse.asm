Route2TradeHouse_h:
	db HOUSE ; tileset
	db ROUTE_2_TRADE_HOUSE_HEIGHT, ROUTE_2_TRADE_HOUSE_WIDTH ; dimensions (y, x)
	dw Route2TradeHouse_Blocks ; blocks
	dw Route2TradeHouse_TextPointers ; texts
	dw Route2TradeHouse_Script ; scripts
	db 0 ; connections
	dw Route2TradeHouse_Object ; objects
