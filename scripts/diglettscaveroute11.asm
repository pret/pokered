DiglettsCaveEntranceRoute11Script: ; 1e5ba (7:65ba)
	call EnableAutoTextBoxDrawing
	ld a, ROUTE_11
	ld [wLastMap], a
	ret

DiglettsCaveEntranceRoute11TextPointers: ; 1e5c3 (7:65c3)
	dw DiglettsCaveEntranceRoute11Text1

DiglettsCaveEntranceRoute11Text1: ; 1e5c5 (7:65c5)
	TX_FAR _DiglettsCaveEntRoute11Text1
	db "@"
