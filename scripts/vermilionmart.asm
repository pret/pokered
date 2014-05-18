VermilionMartScript: ; 5c9e1 (17:49e1)
	jp EnableAutoTextBoxDrawing

VermilionMartTextPointers: ; 5c9e4 (17:49e4)
	dw VermilionMartText1
	dw VermilionMartText2
	dw VermilionMartText3

VermilionMartText2: ; 5c9ea (17:49ea)
	TX_FAR _VermilionMartText2
	db "@"

VermilionMartText3: ; 5c9ef (17:49ef)
	TX_FAR _VermilionMartText3
	db "@"
