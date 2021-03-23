GameCornerPrizeRoom_Script:
	jp EnableAutoTextBoxDrawing

GameCornerPrizeRoom_TextPointers:
	dw CeladonPrizeRoomText1
	dw CeladonPrizeRoomText2
	dw CeladonPrizeRoomText3
	dw CeladonPrizeRoomText3
	dw CeladonPrizeRoomText3

CeladonPrizeRoomText1:
	text_far _CeladonPrizeRoomText1
	text_end

CeladonPrizeRoomText2:
	text_far _CeladonPrizeRoomText2
	text_end

CeladonPrizeRoomText3:
	script_prize_vendor
