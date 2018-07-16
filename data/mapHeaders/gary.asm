Gary_h:
	db GYM ; tileset
	db CHAMPIONS_ROOM_HEIGHT, CHAMPIONS_ROOM_WIDTH ; dimensions (y, x)
	dw GaryBlocks, GaryTextPointers, GaryScript ; blocks, texts, scripts
	db $0 ; connections
	dw GaryObject ; objects
