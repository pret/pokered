Route8Gate_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route8Gate_ScriptPointers
	ld a, [wRoute8GateCurScript]
	jp CallFunctionInTable

Route8Gate_ScriptPointers:
	def_script_pointers
	dw_const Route8GateDefaultScript,      SCRIPT_ROUTE8GATE_DEFAULT
	dw_const Route8GatePlayerMovingScript, SCRIPT_ROUTE8GATE_PLAYER_MOVING

Route8GateMovePlayerRightScript:
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld a, PAD_RIGHT
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	xor a
	ld [wSpritePlayerStateData2MovementByte1], a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ret

Route8GateDefaultScript:
	ld a, [wStatusFlags1]
	bit BIT_GAVE_SAFFRON_GUARDS_DRINK, a
	ret nz
	ld hl, .PlayerInCoordsArray
	call ArePlayerCoordsInArray
	ret nc
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	xor a
	ldh [hJoyHeld], a
	farcall RemoveGuardDrink
	ldh a, [hItemToRemoveID]
	and a
	jr nz, .have_drink
	ld a, TEXT_ROUTE8GATE_GUARD_GEE_IM_THIRSTY
	ldh [hTextID], a
	call DisplayTextID
	call Route8GateMovePlayerRightScript
	ld a, SCRIPT_ROUTE8GATE_PLAYER_MOVING
	ld [wRoute8GateCurScript], a
	ret
.have_drink
	ld hl, wStatusFlags1
	set BIT_GAVE_SAFFRON_GUARDS_DRINK, [hl]
	ld a, TEXT_ROUTE8GATE_GUARD_GIVE_DRINK
	ldh [hTextID], a
	jp DisplayTextID

.PlayerInCoordsArray:
	dbmapcoord  2,  3
	dbmapcoord  2,  4
	db -1 ; end

Route8GatePlayerMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wRoute8GateCurScript], a
	ret

Route8Gate_TextPointers:
	def_text_pointers
	dw_const SaffronGateGuardText,             TEXT_ROUTE8GATE_GUARD
	dw_const SaffronGateGuardGeeImThirstyText, TEXT_ROUTE8GATE_GUARD_GEE_IM_THIRSTY
	dw_const SaffronGateGuardGiveDrinkText,    TEXT_ROUTE8GATE_GUARD_GIVE_DRINK
