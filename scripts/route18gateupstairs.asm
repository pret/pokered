Route18GateUpstairsScript: ; 49975 (12:5975)
	jp DisableAutoTextBoxDrawing

Route18GateUpstairsTextPointers: ; 49978 (12:5978)
	dw Route18GateUpstairsText1
	dw Route18GateUpstairsText2
	dw Route18GateUpstairsText3

Route18GateUpstairsText1: ; 4997e (12:597e)
	db $08 ; asm
	ld a, $5
	ld [wWhichTrade], a
	predef Predef54
	jp TextScriptEnd

Route18GateUpstairsText2: ; 4998c (12:598c)
	db $8
	ld hl, Route18GateUpstairsText_49993 ; $5993
	jp Route12GateUpstairsScript_495c9

Route18GateUpstairsText_49993: ; 49993 (12:5993)
	TX_FAR _Route18GateUpstairsText_49993
	db "@"

Route18GateUpstairsText3: ; 49998 (12:5998)
	db $8
	ld hl, Route18GateUpstairsText_4999f ; $599f
	jp Route12GateUpstairsScript_495c9

Route18GateUpstairsText_4999f: ; 4999f (12:599f)
	TX_FAR _Route18GateUpstairsText_4999f
	db "@"
