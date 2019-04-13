TradeCenter_h:
	db CLUB ; tileset
	db TRADE_CENTER_HEIGHT, TRADE_CENTER_WIDTH ; dimensions (y, x)
	dw TradeCenter_Blocks ; blocks
	dw TradeCenter_TextPointers ; texts
	dw TradeCenter_Script ; scripts
	db 0 ; connections
	dw TradeCenter_Object ; objects
