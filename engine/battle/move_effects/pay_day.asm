PayDayEffect_:
	xor a
	ld hl, wcd6d
	ld [hli], a
	ld a, [hWhoseTurn]
	and a
	ld a, [wBattleMonLevel]
	jr z, .payDayEffect
	ld a, [wEnemyMonLevel]
.payDayEffect
; level * 2
	add a
	ld [hDividend + 3], a
	xor a
	ld [hDividend], a
	ld [hDividend + 1], a
	ld [hDividend + 2], a
; convert to BCD
	ld a, 100
	ld [hDivisor], a
	ld b, $4
	call Divide
	ld a, [hQuotient + 3]
	ld [hli], a
	ld a, [hRemainder]
	ld [hDividend + 3], a
	ld a, 10
	ld [hDivisor], a
	ld b, $4
	call Divide
	ld a, [hQuotient + 3]
	swap a
	ld b, a
	ld a, [hRemainder]
	add b
	ld [hl], a
	ld de, wTotalPayDayMoney + 2
	ld c, $3
	predef AddBCDPredef
	ld hl, CoinsScatteredText
	jp PrintText

CoinsScatteredText:
	TX_FAR _CoinsScatteredText
	db "@"
