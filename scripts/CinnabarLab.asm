CinnabarLab_Script:
	call EnableAutoTextBoxDrawing
	ret

CinnabarLab_TextPointers:
	dw Lab1Text1
	dw Lab1Text2
	dw Lab1Text3
	dw Lab1Text4
	dw Lab1Text5

Lab1Text1:
	TX_FAR _Lab1Text1
	db "@"

Lab1Text2:
	TX_FAR _Lab1Text2
	db "@"

Lab1Text3:
	TX_FAR _Lab1Text3
	db "@"

Lab1Text4:
	TX_FAR _Lab1Text4
	db "@"

Lab1Text5:
	TX_FAR _Lab1Text5
	db "@"
