CeladonPrizeRoom_h:
	db LOBBY ; tileset
	db CELADON_PRIZE_ROOM_HEIGHT, CELADON_PRIZE_ROOM_WIDTH ; dimensions (y, x)
	dw CeladonPrizeRoomBlocks, CeladonPrizeRoomTextPointers, CeladonPrizeRoomScript ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonPrizeRoomObject ; objects
