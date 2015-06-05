EndOfBattle: ; 137aa (4:77aa)
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr nz, .notLinkBattle
; link battle
	ld a, [wEnemyMonPartyPos]
	ld hl, wEnemyMon1Status
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld a, [wEnemyMonStatus]
	ld [hl], a
	call ClearScreen
	callab DisplayLinkBattleVersusTextBox
	ld a, [wBattleResult]
	cp $1
	ld de, YouWinText
	jr c, .placeWinOrLoseString
	ld de, YouLoseText
	jr z, .placeWinOrLoseString
	ld de, DrawText
.placeWinOrLoseString
	hlCoord 6, 8
	call PlaceString
	ld c, $c8
	call DelayFrames
	jr .evolution
.notLinkBattle
	ld a, [wBattleResult]
	and a
	jr nz, .resetVariables
	ld hl, wTotalPayDayMoney
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	jr z, .evolution ; if pay day money is 0, jump
	ld de, wPlayerMoney + 2
	ld c, $3
	predef AddBCDPredef
	ld hl, PickUpPayDayMoneyText
	call PrintText
.evolution
	xor a
	ld [wccd4], a
	predef EvolutionAfterBattle
.resetVariables
	xor a
	ld [wLowHealthAlarm], a ;disable low health alarm
	ld [wc02a], a
	ld [W_ISINBATTLE], a
	ld [W_BATTLETYPE], a
	ld [W_MOVEMISSED], a
	ld [W_CUROPPONENT], a
	ld [wd11f], a
	ld [wNumRunAttempts], a
	ld [wEscapedFromBattle], a
	ld hl, wcc2b
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [wListScrollOffset], a
	ld hl, wPlayerStatsToDouble
	ld b, $18
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ld hl, wd72c
	set 0, [hl]
	call WaitForSoundToFinish
	call GBPalWhiteOut
	ld a, $ff
	ld [wDestinationWarpID], a
	ret

YouWinText: ; 13853 (4:7853)
	db "YOU WIN@"

YouLoseText: ; 1385b (4:785b)
	db "YOU LOSE@"

DrawText: ; 13864 (4:7864)
	db "  DRAW@"

PickUpPayDayMoneyText: ; 1386b (4:786b)
	TX_FAR _PickUpPayDayMoneyText
	db "@"
