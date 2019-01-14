UndergroundPathRoute5_Script:
	ld a, ROUTE_5
	ld [wLastMap], a
	ret

UndergroundPathEntranceRoute5_5d6af:
	db "@"

UndergroundPathRoute5_TextPointers:
	dw UndergroundPathEntranceRoute5Text1

UndergroundPathEntranceRoute5Text1:
	TX_ASM
	ld a, $9
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	ld hl, UndergroundPathEntranceRoute5_5d6af
	ret
