Lab2Script: ; 75c21 (1d:5c21)
	jp EnableAutoTextBoxDrawing

Lab2TextPointers: ; 75c24 (1d:5c24)
	dw Lab2Text1
	dw Lab2Text2
	dw Lab2Text3

Lab2Text1: ; 75c2a (1d:5c2a)
	TX_FAR _Lab2Text1
	db "@"

Lab2Text2: ; 75c2f (1d:5c2f)
	db $8
	ld a, $7
	ld [wWhichTrade], a
	jr asm_78552 ; 0x75c35 $6

Lab2Text3: ; 75c37 (1d:5c37)
	db $8
	ld a, $8
	ld [wWhichTrade], a
asm_78552: ; 75c3d (1d:5c3d)
	predef Predef54
	jp TextScriptEnd
