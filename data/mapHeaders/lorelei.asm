Lorelei_h:
	db GYM ; tileset
	db LORELEIS_ROOM_HEIGHT, LORELEIS_ROOM_WIDTH ; dimensions (y, x)
	dw LoreleiBlocks, LoreleiTextPointers, LoreleiScript ; blocks, texts, scripts
	db 0 ; connections
	dw LoreleiObject ; objects
