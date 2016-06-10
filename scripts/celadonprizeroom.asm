CeladonPrizeRoomScript: ; 490f0 (12:50f0)
	jp EnableAutoTextBoxDrawing

CeladonPrizeRoomTextPointers: ; 490f3 (12:50f3)
	dw CeladonPrizeRoomText1
	dw CeladonPrizeRoomText2
	dw CeladonPrizeRoomText3
	dw CeladonPrizeRoomText3
	dw CeladonPrizeRoomText3

CeladonPrizeRoomText1: ; 490fd (12:50fd)
	TX_FAR _CeladonPrizeRoomText1
	db "@"

CeladonPrizeRoomText2: ; 49102 (12:5102)
	TX_FAR _CeladonPrizeRoomText2
	db "@"

CeladonPrizeRoomText3: ; 49107 (12:5107)
	TX_PRIZE_VENDOR
