FuchsiaMeetingRoom_h: ; 0x756d7 to 0x756e3 (12 bytes) (id=158)
	db LAB ; tileset
	db FUCHSIA_MEETING_ROOM_HEIGHT, FUCHSIA_MEETING_ROOM_WIDTH ; dimensions (y, x)
	dw FuchsiaMeetingRoomBlocks, FuchsiaMeetingRoomTextPointers, FuchsiaMeetingRoomScript ; blocks, texts, scripts
	db $00 ; connections
	dw FuchsiaMeetingRoomObject ; objects
