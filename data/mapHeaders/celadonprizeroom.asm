CeladonPrizeRoom_h: ; 0x490e4 to 0x490f0 (12 bytes) (bank=12) (id=137)
	db LOBBY ; tileset
	db CELADON_PRIZE_ROOM_HEIGHT, CELADON_PRIZE_ROOM_WIDTH ; dimensions (y, x)
	dw CeladonPrizeRoomBlocks, CeladonPrizeRoomTextPointers, CeladonPrizeRoomScript ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonPrizeRoomObject ; objects
