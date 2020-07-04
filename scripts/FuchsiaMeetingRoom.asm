FuchsiaMeetingRoom_Script:
	call EnableAutoTextBoxDrawing
	ret

FuchsiaMeetingRoom_TextPointers:
	dw FuchsiaMeetingRoomText1
	dw FuchsiaMeetingRoomText2
	dw FuchsiaMeetingRoomText3

FuchsiaMeetingRoomText1:
	text_far _FuchsiaMeetingRoomText1
	text_end

FuchsiaMeetingRoomText2:
	text_far _FuchsiaMeetingRoomText2
	text_end

FuchsiaMeetingRoomText3:
	text_far _FuchsiaMeetingRoomText3
	text_end
