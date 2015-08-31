Route7GateScript: ; 1e100 (7:6100)
	call EnableAutoTextBoxDrawing
	ld a, [wRoute7GateCurScript]
	ld hl, Route7GateScriptPointers
	call CallFunctionInTable
	ret

Route7GateScriptPointers: ; 1e10d (7:610d)
	dw Route7GateScript0
	dw Route7GateScript1

Route7GateScript_1e111: ; 1e111 (7:6111)
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

Route7GateScript0: ; 1e128 (7:6128)
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

CoordsData_1e167: ; 1e167 (7:6167)
	db 3,3
	db 4,3
	db $ff

Route7GateScript1: ; 1e16c (7:616c)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wRoute7GateCurScript], a
	ld [wCurMapScript], a
	ret

Route7GateTextPointers: ; 1e17f (7:617f)
	dw Route7GateText1
	dw Route7GateText2
	dw Route7GateText3
