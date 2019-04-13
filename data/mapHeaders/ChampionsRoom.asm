ChampionsRoom_h:
	db GYM ; tileset
	db CHAMPIONS_ROOM_HEIGHT, CHAMPIONS_ROOM_WIDTH ; dimensions (y, x)
	dw ChampionsRoom_Blocks ; blocks
	dw ChampionsRoom_TextPointers ; texts
	dw ChampionsRoom_Script ; scripts
	db $0 ; connections
	dw ChampionsRoom_Object ; objects
