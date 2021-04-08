Route5Gate_Script:
	call EnableAutoTextBoxDrawing
	ld a, [wRoute5GateCurScript]
	ld hl, Route5Gate_ScriptPointers
	jp CallFunctionInTable

Route5Gate_ScriptPointers:
	dw Route5GateScript0
	dw Route5GateScript1

Route5GateScript_1df43:
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	jp StartSimulatingJoypadStates

Route5GateScript0:
	ld a, [wd728]
	bit 6, a
	ret nz
	ld hl, CoordsData_1df8f
	call ArePlayerCoordsInArray
	ret nc
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	xor a
	ldh [hJoyHeld], a
	farcall RemoveGuardDrink
	ldh a, [hItemToRemoveID]
	and a
	jr nz, .asm_1df82
	ld a, $2
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	call Route5GateScript_1df43
	ld a, $1
	ld [wRoute5GateCurScript], a
	ret
.asm_1df82
	ld a, $3
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld hl, wd728
	set 6, [hl]
	ret

CoordsData_1df8f:
	dbmapcoord  3,  3
	dbmapcoord  4,  3
	db -1 ; end

Route5GateScript1:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wRoute5GateCurScript], a
	ret

Route5Gate_TextPointers:
	dw Route5GateText1
	dw Route5GateText2
	dw Route5GateText3

Route8GateText1:
Route7GateText1:
Route6GateText1:
Route5GateText1:
	text_asm
	ld a, [wd728]
	bit 6, a
	jr nz, .asm_88856
	farcall RemoveGuardDrink
	ldh a, [hItemToRemoveID]
	and a
	jr nz, .asm_768a2
	ld hl, Route5GateText2
	call PrintText
	call Route5GateScript_1df43
	ld a, $1
	ld [wRoute5GateCurScript], a
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

Route8GateText2:
Route7GateText2:
Route6GateText2:
Route5GateText2:
	text_far _SaffronGateText_1dfe7
	text_end

Route8GateText3:
Route7GateText3:
Route6GateText3:
Route5GateText3:
	text_far _SaffronGateText_8aaa9
	sound_get_key_item
	text_far _SaffronGateText_1dff1
	text_end

SaffronGateText_1dff6:
	text_far _SaffronGateText_1dff6
	text_end
