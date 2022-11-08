; PureRGBnote: ADDED: new effect that can apply any of burn/freeze/paralyze. Used for tri attack.

TriAttackEffect_:
	xor a
	ld [wAnimationType], a
	callfar CheckTargetSubstitute
	ret nz ; can't cause a status on a substitute
	ld b, d ; d = random number generated before jpfar'ing to TriAttackEffect_
	ld hl, wEnemyMonStatus
	ld de, wPlayerMoveType
	ldh a, [hWhoseTurn]
	and a
	jp z, .next
	ld hl, wBattleMonStatus
	ld de, wEnemyMoveType
.next
	ld a, [hl]
	and a ; does the target already have a status ailment?
	ret nz
.burn
	ld a, b
	cp 26 ; 26/256 chance of result being 0-25 (10.1%)
	jr nc, .freeze ; if burn didnt proc

	ld a, FIRE
	call CheckTriAttackTypes ; check if the target is immune due to types
	jr nc, .freeze ; can't burn fire pokemon

	set BRN, [hl]
	callfar HalveAttackDueToBurn
	call GetStatusAnimation
	ld [wAnimationID], a
	callfar PlayBattleAnimationGotID
	jpfar PrintBurnText
.freeze
	ld a, b
	cp 52 ; 26/256 chance of result being 26-51 (10.1%)
	jr nc, .paralyze ; if freeze didnt proc

	ld a, ICE
	call CheckTriAttackTypes ; check if the target is immune due to types
	jr nc, .paralyze ; can't freeze ice pokemon

	set FRZ, [hl]
	callfar ClearHyperBeam
	call GetStatusAnimation
	ld [wAnimationID], a
	callfar PlayBattleAnimationGotID
	jpfar PrintFrozenText
.paralyze
	ld a, b
	cp 78 ; 26/256 chance of result being 52-77 (10.1%)
	ret nc ; if paralyze didnt proc

	ld a, GROUND
	call CheckTriAttackTypes ; check if the target is immune due to types
	ret nc ; can't paralyze ground pokemon

	set PAR, [hl]
	callfar QuarterSpeedDueToParalysis
	call GetStatusAnimation
	ld [wAnimationID], a
	callfar PlayBattleAnimationGotID
	jpfar PrintMayNotAttackText

GetStatusAnimation:
	ldh a, [hWhoseTurn]
	and a
	ld a, SHAKE_ENEMY_HUD_ANIM
	ret z
	ld a, SHAKE_SCREEN_ANIM
	ret

; a = type to check
; hl = target mon status
CheckTriAttackTypes:
	push de
	push bc
	ld d, a
	ld b, h
	ld c, l
	inc bc
	ld a, [bc]
	cp d
	jr z, .blockStatus
	inc bc
	ld a, [bc]
	cp d
	jr z, .blockStatus
	scf
	jr .done
.blockStatus
	and a ; clear carry flag
.done
	pop bc
	pop de
	ret
