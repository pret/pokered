Route5Gate_Script:
	call EnableAutoTextBoxDrawing
	ld a, [wRoute5GateCurScript]
	ld hl, Route5Gate_ScriptPointers
	jp CallFunctionInTable

Route5Gate_ScriptPointers:
	def_script_pointers
	dw_const Route5GateDefaultScript,      SCRIPT_ROUTE5GATE_DEFAULT
	dw_const Route5GatePlayerMovingScript, SCRIPT_ROUTE5GATE_PLAYER_MOVING

Route5GateMovePlayerUpScript:
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	jp StartSimulatingJoypadStates

Route5GateDefaultScript:
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
	ld a, TEXT_ROUTE5GATE_GUARD_GEE_IM_THIRSTY
	ldh [hTextID], a
	call DisplayTextID
	call Route5GateMovePlayerUpScript
	ld a, SCRIPT_ROUTE5GATE_PLAYER_MOVING
	ld [wRoute5GateCurScript], a
	ret
.have_drink
	ld a, TEXT_ROUTE5GATE_GUARD_GIVE_DRINK
	ldh [hTextID], a
	call DisplayTextID
	ld hl, wStatusFlags1
	set BIT_GAVE_SAFFRON_GUARDS_DRINK, [hl]
	ret

.PlayerInCoordsArray:
	dbmapcoord  3,  3
	dbmapcoord  4,  3
	db -1 ; end

Route5GatePlayerMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wRoute5GateCurScript], a
	ret

Route5Gate_TextPointers:
	def_text_pointers
	dw_const SaffronGateGuardText,             TEXT_ROUTE5GATE_GUARD
	dw_const SaffronGateGuardGeeImThirstyText, TEXT_ROUTE5GATE_GUARD_GEE_IM_THIRSTY
	dw_const SaffronGateGuardGiveDrinkText,    TEXT_ROUTE5GATE_GUARD_GIVE_DRINK

SaffronGateGuardText:
	text_asm
	ld a, [wStatusFlags1]
	bit BIT_GAVE_SAFFRON_GUARDS_DRINK, a
	jr nz, .thanks_for_drink
	farcall RemoveGuardDrink
	ldh a, [hItemToRemoveID]
	and a
	jr nz, .have_drink
	ld hl, SaffronGateGuardGeeImThirstyText
	call PrintText
	call Route5GateMovePlayerUpScript
	ld a, SCRIPT_ROUTE5GATE_PLAYER_MOVING
	ld [wRoute5GateCurScript], a
	jp TextScriptEnd

.have_drink
	ld hl, SaffronGateGuardGiveDrinkText
	call PrintText
	ld hl, wStatusFlags1
	set BIT_GAVE_SAFFRON_GUARDS_DRINK, [hl]
	jp TextScriptEnd

.thanks_for_drink
	ld hl, SaffronGateGuardThanksForTheDrinkText
	call PrintText
	jp TextScriptEnd

SaffronGateGuardGeeImThirstyText:
	text_far _SaffronGateGuardGeeImThirstyText
	text_end

SaffronGateGuardGiveDrinkText:
	text_far _SaffronGateGuardImParchedText
	sound_get_key_item
	text_far _SaffronGateGuardYouCanGoOnThroughText
	text_end

SaffronGateGuardThanksForTheDrinkText:
	text_far _SaffronGateGuardThanksForTheDrinkText
	text_end
