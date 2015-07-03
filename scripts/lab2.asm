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
	TX_ASM
	ld a, $7
	ld [wWhichTrade], a
	jr Lab2DoTrade

Lab2Text3: ; 75c37 (1d:5c37)
	TX_ASM
	ld a, $8
	ld [wWhichTrade], a
Lab2DoTrade: ; 75c3d (1d:5c3d)
	predef DoInGameTradeDialogue
	jp TextScriptEnd
