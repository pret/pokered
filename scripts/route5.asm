Route5Script: ; 556b2 (15:56b2)
	jp EnableAutoTextBoxDrawing

Route5TextPointers: ; 556b5 (15:56b5)
	dw Route5Text1

Route5Text1: ; 556b7 (15:56b7)
	TX_FAR _Route5Text1
	db "@"
