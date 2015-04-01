HealEffect_: ; 3b9ec (e:79ec)
	ld a, [H_WHOSETURN]
	and a
	ld de, wBattleMonHP
	ld hl, wBattleMonMaxHP
	ld a, [W_PLAYERMOVENUM]
	jr z, .asm_3ba03
	ld de, wEnemyMonHP
	ld hl, wEnemyMonMaxHP
	ld a, [W_ENEMYMOVENUM]
.asm_3ba03
	ld b, a
	ld a, [de]
	cp [hl]
	inc de
	inc hl
	ld a, [de]
	sbc [hl]
	jp z, .failed
	ld a, b
	cp REST
	jr nz, .asm_3ba37
	push hl
	push de
	push af
	ld c, 50
	call DelayFrames
	ld hl, wBattleMonStatus
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3ba25
	ld hl, wEnemyMonStatus
.asm_3ba25
	ld a, [hl]
	and a
	ld [hl], 2 ; Number of turns from Rest
	ld hl, StartedSleepingEffect
	jr z, .asm_3ba31
	ld hl, FellAsleepBecameHealthyText
.asm_3ba31
	call PrintText
	pop af
	pop de
	pop hl
.asm_3ba37
	ld a, [hld]
	ld [wHPBarMaxHP], a
	ld c, a
	ld a, [hl]
	ld [wHPBarMaxHP+1], a
	ld b, a
	jr z, .asm_3ba47
	srl b
	rr c
.asm_3ba47
	ld a, [de]
	ld [wHPBarOldHP], a
	add c
	ld [de], a
	ld [wHPBarNewHP], a
	dec de
	ld a, [de]
	ld [wHPBarOldHP+1], a
	adc b
	ld [de], a
	ld [wHPBarNewHP+1], a
	inc hl
	inc de
	ld a, [de]
	dec de
	sub [hl]
	dec hl
	ld a, [de]
	sbc [hl]
	jr c, .asm_3ba6f
	ld a, [hli]
	ld [de], a
	ld [wHPBarNewHP+1], a
	inc de
	ld a, [hl]
	ld [de], a
	ld [wHPBarNewHP], a
.asm_3ba6f
	ld hl, PlayCurrentMoveAnimation
	call BankswitchEtoF
	ld a, [H_WHOSETURN]
	and a
	hlCoord 10, 9
	ld a, $1
	jr z, .asm_3ba83
	hlCoord 2, 2
	xor a
.asm_3ba83
	ld [wHPBarType], a
	predef UpdateHPBar2
	ld hl, DrawHUDsAndHPBars
	call BankswitchEtoF
	ld hl, RegainedHealthText
	jp PrintText
.failed
	ld c, 50
	call DelayFrames
	ld hl, PrintButItFailedText_
	jp BankswitchEtoF

StartedSleepingEffect: ; 3baa2 (e:7aa2)
	TX_FAR _StartedSleepingEffect
	db "@"

FellAsleepBecameHealthyText: ; 3baa7 (e:7aa7)
	TX_FAR _FellAsleepBecameHealthyText
	db "@"

RegainedHealthText: ; 3baac (e:7aac)
	TX_FAR _RegainedHealthText
	db "@"
