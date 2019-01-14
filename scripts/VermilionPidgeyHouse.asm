VermilionPidgeyHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

VermilionPidgeyHouse_TextPointers:
	dw VermilionHouse1Text1
	dw VermilionHouse1Text2
	dw VermilionHouse1Text3

VermilionHouse1Text1:
	TX_FAR _VermilionHouse1Text1
	db "@"

VermilionHouse1Text2:
	TX_FAR _VermilionHouse1Text2
	TX_ASM
	ld a, PIDGEY
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

VermilionHouse1Text3:
	TX_FAR _VermilionHouse1Text3
	db "@"
