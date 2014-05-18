CinnabarMartScript: ; 75e7e (1d:5e7e)
	jp EnableAutoTextBoxDrawing

CinnabarMartTextPointers: ; 75e81 (1d:5e81)
	dw CinnabarMartText1
	dw CinnabarMartText2
	dw CinnabarMartText3

CinnabarMartText2: ; 75e87 (1d:5e87)
	TX_FAR _CinnabarMartText2
	db "@"

CinnabarMartText3: ; 75e8c (1d:5e8c)
	TX_FAR _CinnabarMartText3
	db "@"
