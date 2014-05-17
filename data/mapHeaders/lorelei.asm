Lorelei_h: ; 0x7616f to 0x7617b (12 bytes) (id=245)
	db GYM ; tileset
	db LORELEIS_ROOM_HEIGHT, LORELEIS_ROOM_WIDTH ; dimensions (y, x)
	dw LoreleiBlocks, LoreleiTextPointers, LoreleiScript ; blocks, texts, scripts
	db $00 ; connections
	dw LoreleiObject ; objects
