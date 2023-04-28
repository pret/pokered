CitrineMart_Script:
	jp EnableAutoTextBoxDrawing

CitrineMart_TextPointers:
	dw CitrineCashierText
	dw CitrineMartText2
	dw CitrineMartText3
	dw CitrineMartText4

CitrineMartText2:
	text_far _CitrineMartText2
	text_end

CitrineMartText3:
	text_far _CitrineMartText3
	text_asm
	ld a, PERSIAN
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

CitrineMartText4:
	text_far _CitrineMartText4
	text_asm
	ld a, CLEFAIRY
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

; I do want to make a "steroid" item that fixes DVs.
CitrineCashierText::
	script_mart ULTRA_BALL, FULL_RESTORE, MAX_REPEL, MAX_REVIVE, ESCAPE_ROPE, HP_UP, PROTEIN, IRON, CARBOS, CALCIUM