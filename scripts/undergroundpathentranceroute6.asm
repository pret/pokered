UndergroundPathEntranceRoute6Script:
	ld a, ROUTE_6
	ld [wLastMap], a
	jp EnableAutoTextBoxDrawing

UndergroundPathEntranceRoute6TextPointers:
	dw UndergroundPathEntranceRoute6Text1

UndergroundPathEntranceRoute6Text1:
	TX_FAR _UndergrdTunnelEntRoute6Text1
	db "@"
