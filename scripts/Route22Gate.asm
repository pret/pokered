Route22Gate_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route22Gate_ScriptPointers
	ld a, [wRoute22GateCurScript]
	call CallFunctionInTable
	ld a, [wYCoord]
	cp 4
	ld a, ROUTE_23
	jr c, .set_last_map
	ld a, ROUTE_22
.set_last_map
	ld [wLastMap], a
	ret

Route22Gate_ScriptPointers:
	def_script_pointers
	dw_const Route22GateDefaultScript,      SCRIPT_ROUTE22GATE_DEFAULT
	dw_const Route22GatePlayerMovingScript, SCRIPT_ROUTE22GATE_PLAYER_MOVING
	dw_const Route22GateNoopScript,         SCRIPT_ROUTE22GATE_NOOP

Route22GateDefaultScript:
	ld hl, Route22GateScriptCoords
	call ArePlayerCoordsInArray
	ret nc
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_ROUTE22GATE_GUARD
	ldh [hTextID], a
	jp DisplayTextID

Route22GateScriptCoords:
	dbmapcoord  4,  2
	dbmapcoord  5,  2
	db -1 ; end

Route22GateMovePlayerDownScript:
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSpritePlayerStateData1FacingDirection], a
	ld [wJoyIgnore], a
	jp StartSimulatingJoypadStates

Route22GatePlayerMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	call Delay3
	ld a, SCRIPT_ROUTE22GATE_DEFAULT
	ld [wRoute22GateCurScript], a
Route22GateNoopScript:
	ret

Route22Gate_TextPointers:
	def_text_pointers
	dw_const Route22GateGuardText, TEXT_ROUTE22GATE_GUARD

Route22GateGuardText:
	text_asm
	ld a, [wObtainedBadges]
	bit BIT_BOULDERBADGE, a
	jr nz, .has_boulderbadge
	ld hl, Route22GateGuardNoBoulderbadgeText
	call PrintText
	call Route22GateMovePlayerDownScript
	ld a, SCRIPT_ROUTE22GATE_PLAYER_MOVING
	jr .set_current_script
.has_boulderbadge
	ld hl, Route22GateGuardGoRightAheadText
	call PrintText
	ld a, SCRIPT_ROUTE22GATE_NOOP
.set_current_script
	ld [wRoute22GateCurScript], a
	jp TextScriptEnd

Route22GateGuardNoBoulderbadgeText:
	text_far _Route22GateGuardNoBoulderbadgeText
	text_asm
	ld a, SFX_DENIED
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld hl, Route22GateGuardICantLetYouPassText
	ret

Route22GateGuardICantLetYouPassText:
	text_far _Route22GateGuardICantLetYouPassText
	text_end

Route22GateGuardGoRightAheadText:
	text_far _Route22GateGuardGoRightAheadText
	sound_get_item_1
	text_end
