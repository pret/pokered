PewterHouse1Script: ; 1d5f3 (7:55f3)
	jp EnableAutoTextBoxDrawing

PewterHouse1TextPointers: ; 1d5f6 (7:55f6)
	dw PewterHouse1Text1
	dw PewterHouse1Text2
	dw PewterHouse1Text3

PewterHouse1Text1: ; 1d5fc (7:55fc)
	TX_FAR _PewterHouse1Text1
	TX_ASM
	ld a, NIDORAN_M
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

PewterHouse1Text2: ; 1d60c (7:560c)
	TX_FAR _PewterHouse1Text2
	db "@"

PewterHouse1Text3: ; 1d611 (7:5611)
	TX_FAR _PewterHouse1Text3
	db "@"
