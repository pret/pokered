FuchsiaMeetingRoom_h:
	db LAB ; tileset
	db FUCHSIA_MEETING_ROOM_HEIGHT, FUCHSIA_MEETING_ROOM_WIDTH ; dimensions (y, x)
	dw FuchsiaMeetingRoom_Blocks ; blocks
	dw FuchsiaMeetingRoom_TextPointers ; texts
	dw FuchsiaMeetingRoom_Script ; scripts
	db 0 ; connections
	dw FuchsiaMeetingRoom_Object ; objects
