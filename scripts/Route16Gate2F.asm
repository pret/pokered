Route16Gate2F_Script:
	jp DisableAutoTextBoxDrawing

Route16Gate2F_TextPointers:
	dw Route16GateUpstairsText1
	dw Route16GateUpstairsText2
	dw Route16GateUpstairsText3
	dw Route16GateUpstairsText4

Route16GateUpstairsText1:
	TX_ASM
	ld hl, Route16GateUpstairsText_49820
	call PrintText
	jp TextScriptEnd

Route16GateUpstairsText_49820:
	TX_FAR _Route16GateUpstairsText_49820
	db "@"

Route16GateUpstairsText2:
	TX_ASM
	ld hl, Route16GateUpstairsText_4982f
	call PrintText
	jp TextScriptEnd

Route16GateUpstairsText_4982f:
	TX_FAR _Route16GateUpstairsText_4982f
	db "@"

Route16GateUpstairsText3:
	TX_ASM
	ld hl, Route16GateUpstairsText_4983b
	jp GateUpstairsScript_PrintIfFacingUp

Route16GateUpstairsText_4983b:
	TX_FAR _Route16GateUpstairsText_4983b
	db "@"

Route16GateUpstairsText4:
	TX_ASM
	ld hl, Route16GateUpstairsText_49847
	jp GateUpstairsScript_PrintIfFacingUp

Route16GateUpstairsText_49847:
	TX_FAR _Route16GateUpstairsText_49847
	db "@"
