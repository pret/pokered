GameCornerPrizeRoom_h:
	db LOBBY ; tileset
	db GAME_CORNER_PRIZE_ROOM_HEIGHT, GAME_CORNER_PRIZE_ROOM_WIDTH ; dimensions (y, x)
	dw GameCornerPrizeRoom_Blocks ; blocks
	dw GameCornerPrizeRoom_TextPointers ; texts
	dw GameCornerPrizeRoom_Script ; scripts
	db 0 ; connections
	dw GameCornerPrizeRoom_Object ; objects
