Route16GateUpstairsScript: ; 4980b (12:580b)
	jp DisableAutoTextBoxDrawing

Route16GateUpstairsTextPointers: ; 4980e (12:580e)
	dw Route16GateUpstairsText1
	dw Route16GateUpstairsText2
	dw Route16GateUpstairsText3
	dw Route16GateUpstairsText4

Route16GateUpstairsText1: ; 49816 (12:5816)
	db $08 ; asm
	ld hl, UnnamedText_49820
	call PrintText
	jp TextScriptEnd

UnnamedText_49820: ; 49820 (12:5820)
	TX_FAR _UnnamedText_49820
	db "@"

Route16GateUpstairsText2: ; 49825 (12:5825)
	db $08 ; asm
	ld hl, UnnamedText_4982f
	call PrintText
	jp TextScriptEnd

UnnamedText_4982f: ; 4982f (12:582f)
	TX_FAR _UnnamedText_4982f
	db "@"

Route16GateUpstairsText3: ; 49834 (12:5834)
	db $8
	ld hl, UnnamedText_4983b
	jp Func_55c9

UnnamedText_4983b: ; 4983b (12:583b)
	TX_FAR _UnnamedText_4983b
	db "@"

Route16GateUpstairsText4: ; 49840 (12:5840)
	db $8
	ld hl, UnnamedText_49847 ; $5847
	jp Func_55c9

UnnamedText_49847: ; 49847 (12:5847)
	TX_FAR _UnnamedText_49847
	db "@"
	

