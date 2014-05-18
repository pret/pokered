FuchsiaMeetingRoomScript: ; 756e3 (1d:56e3)
	call EnableAutoTextBoxDrawing
	ret

FuchsiaMeetingRoomTextPointers: ; 756e7 (1d:56e7)
	dw FuchsiaMeetingRoomText1
	dw FuchsiaMeetingRoomText2
	dw FuchsiaMeetingRoomText3

FuchsiaMeetingRoomText1: ; 756ed (1d:56ed)
	TX_FAR _FuchsiaMeetingRoomText1
	db "@"

FuchsiaMeetingRoomText2: ; 756f2 (1d:56f2)
	TX_FAR _FuchsiaMeetingRoomText2
	db "@"

FuchsiaMeetingRoomText3: ; 756f7 (1d:56f7)
	TX_FAR _FuchsiaMeetingRoomText3
	db "@"
