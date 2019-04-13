HazeEffect_:
	ld a, $7
; store 7 on every stat mod
	ld hl, wPlayerMonAttackMod
	call ResetStatMods
	ld hl, wEnemyMonAttackMod
	call ResetStatMods
; copy unmodified stats to battle stats
	ld hl, wPlayerMonUnmodifiedAttack
	ld de, wBattleMonAttack
	call ResetStats
	ld hl, wEnemyMonUnmodifiedAttack
	ld de, wEnemyMonAttack
	call ResetStats
; cure non-volatile status, but only for the target
	ld hl, wEnemyMonStatus
	ld de, wEnemySelectedMove
	ld a, [H_WHOSETURN]
	and a
	jr z, .cureStatuses
	ld hl, wBattleMonStatus
	dec de ; wPlayerSelectedMove

.cureStatuses
	ld a, [hl]
	ld [hl], $0
	and SLP | (1 << FRZ)
	jr z, .cureVolatileStatuses
; prevent the Pokemon from executing a move if it was asleep or frozen
	ld a, $ff
	ld [de], a

.cureVolatileStatuses
	xor a
	ld [wPlayerDisabledMove], a
	ld [wEnemyDisabledMove], a
	ld hl, wPlayerDisabledMoveNumber
	ld [hli], a
	ld [hl], a
	ld hl, wPlayerBattleStatus1
	call CureVolatileStatuses
	ld hl, wEnemyBattleStatus1
	call CureVolatileStatuses
	ld hl, PlayCurrentMoveAnimation
	call CallBankF
	ld hl, StatusChangesEliminatedText
	jp PrintText

CureVolatileStatuses:
	res CONFUSED, [hl]
	inc hl ; BATTSTATUS2
	ld a, [hl]
	; clear USING_X_ACCURACY, PROTECTED_BY_MIST, GETTING_PUMPED, and SEEDED statuses
	and $ff ^((1 << USING_X_ACCURACY) | (1 << PROTECTED_BY_MIST) | (1 << GETTING_PUMPED) | (1 << SEEDED))
	ld [hli], a ; BATTSTATUS3
	ld a, [hl]
	and %11110000 | (1 << TRANSFORMED) ; clear Bad Poison, Reflect and Light Screen statuses
	ld [hl], a
	ret

ResetStatMods:
	ld b, $8
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

ResetStats:
	ld b, $8
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	ret

StatusChangesEliminatedText:
	TX_FAR _StatusChangesEliminatedText
	db "@"
