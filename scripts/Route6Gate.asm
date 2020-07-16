Route6Gate_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route6Gate_ScriptPointers
	ld a, [wRoute6GateCurScript]
	call CallFunctionInTable
	ret

Route6Gate_ScriptPointers:
	dw Route6GateScript0
	dw Route6GateScript1

Route6GateScript0:
	ld a, [wd728]
	bit 6, a
	ret nz
	ld hl, CoordsData_1e08c
	call ArePlayerCoordsInArray
	ret nc
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	xor a
	ldh [hJoyHeld], a
	farcall RemoveGuardDrink
	ldh a, [hItemToRemoveID]
	and a
	jr nz, .asm_1e080
	ld a, $2
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	call Route6GateScript_1e0a1
	ld a, $1
	ld [wRoute6GateCurScript], a
	ret
.asm_1e080
	ld hl, wd728
	set 6, [hl]
	ld a, $3
	ldh [hSpriteIndexOrTextID], a
	jp DisplayTextID

CoordsData_1e08c:
	dbmapcoord  3,  2
	dbmapcoord  4,  2
	db -1 ; end

Route6GateScript1:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wRoute6GateCurScript], a
	ret

Route6GateScript_1e0a1:
	ld hl, wd730
	set 7, [hl]
	ld a, $80
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	xor a
	ld [wSpritePlayerStateData2MovementByte1], a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ret

Route6Gate_TextPointers:
	dw Route6GateText1
	dw Route6GateText2
	dw Route6GateText3
