PayDayEffect_ ; 2feb8 (b:7eb8)
	xor a
	ld hl, wcd6d
	ld [hli], a
	ld a, [H_WHOSETURN]
	and a
	ld a, [wBattleMonLevel]
	jr z, .asm_2fec8
	ld a, [wEnemyMonLevel]
.asm_2fec8
	add a
	ld [H_DIVIDEND + 3], a
	xor a
	ld [H_DIVIDEND], a
	ld [H_DIVIDEND + 1], a
	ld [H_DIVIDEND + 2], a
	ld a, $64
	ld [H_DIVISOR], a
	ld b, $4
	call Divide
	ld a, [H_QUOTIENT + 3]
	ld [hli], a
	ld a, [H_REMAINDER]
	ld [H_DIVIDEND + 3], a
	ld a, $a
	ld [H_DIVISOR], a
	ld b, $4
	call Divide
	ld a, [H_QUOTIENT + 3]
	swap a
	ld b, a
	ld a, [H_REMAINDER]
	add b
	ld [hl], a
	ld de, wTotalPayDayMoney + 2
	ld c, $3
	predef AddBCDPredef
	ld hl, CoinsScatteredText
	jp PrintText

CoinsScatteredText: ; 2ff04 (b:7f04)
	TX_FAR _CoinsScatteredText
	db "@"
