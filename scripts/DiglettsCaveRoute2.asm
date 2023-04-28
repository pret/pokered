DiglettsCaveRoute2_Script:
	ld a, ROUTE_2
	ld [wLastMap], a
	jp EnableAutoTextBoxDrawing

DiglettsCaveRoute2_TextPointers:
	dw DiglettsCaveRoute2Text1
	dw DiglettsCaveRoute2Diglett

DiglettsCaveRoute2Text1:
	text_far _DiglettsCaveRoute2Text1
	text_end

DiglettsCaveRoute2Diglett:
	text_far _DiglettsCaveRoute2Diglett
	text_asm
	ld a, DIGLETT
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd
