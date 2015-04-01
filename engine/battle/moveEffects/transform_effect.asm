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
