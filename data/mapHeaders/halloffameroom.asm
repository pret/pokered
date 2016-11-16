HallofFameRoom_h:
	db GYM ; tileset
	db HALL_OF_FAME_HEIGHT, HALL_OF_FAME_WIDTH ; dimensions (y, x)
	dw HallofFameRoomBlocks, HallofFameRoomTextPointers, HallofFameRoomScript ; blocks, texts, scripts
	db $00 ; connections
	dw HallofFameRoomObject ; objects
