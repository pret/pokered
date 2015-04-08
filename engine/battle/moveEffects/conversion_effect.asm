ConversionEffect_: ; 139a3 (4:79a3)
	ld hl, wEnemyMonType1
	ld de, wBattleMonType1
	ld a, [H_WHOSETURN]
	and a
	ld a, [W_ENEMYBATTSTATUS1]
	jr z, .conversionEffect
	push hl
	ld h, d
	ld l, e
	pop de
	ld a, [W_PLAYERBATTSTATUS1]
.conversionEffect
	bit Invulnerable, a ; is mon immune to typical attacks (dig/fly)
	jr nz, PrintButItFailedText
; copy target's types to user	
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld hl, PlayCurrentMoveAnimation
	call CallBankF
	ld hl, ConvertedTypeText
	jp PrintText

ConvertedTypeText: ; 139cd (4:79cd)
	TX_FAR _ConvertedTypeText
	db "@"

PrintButItFailedText: ; 139d2 (4:79d2)
	ld hl, PrintButItFailedText_
CallBankF: ; 139d5 (4:79d5)
	ld b, BANK(PrintButItFailedText_)
	jp Bankswitch
