GameCornerPrizeRoom_Script:
	jp EnableAutoTextBoxDrawing

GameCornerPrizeRoom_TextPointers:
	dw CeladonPrizeRoomText1
	dw CeladonPrizeRoomText2
	dw CeladonPrizeRoomText3
	dw CeladonPrizeRoomText3
	dw CeladonPrizeRoomText3

CeladonPrizeRoomText1:
	TX_FAR _CeladonPrizeRoomText1
	db "@"

CeladonPrizeRoomText2:
	TX_FAR _CeladonPrizeRoomText2
	db "@"

CeladonPrizeRoomText3:
	TX_PRIZE_VENDOR
