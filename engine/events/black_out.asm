ResetStatusAndHalveMoneyOnBlackout::
; Reset player status on blackout.
	xor a
	ld [wBattleResult], a
	ld [wWalkBikeSurfState], a
	ld [wIsInBattle], a
	ld [wMapPalOffset], a
	ld [wNPCMovementScriptFunctionNum], a
	ldh [hJoyHeld], a
	ld [wNPCMovementScriptPointerTableNum], a
	ld [wFlags_0xcd60], a

	ldh [hMoney], a
	ldh [hMoney + 1], a
	ldh [hMoney + 2], a
	call HasEnoughMoney
	jr c, .lostmoney ; never happens

	; Halve the player's money.
	ld a, [wPlayerMoney]
	ldh [hMoney], a
	ld a, [wPlayerMoney + 1]
	ldh [hMoney + 1], a
	ld a, [wPlayerMoney + 2]
	ldh [hMoney + 2], a
	xor a
	ldh [hDivideBCDDivisor], a
	ldh [hDivideBCDDivisor + 1], a
	ld a, 2
	ldh [hDivideBCDDivisor + 2], a
	predef DivideBCDPredef3
	ldh a, [hDivideBCDQuotient]
	ld [wPlayerMoney], a
	ldh a, [hDivideBCDQuotient + 1]
	ld [wPlayerMoney + 1], a
	ldh a, [hDivideBCDQuotient + 2]
	ld [wPlayerMoney + 2], a

.lostmoney
	ld hl, wd732
	set 2, [hl]
	res 3, [hl]
	set 6, [hl]
	ld a, %11111111
	ld [wJoyIgnore], a
	predef_jump HealParty
