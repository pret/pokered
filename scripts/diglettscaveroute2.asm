DiglettsCaveRoute2Script: ; 1deb0 (7:5eb0)
	ld a, $d
	ld [$d365], a
	jp EnableAutoTextBoxDrawing

DiglettsCaveRoute2TextPointers: ; 1deb8 (7:5eb8)
	dw DiglettsCaveRoute2Text1

DiglettsCaveRoute2Text1: ; 1deba (7:5eba)
	TX_FAR _DiglettsCaveRoute2Text1
	db "@"
