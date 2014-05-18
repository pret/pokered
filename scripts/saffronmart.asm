SaffronMartScript: ; 5d409 (17:5409)
	jp EnableAutoTextBoxDrawing

SaffronMartTextPointers: ; 5d40c (17:540c)
	dw SaffronMartText1
	dw SaffronMartText2
	dw SaffronMartText3

SaffronMartText2: ; 5d412 (17:5412)
	TX_FAR _SaffronMartText2
	db "@"

SaffronMartText3: ; 5d417 (17:5417)
	TX_FAR _SaffronMartText3
	db "@"
