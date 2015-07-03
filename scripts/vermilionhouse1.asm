VermilionHouse1Script: ; 1dafc (7:5afc)
	call EnableAutoTextBoxDrawing
	ret

VermilionHouse1TextPointers: ; 1db00 (7:5b00)
	dw VermilionHouse1Text1
	dw VermilionHouse1Text2
	dw VermilionHouse1Text3

VermilionHouse1Text1: ; 1db06 (7:5b06)
	TX_FAR _VermilionHouse1Text1
	db "@"

VermilionHouse1Text2: ; 1db0b (7:5b0b)
	TX_FAR _VermilionHouse1Text2
	TX_ASM
	ld a, PIDGEY
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

VermilionHouse1Text3: ; 1db1b (7:5b1b)
	TX_FAR _VermilionHouse1Text3
	db "@"
