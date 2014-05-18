CeladonHotelScript: ; 49269 (12:5269)
	jp EnableAutoTextBoxDrawing

CeladonHotelTextPointers: ; 4926c (12:526c)
	dw CeladonHotelText1
	dw CeladonHotelText2
	dw CeladonHotelText3

CeladonHotelText1: ; 49272 (12:5272)
	TX_FAR _CeladonHotelText1
	db "@"

CeladonHotelText2: ; 49277 (12:5277)
	TX_FAR _CeladonHotelText2
	db "@"

CeladonHotelText3: ; 4927c (12:527c)
	TX_FAR _CeladonHotelText3
	db "@"
