VermilionTradeHouse_h:
	db HOUSE ; tileset
	db VERMILION_TRADE_HOUSE_HEIGHT, VERMILION_TRADE_HOUSE_WIDTH ; dimensions (y, x)
	dw VermilionTradeHouse_Blocks ; blocks
	dw VermilionTradeHouse_TextPointers ; texts
	dw VermilionTradeHouse_Script ; scripts
	db 0 ; connections
	dw VermilionTradeHouse_Object ; objects
