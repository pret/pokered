CeladonMart1Script: ; 60f86 (18:4f86)
	jp EnableAutoTextBoxDrawing

CeladonMart1TextPointers: ; 60f89 (18:4f89)
	dw CeladonMart1Text1
	dw CeladonMart1Text2
	dw CeladonMart1Text3

CeladonMart1Text1: ; 60f8f (18:4f8f)
	TX_FAR _CeladonMart1Text1
	db "@"

CeladonMart1Text2: ; 60f94 (18:4f94)
	TX_FAR _CeladonMart1Text2
	db "@"

CeladonMart1Text3: ; 60f99 (18:4f99)
	TX_FAR _CeladonMart1Text3
	db "@"
