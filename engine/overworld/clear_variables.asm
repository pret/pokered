ClearVariablesOnEnterMap::
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	ldh [rWY], a
	xor a
	ldh [hAutoBGTransferEnabled], a
	ld [wStepCounter], a
	ld [wLoneAttackNo], a
	ldh [hJoyPressed], a
	ldh [hJoyReleased], a
	ldh [hJoyHeld], a
	ld [wActionResultOrTookBattleTurn], a
	ld hl, wCardKeyDoorY
	ld [hli], a
	ld [hl], a
	ld hl, wWhichTrade
	ld bc, wStandingOnWarpPadOrHole - wWhichTrade
	call FillMemory
	
	; The Mystery Box for Meltan gets switched off when leaving every map, but SPECIFICALLY not after a battle.
	; Because leaving battle is map re-entry, this exception is included.
	ld a, [wDontSwitchOffMysteryBoxYet] ; Load WRAM bit.
	and a ; Did a battle just happen?
	jr nz, .skip ; Yes? Off you go then.
	ld a, $0 ; No? Let's zero both of these out then.
	ld [wMysteryBoxActive], a ; This is now deactivated.
	ld [wDontSwitchOffMysteryBoxYet], a ; To be activated when a Meltan is defeated later.
.skip
	ret
