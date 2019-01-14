DiglettsCaveRoute2_Script:
	ld a, ROUTE_2
	ld [wLastMap], a
	jp EnableAutoTextBoxDrawing

DiglettsCaveRoute2_TextPointers:
	dw DiglettsCaveRoute2Text1

DiglettsCaveRoute2Text1:
	TX_FAR _DiglettsCaveRoute2Text1
	db "@"
