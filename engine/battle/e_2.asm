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

TransformEffect_: ; 3bab1 (e:7ab1)
	ld hl, wBattleMonSpecies
	ld de, wEnemyMonSpecies
	ld bc, W_ENEMYBATTSTATUS3
	ld a, [W_ENEMYBATTSTATUS1]
	ld a, [H_WHOSETURN]
	and a
	jr nz, .asm_3bad1
	ld hl, wEnemyMonSpecies
	ld de, wBattleMonSpecies
	ld bc, W_PLAYERBATTSTATUS3
	ld [wPlayerMoveListIndex], a
	ld a, [W_PLAYERBATTSTATUS1]
.asm_3bad1
	bit Invulnerable, a ; is mon invulnerable to typical attacks? (fly/dig)
	jp nz, .failed
	push hl
	push de
	push bc
	ld hl, W_PLAYERBATTSTATUS2
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3bae4
	ld hl, W_ENEMYBATTSTATUS2
.asm_3bae4
	bit HasSubstituteUp, [hl]
	push af
	ld hl, Func_79747
	ld b, BANK(Func_79747)
	call nz, Bankswitch
	ld a, [W_OPTIONS]
	add a
	ld hl, PlayCurrentMoveAnimation
	ld b, BANK(PlayCurrentMoveAnimation)
	jr nc, .asm_3baff
	ld hl, AnimationTransformMon
	ld b, BANK(AnimationTransformMon)
.asm_3baff
	call Bankswitch
	ld hl, Func_79771
	ld b, BANK(Func_79771)
	pop af
	call nz, Bankswitch
	pop bc
	ld a, [bc]
	set Transformed, a
	ld [bc], a
	pop de
	pop hl
	push hl
	ld a, [hl]
	ld [de], a
	ld bc, $5
	add hl, bc
	inc de
	inc de
	inc de
	inc de
	inc de
	inc bc
	inc bc
	call CopyData
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3bb32
	ld a, [de]
	ld [wcceb], a
	inc de
	ld a, [de]
	ld [wccec], a
	dec de
.asm_3bb32
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	inc hl
	inc hl
	inc hl
	inc de
	inc de
	inc de
	ld bc, $8
	call CopyData
	ld bc, $ffef
	add hl, bc
	ld b, $4
.asm_3bb4a
	ld a, [hli]
	and a
	jr z, .asm_3bb57
	ld a, $5
	ld [de], a
	inc de
	dec b
	jr nz, .asm_3bb4a
	jr .asm_3bb5d
.asm_3bb57
	xor a
	ld [de], a
	inc de
	dec b
	jr nz, .asm_3bb57
.asm_3bb5d
	pop hl
	ld a, [hl]
	ld [wd11e], a
	call GetMonName
	ld hl, wEnemyMonUnmodifiedAttack
	ld de, wPlayerMonUnmodifiedAttack
	call .copyBasedOnTurn
	ld hl, wEnemyMonStatMods
	ld de, wPlayerMonStatMods
	call .copyBasedOnTurn
	ld hl, TransformedText
	jp PrintText

.copyBasedOnTurn
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3bb86
	push hl
	ld h, d
	ld l, e
	pop de
.asm_3bb86
	ld bc, $8
	jp CopyData

.failed
	ld hl, PrintButItFailedText_
	jp BankswitchEtoF

TransformedText: ; 3bb92 (e:7b92)
	TX_FAR _TransformedText
	db "@"

ReflectLightScreenEffect_: ; 3bb97 (e:7b97)
	ld hl, W_PLAYERBATTSTATUS3
	ld de, W_PLAYERMOVEEFFECT
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3bba8
	ld hl, W_ENEMYBATTSTATUS3
	ld de, W_ENEMYMOVEEFFECT
.asm_3bba8
	ld a, [de]
	cp LIGHT_SCREEN_EFFECT
	jr nz, .reflect
	bit HasLightScreenUp, [hl] ; is mon already protected by light screen?
	jr nz, .moveFailed
	set HasLightScreenUp, [hl] ; mon is now protected by light screen
	ld hl, LightScreenProtectedText
	jr .asm_3bbc1
.reflect
	bit HasReflectUp, [hl] ; is mon already protected by reflect?
	jr nz, .moveFailed
	set HasReflectUp, [hl] ; mon is now protected by reflect
	ld hl, ReflectGainedArmorText
.asm_3bbc1
	push hl
	ld hl, PlayCurrentMoveAnimation
	call BankswitchEtoF
	pop hl
	jp PrintText
.moveFailed
	ld c, $32
	call DelayFrames
	ld hl, PrintButItFailedText_
	jp BankswitchEtoF

LightScreenProtectedText: ; 3bbd7 (e:7bd7)
	TX_FAR _LightScreenProtectedText
	db "@"

ReflectGainedArmorText: ; 3bbdc (e:7bdc)
	TX_FAR _ReflectGainedArmorText
	db "@"

BankswitchEtoF: ; 3bbe1 (e:7be1)
	ld b, BANK(BattleCore)
	jp Bankswitch
