CeladonChiefHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

CeladonChiefHouse_TextPointers:
	dw CeladonHouseText1
	dw CeladonHouseText2
	dw CeladonHouseText3

CeladonHouseText1:
	TX_FAR _CeladonHouseText1
	db "@"

CeladonHouseText2:
	TX_FAR _CeladonHouseText2
	db "@"

CeladonHouseText3:
	TX_FAR _CeladonHouseText3
	db "@"
