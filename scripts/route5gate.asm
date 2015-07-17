Route5GateScript: ; 1df33 (7:5f33)
	call EnableAutoTextBoxDrawing
	ld a, [W_ROUTE5GATECURSCRIPT]
	ld hl, Route5GateScriptPointers
	jp CallFunctionInTable

Route5GateScriptPointers: ; 1df3f (7:5f3f)
	dw Route5GateScript0
	dw Route5GateScript1

Route5GateScript_1df43: ; 1df43 (7:5f43)
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	jp StartSimulatingJoypadStates

Route5GateScript0: ; 1df50 (7:5f50)
	ld a, [wd728]
	bit 6, a
	ret nz
	ld hl, CoordsData_1df8f
	call ArePlayerCoordsInArray
	ret nc
	ld a, $2
	ld [wd528], a
	xor a
	ld [hJoyHeld], a
	callba RemoveGuardDrink
	ld a, [$ffdb]
	and a
	jr nz, .asm_1df82
	ld a, $2
	ld [$ff8c], a
	call DisplayTextID
	call Route5GateScript_1df43
	ld a, $1
	ld [W_ROUTE5GATECURSCRIPT], a
	ret
.asm_1df82
	ld a, $3
	ld [$ff8c], a
	call DisplayTextID
	ld hl, wd728
	set 6, [hl]
	ret

CoordsData_1df8f: ; 1df8f (7:5f8f)
	db 3,3
	db 3,4
	db $ff

Route5GateScript1: ; 1df94 (7:5f94)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [W_ROUTE5GATECURSCRIPT], a
	ret

Route5GateTextPointers: ; 1dfa4 (7:5fa4)
	dw Route5GateText1
	dw Route5GateText2
	dw Route5GateText3

Route8GateText1: ; 1dfaa (7:5faa)
Route7GateText1: ; 1dfaa (7:5faa)
Route6GateText1: ; 1dfaa (7:5faa)
Route5GateText1: ; 1dfaa (7:5faa)
	TX_ASM
	ld a, [wd728]
	bit 6, a
	jr nz, .asm_88856
	callba RemoveGuardDrink
	ld a, [$ffdb]
	and a
	jr nz, .asm_768a2
	ld hl, Route5GateText2
	call PrintText
	call Route5GateScript_1df43
	ld a, $1
	ld [W_ROUTE5GATECURSCRIPT], a
	jp TextScriptEnd
.asm_768a2
	ld hl, Route5GateText3
	call PrintText
	ld hl, wd728
	set 6, [hl]
	jp TextScriptEnd
.asm_88856
	ld hl, SaffronGateText_1dff6
	call PrintText
	jp TextScriptEnd

Route8GateText2: ; 1dfe7 (7:5fe7)
Route7GateText2: ; 1dfe7 (7:5fe7)
Route6GateText2: ; 1dfe7 (7:5fe7)
Route5GateText2: ; 1dfe7 (7:5fe7)
	TX_FAR _SaffronGateText_1dfe7
	db "@"

Route8GateText3: ; 1dfec (7:5fec)
Route7GateText3: ; 1dfec (7:5fec)
Route6GateText3: ; 1dfec (7:5fec)
Route5GateText3: ; 1dfec (7:5fec)
	TX_FAR _SaffronGateText_8aaa9
	db $11
	TX_FAR _SaffronGateText_1dff1
	db "@"

SaffronGateText_1dff6: ; 1dff6 (7:5ff6)
	TX_FAR _SaffronGateText_1dff6
	db "@"


