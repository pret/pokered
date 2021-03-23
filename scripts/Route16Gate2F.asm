Route16Gate2F_Script:
	jp DisableAutoTextBoxDrawing

Route16Gate2F_TextPointers:
	dw Route16GateUpstairsText1
	dw Route16GateUpstairsText2
	dw Route16GateUpstairsText3
	dw Route16GateUpstairsText4

Route16GateUpstairsText1:
	text_asm
	ld hl, Route16GateUpstairsText_49820
	call PrintText
	jp TextScriptEnd

Route16GateUpstairsText_49820:
	text_far _Route16GateUpstairsText_49820
	text_end

Route16GateUpstairsText2:
	text_asm
	ld hl, Route16GateUpstairsText_4982f
	call PrintText
	jp TextScriptEnd

Route16GateUpstairsText_4982f:
	text_far _Route16GateUpstairsText_4982f
	text_end

Route16GateUpstairsText3:
	text_asm
	ld hl, Route16GateUpstairsText_4983b
	jp GateUpstairsScript_PrintIfFacingUp

Route16GateUpstairsText_4983b:
	text_far _Route16GateUpstairsText_4983b
	text_end

Route16GateUpstairsText4:
	text_asm
	ld hl, Route16GateUpstairsText_49847
	jp GateUpstairsScript_PrintIfFacingUp

Route16GateUpstairsText_49847:
	text_far _Route16GateUpstairsText_49847
	text_end
