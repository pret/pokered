CeladonChiefHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

CeladonChiefHouse_TextPointers:
	dw CeladonHouseText1
	dw CeladonHouseText2
	dw CeladonHouseText3

CeladonHouseText1:
	text_far _CeladonHouseText1
	text_end

CeladonHouseText2:
	text_far _CeladonHouseText2
	text_end

CeladonHouseText3:
	text_far _CeladonHouseText3
	text_end
