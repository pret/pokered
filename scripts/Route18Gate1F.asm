Route18Gate1F_Script:
	ld hl, wd732
	res 5, [hl]
	call EnableAutoTextBoxDrawing
	ld a, [wRoute18Gate1FCurScript]
	ld hl, Route18Gate1F_ScriptPointers
	jp CallFunctionInTable

Route18Gate1F_ScriptPointers:
	dw Route18GateScript0
	dw Route18GateScript1
	dw Route18GateScript2
	dw Route18GateScript3

Route18GateScript0:
	call Route16GateScript_49755
	ret nz
	ld hl, CoordsData_498cc
	call ArePlayerCoordsInArray
	ret nc
	ld a, $2
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ldh [hJoyHeld], a
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
	ld [wRoute18Gate1FCurScript], a
	ret
.asm_498c6
	ld a, $2
	ld [wRoute18Gate1FCurScript], a
	ret

CoordsData_498cc:
	dbmapcoord  4,  3
	dbmapcoord  4,  4
	dbmapcoord  4,  5
	dbmapcoord  4,  6
	db -1 ; end

Route18GateScript1:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, $f0
	ld [wJoyIgnore], a

Route18GateScript2:
	ld a, $1
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_RIGHT
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	ld a, $3
	ld [wRoute18Gate1FCurScript], a
	ret

Route18GateScript3:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld hl, wd730
	res 7, [hl]
	ld a, $0
	ld [wRoute18Gate1FCurScript], a
	ret

Route18Gate1F_TextPointers:
	dw Route18GateText1
	dw Route18GateText2

Route18GateText1:
	text_asm
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

Route18GateText_49928:
	text_far _Route18GateText_49928
	text_end

Route18GateText_4992d:
	text_far _Route18GateText_4992d
	text_end

Route18GateText2:
	text_far _Route18GateText_49932
	text_end
