UndergroundPathEntranceRoute8Script: ; 1e289 (7:6289)
	ld a, ROUTE_8
	ld [wLastMap], a
	jp EnableAutoTextBoxDrawing

UndergroundPathEntranceRoute8TextPointers: ; 1e291 (7:6291)
	dw UndergroundPathEntranceRoute8Text1

UndergroundPathEntranceRoute8Text1: ; 1e293 (7:6293)
	TX_FAR _UndergroundPathEntRoute8Text1
	db "@"
