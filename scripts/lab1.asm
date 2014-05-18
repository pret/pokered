Lab1Script: ; 75b8c (1d:5b8c)
	call EnableAutoTextBoxDrawing
	ret

Lab1TextPointers: ; 75b90 (1d:5b90)
	dw Lab1Text1
	dw Lab1Text2
	dw Lab1Text3
	dw Lab1Text4
	dw Lab1Text5

Lab1Text1: ; 75b9a (1d:5b9a)
	TX_FAR _Lab1Text1
	db "@"

Lab1Text2: ; 75b9f (1d:5b9f)
	TX_FAR _Lab1Text2
	db "@"

Lab1Text3: ; 75ba4 (1d:5ba4)
	TX_FAR _Lab1Text3
	db "@"

Lab1Text4: ; 75ba9 (1d:5ba9)
	TX_FAR _Lab1Text4
	db "@"

Lab1Text5: ; 75bae (1d:5bae)
	TX_FAR _Lab1Text5
	db "@"
