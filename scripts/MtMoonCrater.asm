MtMoonCrater_Script:
	jp EnableAutoTextBoxDrawing
	;ld a, [wMtMoonCraterCurScript]
	;call ExecuteCurMapScriptInTable
	;ld [wMtMoonCraterCurScript], a
	;ret

MtMoonCrater_TextPointers:
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText

	text_end ; unused
