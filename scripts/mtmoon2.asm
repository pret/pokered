MtMoon2Script: ; 51a42 (14:5a42)
	call EnableAutoTextBoxDrawing
	ret

MtMoon2TextPointers: ; 51a46 (14:5a46)
	dw MtMoonText1

MtMoonText1: ; 51a48 (14:5a48)
	TX_FAR _MtMoonText1
	db "@"
