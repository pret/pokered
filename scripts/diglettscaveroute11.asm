DiglettsCaveEntranceRoute11Script:
	call EnableAutoTextBoxDrawing
	ld a, ROUTE_11
	ld [wLastMap], a
	ret

DiglettsCaveEntranceRoute11TextPointers:
	dw DiglettsCaveEntranceRoute11Text1

DiglettsCaveEntranceRoute11Text1:
	TX_FAR _DiglettsCaveEntRoute11Text1
	db "@"
