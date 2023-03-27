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
	ld [wUnusedD5A3], a
	ld hl, wCardKeyDoorY
	ld [hli], a
	ld [hl], a
	ld hl, wWhichTrade
	ld bc, wStandingOnWarpPadOrHole - wWhichTrade
	call FillMemory
	ld a, [wCurrentMapScriptFlags]
	bit 3, a
	jr nz, .clear
	ld a, [wMapConnections]
	bit 5, a ; bit that indicates the map has extra music
	ret nz ; when going between maps that have extra music, we need to see the current music in case multiple maps have extra music and are connected
.clear
	xor a
	ld [wReplacedMapMusic], a ; clear this variable in places where we don't have replaced map music
	ret
