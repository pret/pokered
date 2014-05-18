CeruleanMartScript: ; 5c895 (17:4895)
	jp EnableAutoTextBoxDrawing

CeruleanMartTextPointers: ; 5c898 (17:4898)
	dw CeruleanMartText1
	dw CeruleanMartText2
	dw CeruleanMartText3

CeruleanMartText2: ; 5c89e (17:489e)
	TX_FAR _CeruleanMartText2
	db "@"

CeruleanMartText3: ; 5c8a3 (17:48a3)
	TX_FAR _CeruleanMartText3
	db "@"
