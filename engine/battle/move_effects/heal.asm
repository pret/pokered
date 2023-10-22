; PureRGBnote: ADDED: heal effect is also used now to give the user of TELEPORT in battle 25% HP regen on switching out
TeleportHealEffect:
	ld a, d
	push af
	ld a, [hWhoseTurn]
	and a
	ld de, wEnemyMonHP
	ld hl, wEnemyMonMaxHP
	jr nz, .enemyTurn
	ld bc, wPartyMon2 - wPartyMon1 
	ld de, wPartyMon1HP
	ld hl, wPartyMon1MaxHP
	pop af
	push af
	call AddNTimes
	pop af
	push hl
	ld h, d
	ld l, e
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	jr .ready
.enemyTurn
	pop af
.ready
	ld a, TELEPORT
	jr HealEffectCommon

HealEffect_:
	ldh a, [hWhoseTurn]
	and a
	ld de, wBattleMonHP
	ld hl, wBattleMonMaxHP
	ld a, [wPlayerMoveNum]
	jr z, HealEffectCommon
	ld de, wEnemyMonHP
	ld hl, wEnemyMonMaxHP
	ld a, [wEnemyMoveNum]
;;;;;;;;;; shinpokerednote: FIXED: HP recovery bug where the move fails when HP is 255 or 511 less than max HP
HealEffectCommon:
	;h holds high byte of maxHP, l holds low byte of maxHP
	;d holds high byte of curHP, e holds low byte of curHP
	ld b, a
	ld a, [de]	;load d into a
	cp [hl] 	;compare a with h
			; most significant bytes comparison is ignored
	        ; causes the move to miss if max HP is 255 or 511 points higher than the current HP
	;assume h >= d. it does not matter what d or h are, c_flag = 1 if h != d so assume h > d
	inc de	;incrementing 16-bit registers does not change the flag register
	inc hl	; however, it does get us working with e & l
	jr nz, .passed	; if c_flag is set, then h is > d and therefore hl is assumed > de. we can stop checking here
	ld a, [de]	;if h = d, then load e into a. again, assume l >= e
	sbc [hl]	;c_flag is still 0. compare a with l. 
	;A a zero flag means both h and d as well as l and e are equal pairs. hl = de, so already at full hp!
	jp z, .failed ; no effect if user's HP is already at its maximum
.passed
;;;;;;;;;;
	ld a, b
	cp REST
	jr nz, .healHP
	push hl
	push de
	push af
	ld c, 50
	rst _DelayFrames
	ld hl, wBattleMonStatus
	ldh a, [hWhoseTurn]
	and a
	jr z, .restEffect
	ld hl, wEnemyMonStatus
.restEffect
	push hl
	callfar UndoBurnParStats ; shinpokerednote: FIXED: remove negative effects of burn/paralyze on stats before healing
	pop hl
	ld a, [hl]
	and a
	ld [hl], 2 ; clear status and set number of turns asleep to 2
	ld hl, StartedSleepingEffect ; if mon didn't have an status
	jr z, .printRestText
	ld hl, FellAsleepBecameHealthyText ; if mon had an status
.printRestText
	rst _PrintText
	pop af
	pop de
	pop hl
.healHP
	push af
	ld a, [hld]
	ld [wHPBarMaxHP], a
	ld c, a
	ld a, [hl]
	ld [wHPBarMaxHP+1], a
	ld b, a
	pop af
	cp REST
	jr z, .gotHPAmountToHeal
; Recover and Softboiled only heal for half the mon's max HP
	srl b
	rr c
	cp WITHDRAW
	jr z, .oneThird
	cp GROWTH
	jr z, .oneThird
	cp TELEPORT
	jr nz, .gotHPAmountToHeal
; Teleport heals 1/4 HP
	srl b
	rr c
.gotHPAmountToHeal
; update HP
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
	jr c, .playAnim
; copy max HP to current HP if an overflow occurred
	ld a, [hli]
	ld [de], a
	ld [wHPBarNewHP+1], a
	inc de
	ld a, [hl]
	ld [de], a
	ld [wHPBarNewHP], a
.playAnim
	call GetMoveNumber
	cp TELEPORT
	ret z
	ld hl, PlayCurrentMoveAnimation
	call EffectCallBattleCore
	ldh a, [hWhoseTurn]
	and a
	hlcoord 10, 9
	ld a, $1
	jr z, .updateHPBar
	hlcoord 2, 2
	xor a
.updateHPBar
	ld [wHPBarType], a
	predef UpdateHPBar2
	ld hl, DrawHUDsAndHPBars
	call EffectCallBattleCore
	ld hl, RegainedHealthText
	jp PrintText
.failed
	call GetMoveNumber
	cp TELEPORT
	ret z
	ld c, 50
	rst _DelayFrames
	ld hl, PrintButItFailedText_
	jp EffectCallBattleCore
;;;;;;;;;; PureRGBnote: ADDED: withdraw and growth heal around 1/3rd health instead of 1/2
.oneThird
	push hl
	; 1/2 HP in bc currently
	srl b
	rr c
	; 1/4 HP in bc currently
	ld h, b
	ld l, c
	srl b
	rr c
	srl b
	rr c
	; 1/16 HP in bc currently
	add hl, bc ; 5/16 in hl
	srl b
	rr c
	srl b
	rr c ; 1/64 HP in bc currently
	add hl, bc ; 21/64 in hl
	ld b, h
	ld c, l ; 21/64 in bc (pretty close to 1/3 but not exactly)
	pop hl
	jp .gotHPAmountToHeal
;;;;;;;;;;

GetMoveNumber:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	ret z
	ld a, [wEnemyMoveNum]
	ret

StartedSleepingEffect:
	text_far _StartedSleepingEffect
	text_end

FellAsleepBecameHealthyText:
	text_far _FellAsleepBecameHealthyText
	text_end

RegainedHealthText:
	text_far _RegainedHealthText
	text_end
