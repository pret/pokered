Route7Script: ; 48152 (12:4152)
	jp EnableAutoTextBoxDrawing

Route7TextPointers: ; 48155 (12:4155)
	dw Route7Text1

Route7Text1: ; 48157 (12:4157)
	TX_FAR _Route7Text1
	db "@"
