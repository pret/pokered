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
	ld [wMuteAudioAndPauseMusic], a
	ld [wActionResultOrTookBattleTurn], a
	ld [wUnusedMapVariable], a
	ld [wIsAltPalettePkmn], a
	ld [wIsAltPalettePkmnData], a
	ld [wOverworldAnimationCounter], a
	ld hl, wCardKeyDoorY
	ld [hli], a
	ld [hl], a
	ld hl, wWhichTrade
	ld bc, wStandingOnWarpPadOrHole - wWhichTrade
	call FillMemory
;;;;;;;;;; PureRGBnote: ADDED: code that helps track which of the new music tracks is playing if any are
	ld a, [wCurrentMapScriptFlags]
	bit 3, a
	jr nz, .clear
	ld a, [wCurMapConnections]
	bit BIT_EXTRA_MUSIC_MAP, a ; bit that indicates the map has extra music
	ret nz ; when going between maps that have extra music, we need to see the current music in case multiple maps have extra music and are connected
.clear
	xor a
	ld [wReplacedMapMusic], a ; clear this variable in places where we don't have replaced map music
;;;;;;;;;;
	ret
