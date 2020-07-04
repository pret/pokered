DiglettsCaveRoute11_Script:
	call EnableAutoTextBoxDrawing
	ld a, ROUTE_11
	ld [wLastMap], a
	ret

DiglettsCaveRoute11_TextPointers:
	dw DiglettsCaveEntranceRoute11Text1

DiglettsCaveEntranceRoute11Text1:
	text_far _DiglettsCaveEntRoute11Text1
	text_end
