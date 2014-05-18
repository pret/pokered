CeladonMart5Script: ; 49069 (12:5069)
	jp EnableAutoTextBoxDrawing

CeladonMart5TextPointers: ; 4906c (12:506c)
	dw CeladonMart5Text1
	dw CeladonMart5Text2
	dw CeladonMart5Text3
	dw CeladonMart5Text4
	dw CeladonMart5Text5

CeladonMart5Text1: ; 49076 (12:5076)
	TX_FAR _CeladonMart5Text1
	db "@"

CeladonMart5Text2: ; 4907b (12:507b)
	TX_FAR _CeladonMart5Text2
	db "@"

CeladonMart5Text5: ; 49080 (12:5080)
	TX_FAR _CeladonMart5Text5
	db "@"
