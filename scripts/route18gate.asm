Route18GateScript: ; 49876 (12:5876)
	ld hl, wd732
	res 5, [hl]
	call EnableAutoTextBoxDrawing
	ld a, [W_ROUTE18GATECURSCRIPT]
	ld hl, Route18GateScriptPointers
	jp CallFunctionInTable

Route18GateScriptPointers: ; 49887 (12:5887)
	dw Route18GateScript0
	dw Route18GateScript1
	dw Route18GateScript2
	dw Route18GateScript3

Route18GateScript0: ; 4988f (12:588f)
	call Route16GateScript_49755
	ret nz
	ld hl, CoordsData_498cc
	call ArePlayerCoordsInArray
	ret nc
	ld a, $2
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [hJoyHeld], a
	ld a, [wCoordIndex]
	cp $1
	jr z, .asm_498c6
	ld a, [wCoordIndex]
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	ld b, 0
	ld c, a
	ld a, D_UP
	ld hl, wSimulatedJoypadStatesEnd
	call FillMemory
	call StartSimulatingJoypadStates
	ld a, $1
	ld [W_ROUTE18GATECURSCRIPT], a
	ret
.asm_498c6
	ld a, $2
	ld [W_ROUTE18GATECURSCRIPT], a
	ret

CoordsData_498cc: ; 498cc (12:58cc)
	db $03,$04
	db $04,$04
	db $05,$04
	db $06,$04
	db $FF

Route18GateScript1: ; 498d5 (12:58d5)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, $f0
	ld [wJoyIgnore], a

Route18GateScript2: ; 498df (12:58df)
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_RIGHT
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	ld a, $3
	ld [W_ROUTE18GATECURSCRIPT], a
	ret

Route18GateScript3: ; 498f9 (12:58f9)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld hl, wd730
	res 7, [hl]
	ld a, $0
	ld [W_ROUTE18GATECURSCRIPT], a
	ret

Route18GateTextPointers: ; 4990d (12:590d)
	dw Route18GateText1
	dw Route18GateText2

Route18GateText1: ; 49911 (12:5911)
	TX_ASM
	call Route16GateScript_49755
	jr z, .asm_3c84d
	ld hl, Route18GateText_4992d
	call PrintText
	jr .asm_a8410
.asm_3c84d
	ld hl, Route18GateText_49928
	call PrintText
.asm_a8410
	jp TextScriptEnd

Route18GateText_49928: ; 49928 (12:5928)
	TX_FAR _Route18GateText_49928
	db "@"

Route18GateText_4992d: ; 4992d (12:592d)
	TX_FAR _Route18GateText_4992d
	db "@"

Route18GateText2: ; 49932 (12:5932)
	TX_FAR _Route18GateText_49932
	db "@"
