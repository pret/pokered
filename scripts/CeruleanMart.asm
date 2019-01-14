CeruleanMart_Script:
	jp EnableAutoTextBoxDrawing

CeruleanMart_TextPointers:
	dw CeruleanCashierText
	dw CeruleanMartText2
	dw CeruleanMartText3

CeruleanMartText2:
	TX_FAR _CeruleanMartText2
	db "@"

CeruleanMartText3:
	TX_FAR _CeruleanMartText3
	db "@"
