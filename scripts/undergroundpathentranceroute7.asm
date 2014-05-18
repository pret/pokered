UndergroundPathEntranceRoute7Script: ; 5d72c (17:572c)
	ld a, $12
	ld [$d365], a
	jp EnableAutoTextBoxDrawing

UndergroundPathEntranceRoute7TextPointers: ; 5d734 (17:5734)
	dw UndergroundPathEntranceRoute7Text1

UndergroundPathEntranceRoute7Text1: ; 5d736 (17:5736)
	TX_FAR _UndergroundPathEntRoute7Text1
	db "@"
