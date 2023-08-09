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
	ldh a, [hWhoseTurn]
	and a
	jr z, .cureStatuses
	ld hl, wBattleMonStatus
	dec de ; wPlayerSelectedMove

.cureStatuses
	ld a, [hl]
	ld [hl], $0
	and (1 << FRZ) | SLP_MASK
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
	ld hl, wPlayerBattleStatus2
	call CureVolatileStatuses
	ld hl, wEnemyBattleStatus2
	call CureVolatileStatuses

;;;;;;;;;; PureRGBnote: CHANGED: cure confusion, but only for the user
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus1
	ld de, wEnemyBattleStatus2
	jr z, .cureConfusion
	ld hl, wEnemyBattleStatus1
	ld de, wPlayerBattleStatus2
.cureConfusion
	res CONFUSED, [hl]
	ld a, [de]
	res PSYCHIC_IMMUNITY, a ; reset psychic immunity, but only for the opponent
	ld [de], a
;;;;;;;;;;
	inc hl ; hl now points to BattleStatus2 of the user
	push hl
	callfar PlayCurrentMoveAnimation
	ld hl, StatusChangesEliminatedText
	rst _PrintText
;;;;;;;;;; PureRGBnote: ADDED: haze now blocks psychic type moves for the user
	pop hl
	bit PSYCHIC_IMMUNITY, [hl] ; are they already immune to psychic attacks?
	ret nz ; if they were already immune, don't need to print that text again.
	set PSYCHIC_IMMUNITY, [hl] ; user is now immune to psychic attacks
	ld hl, ImmuneToPsychicText
	jp PrintText
;;;;;;;;;;

PrintButItFailedText:
	ld hl, PrintButItFailedText_
CallBankF:
	ld b, BANK(PrintButItFailedText_)
	jp Bankswitch

CureVolatileStatuses:
	ld a, [hl]
	; clear USING_X_ACCURACY, STAT_DOWN_IMMUNITY, GETTING_PUMPED, and SEEDED statuses
	and ~((1 << USING_X_ACCURACY) | (1 << STAT_DOWN_IMMUNITY) | (1 << GETTING_PUMPED) | (1 << SEEDED) | (1 << NORMAL_FIGHTING_IMMUNITY))
	ld [hli], a 
	ld a, [hl] ; BATTSTATUS3
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
	text_far _StatusChangesEliminatedText
	text_end

ImmuneToPsychicText:
	text_far _ImmuneToPsychicText
	text_end

