Route16Gate1F_Script:
	ld hl, wd732
	res 5, [hl]
	call EnableAutoTextBoxDrawing
	ld a, [wRoute16Gate1FCurScript]
	ld hl, Route16Gate1F_ScriptPointers
	jp CallFunctionInTable

Route16Gate1F_ScriptPointers:
	dw Route16GateScript0
	dw Route16GateScript1
	dw Route16GateScript2
	dw Route16GateScript3

Route16GateScript0:
	call Route16GateScript_49755
	ret nz
	ld hl, CoordsData_49714
	call ArePlayerCoordsInArray
	ret nc
	ld a, $3
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [hJoyHeld], a
	ld a, [wCoordIndex]
	cp $1
	jr z, .asm_4970e
	ld a, [wCoordIndex]
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	ld b, $0
	ld c, a
	ld a, D_UP
	ld hl, wSimulatedJoypadStatesEnd
	call FillMemory
	call StartSimulatingJoypadStates
	ld a, $1
	ld [wRoute16Gate1FCurScript], a
	ret
.asm_4970e
	ld a, $2
	ld [wRoute16Gate1FCurScript], a
	ret

CoordsData_49714:
	db $07,$04
	db $08,$04
	db $09,$04
	db $0A,$04
	db $FF

Route16GateScript1:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, $f0
	ld [wJoyIgnore], a

Route16GateScript2:
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_RIGHT
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	ld a, $3
	ld [wRoute16Gate1FCurScript], a
	ret

Route16GateScript3:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld hl, wd730
	res 7, [hl]
	ld a, $0
	ld [wRoute16Gate1FCurScript], a
	ret

Route16GateScript_49755:
	ld b, BICYCLE
	jp IsItemInBag

Route16Gate1F_TextPointers:
	dw Route16GateText1
	dw Route16GateText2
	dw Route16GateText3

Route16GateText1:
	TX_ASM
	call Route16GateScript_49755
	jr z, .asm_0bdf3
	ld hl, Route16GateText_4977c
	call PrintText
	jr .asm_56c9d
.asm_0bdf3
	ld hl, Route16GateText_49777
	call PrintText
.asm_56c9d
	jp TextScriptEnd

Route16GateText_49777:
	TX_FAR _Route16GateText_49777
	db "@"

Route16GateText_4977c:
	TX_FAR _Route16GateText_4977c
	db "@"

Route16GateText3:
	TX_FAR _Route16GateText_49781
	db "@"

Route16GateText2:
	TX_FAR _Route16GateText2
	db "@"
