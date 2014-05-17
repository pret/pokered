Gary_h: ; 75f11 (1d:5f11)
	db GYM ;tileset
	db CHAMPIONS_ROOM_HEIGHT, CHAMPIONS_ROOM_WIDTH ; Height, Width
	dw GaryBlocks, GaryTextPointers, GaryScript
	db $0 ;No Connections
	dw GaryObject
