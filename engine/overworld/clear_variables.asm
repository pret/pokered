ClearVariablesOnEnterMap:
	ld a, SCREEN_HEIGHT_PIXELS
	ld [hWY], a
	ld [rWY], a
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	ld [wStepCounter], a
	ld [wLoneAttackNo], a
	ld [hJoyPressed], a
	ld [hJoyReleased], a
	ld [hJoyHeld], a
	ld [wActionResultOrTookBattleTurn], a
	ld [wUnusedD5A3], a
	ld hl, wCardKeyDoorY
	ld [hli], a
	ld [hl], a
	ld hl, wWhichTrade
	ld bc, wStandingOnWarpPadOrHole - wWhichTrade
	call FillMemory
	ret
