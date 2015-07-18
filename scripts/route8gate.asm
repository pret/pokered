Route8GateScript: ; 1e1c7 (7:61c7)
	call EnableAutoTextBoxDrawing
	ld hl, Route8GateScriptPointers
	ld a, [W_ROUTE8GATECURSCRIPT]
	jp CallFunctionInTable

Route8GateScriptPointers: ; 1e1d3 (7:61d3)
	dw Route8GateScript0
	dw Route8GateScript1

Route8GateScript_1e1d7: ; 1e1d7 (7:61d7)
	ld hl, wd730
	set 7, [hl]
	ld a, $10
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	xor a
	ld [wSpriteStateData2 + $06], a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ret

Route8GateScript0: ; 1e1ee (7:61ee)
	ld a, [wd728]
	bit 6, a
	ret nz
	ld hl, CoordsData_1e22c
	call ArePlayerCoordsInArray
	ret nc
	ld a, $2
	ld [wd528], a
	xor a
	ld [hJoyHeld], a
	callba RemoveGuardDrink
	ld a, [$ffdb]
	and a
	jr nz, .asm_1e220
	ld a, $2
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	call Route8GateScript_1e1d7
	ld a, $1
	ld [W_ROUTE8GATECURSCRIPT], a
	ret
.asm_1e220
	ld hl, wd728
	set 6, [hl]
	ld a, $3
	ld [hSpriteIndexOrTextID], a
	jp DisplayTextID

CoordsData_1e22c: ; 1e22c (7:622c)
	db 3,2
	db 4,2
	db $ff

Route8GateScript1: ; 1e231 (7:6231)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [W_ROUTE8GATECURSCRIPT], a
	ret

Route8GateTextPointers: ; 1e241 (7:6241)
	dw Route8GateText1
	dw Route8GateText2
	dw Route8GateText3
