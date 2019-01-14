CinnabarLabTradeRoom_h:
	db LAB ; tileset
	db CINNABAR_LAB_TRADE_ROOM_HEIGHT, CINNABAR_LAB_TRADE_ROOM_WIDTH ; dimensions (y, x)
	dw CinnabarLabTradeRoom_Blocks ; blocks
	dw CinnabarLabTradeRoom_TextPointers ; texts
	dw CinnabarLabTradeRoom_Script ; scripts
	db 0 ; connections
	dw CinnabarLabTradeRoom_Object ; objects
