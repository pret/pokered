CeladonHouseScript: ; 4920e (12:520e)
	call EnableAutoTextBoxDrawing
	ret

CeladonHouseTextPointers: ; 49212 (12:5212)
	dw CeladonHouseText1
	dw CeladonHouseText2
	dw CeladonHouseText3

CeladonHouseText1: ; 49218 (12:5218)
	TX_FAR _CeladonHouseText1
	db "@"

CeladonHouseText2: ; 4921d (12:521d)
	TX_FAR _CeladonHouseText2
	db "@"

CeladonHouseText3: ; 49222 (12:5222)
	TX_FAR _CeladonHouseText3
	db "@"
