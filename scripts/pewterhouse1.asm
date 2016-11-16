PewterHouse1Script:
	jp EnableAutoTextBoxDrawing

PewterHouse1TextPointers:
	dw PewterHouse1Text1
	dw PewterHouse1Text2
	dw PewterHouse1Text3

PewterHouse1Text1:
	TX_FAR _PewterHouse1Text1
	TX_ASM
	ld a, (NIDORAN_M & $FF)
	ld c, a
	ld a, (NIDORAN_M >> 8)
	ld b, a
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

PewterHouse1Text2:
	TX_FAR _PewterHouse1Text2
	db "@"

PewterHouse1Text3:
	TX_FAR _PewterHouse1Text3
	db "@"
