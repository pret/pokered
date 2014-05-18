CeladonMart2Script: ; 560f5 (15:60f5)
	jp EnableAutoTextBoxDrawing

CeladonMart2TextPointers: ; 560f8 (15:60f8)
	dw CeladonMart2Text1
	dw CeladonMart2Text2
	dw CeladonMart2Text3
	dw CeladonMart2Text4
	dw CeladonMart2Text5

CeladonMart2Text3: ; 56102 (15:6102)
	TX_FAR _CeladonMart2Text3
	db "@"

CeladonMart2Text4: ; 56107 (15:6107)
	TX_FAR _CeladonMart2Text4
	db "@"

CeladonMart2Text5: ; 5610c (15:610c)
	TX_FAR _CeladonMart2Text5
	db "@"
