FuchsiaMeetingRoom_Script:
	call EnableAutoTextBoxDrawing
	ret

FuchsiaMeetingRoom_TextPointers:
	dw FuchsiaMeetingRoomText1
	dw FuchsiaMeetingRoomText2
	dw FuchsiaMeetingRoomText3

FuchsiaMeetingRoomText1:
	TX_FAR _FuchsiaMeetingRoomText1
	db "@"

FuchsiaMeetingRoomText2:
	TX_FAR _FuchsiaMeetingRoomText2
	db "@"

FuchsiaMeetingRoomText3:
	TX_FAR _FuchsiaMeetingRoomText3
	db "@"
