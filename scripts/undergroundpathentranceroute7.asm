UndergroundPathEntranceRoute7Script:
	ld a, ROUTE_7
	ld [wLastMap], a
	jp EnableAutoTextBoxDrawing

UndergroundPathEntranceRoute7TextPointers:
	dw UndergroundPathEntranceRoute7Text1

UndergroundPathEntranceRoute7Text1:
	TX_FAR _UndergroundPathEntRoute7Text1
	db "@"
