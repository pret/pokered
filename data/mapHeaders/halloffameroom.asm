HallofFameRoom_h: ; 0x5a492 to 0x5a49e (12 bytes) (id=118)
	db GYM ; tileset
	db HALL_OF_FAME_HEIGHT, HALL_OF_FAME_WIDTH ; dimensions (y, x)
	dw HallofFameRoomBlocks, HallofFameRoomTextPointers, HallofFameRoomScript ; blocks, texts, scripts
	db $00 ; connections
	dw HallofFameRoomObject ; objects
