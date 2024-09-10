Route7Gate_Script:
	call EnableAutoTextBoxDrawing
	ld a, [wRoute7GateCurScript]
	ld hl, Route7Gate_ScriptPointers
	call CallFunctionInTable
	ret

Route7Gate_ScriptPointers:
	def_script_pointers
	dw_const Route7DefaultScript,      SCRIPT_ROUTE7GATE_DEFAULT
	dw_const Route7PlayerMovingScript, SCRIPT_ROUTE7GATE_PLAYER_MOVING

Route7GateMovePlayerLeftScript:
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld a, D_LEFT
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	xor a
	ld [wSpritePlayerStateData2MovementByte1], a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ret

Route7DefaultScript:
	ld a, [wStatusFlags1]
	bit BIT_GAVE_SAFFRON_GUARDS_DRINK, a
	ret nz
	ld hl, .PlayerInCoordsArray
	call ArePlayerCoordsInArray
	ret nc
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	xor a
	ldh [hJoyHeld], a
	farcall RemoveGuardDrink
	ldh a, [hItemToRemoveID]
	and a
	jr nz, .have_drink
	ld a, TEXT_ROUTE7GATE_GUARD_GEE_IM_THIRSTY
	ldh [hTextID], a
	call DisplayTextID
	call Route7GateMovePlayerLeftScript
	ld a, SCRIPT_ROUTE7GATE_PLAYER_MOVING
	ld [wRoute7GateCurScript], a
	ret
.have_drink
	ld a, TEXT_ROUTE7GATE_GUARD_GIVE_DRINK
	ldh [hTextID], a
	call DisplayTextID
	ld hl, wStatusFlags1
	set BIT_GAVE_SAFFRON_GUARDS_DRINK, [hl]
	ret

.PlayerInCoordsArray:
	dbmapcoord  3,  3
	dbmapcoord  3,  4
	db -1 ; end

Route7PlayerMovingScript:
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
	def_text_pointers
	dw_const SaffronGateGuardText,             TEXT_ROUTE7GATE_GUARD
	dw_const SaffronGateGuardGeeImThirstyText, TEXT_ROUTE7GATE_GUARD_GEE_IM_THIRSTY
	dw_const SaffronGateGuardGiveDrinkText,    TEXT_ROUTE7GATE_GUARD_GIVE_DRINK
