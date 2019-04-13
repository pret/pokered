UndergroundPathRoute7_Script:
	ld a, ROUTE_7
	ld [wLastMap], a
	jp EnableAutoTextBoxDrawing

UndergroundPathRoute7_TextPointers:
	dw UndergroundPathEntranceRoute7Text1

UndergroundPathEntranceRoute7Text1:
	TX_FAR _UndergroundPathEntRoute7Text1
	db "@"
