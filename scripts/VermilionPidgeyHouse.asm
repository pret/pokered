VermilionPidgeyHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

VermilionPidgeyHouse_TextPointers:
	dw VermilionHouse1Text1
	dw VermilionHouse1Text2
	dw VermilionHouse1Text3

VermilionHouse1Text1:
	text_far _VermilionHouse1Text1
	text_end

VermilionHouse1Text2:
	text_far _VermilionHouse1Text2
	text_asm
	ld a, PIDGEY
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

VermilionHouse1Text3:
	text_far _VermilionHouse1Text3
	text_end
