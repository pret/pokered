Route7Gate_Script:
	call EnableAutoTextBoxDrawing
	ld a, [wRoute7GateCurScript]
	ld hl, Route7Gate_ScriptPointers
	call CallFunctionInTable
	ret

Route7Gate_ScriptPointers:
	dw Route7GateScript0
	dw Route7GateScript1

Route7GateScript_1e111:
	ld hl, wd730
	set 7, [hl]
	ld a, $20
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	xor a
	ld [wSpriteStateData2 + $06], a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ret

Route7GateScript0:
	ld a, [wd728]
	bit 6, a
	ret nz
	ld hl, CoordsData_1e167
	call ArePlayerCoordsInArray
	ret nc
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	xor a
	ld [hJoyHeld], a
	callba RemoveGuardDrink
	ld a, [$ffdb]
	and a
	jr nz, .asm_1e15a
	ld a, $2
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	call Route7GateScript_1e111
	ld a, $1
	ld [wRoute7GateCurScript], a
	ret
.asm_1e15a
	ld a, $3
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld hl, wd728
	set 6, [hl]
	ret

CoordsData_1e167:
	db 3,3
	db 4,3
	db $ff

Route7GateScript1:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wRoute7GateCurScript], a
	ld [wCurMapScript], a
	ret

Route7Gate_TextPointers:
	dw Route7GateText1
	dw Route7GateText2
	dw Route7GateText3
