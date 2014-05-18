SchoolScript: ; 1d54c (7:554c)
	jp EnableAutoTextBoxDrawing

SchoolTextPointers: ; 1d54f (7:554f)
	dw SchoolText1
	dw SchoolText2

SchoolText1: ; 1d553 (7:5553)
	TX_FAR _SchoolText1
	db "@"

SchoolText2: ; 1d558 (7:5558)
	TX_FAR _SchoolText2
	db "@"
