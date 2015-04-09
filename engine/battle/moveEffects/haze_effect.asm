HazeEffect_: ; 139da (4:79da)
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
	ld [W_PLAYERDISABLEDMOVE], a
	ld [W_ENEMYDISABLEDMOVE], a
	ld hl, wPlayerDisabledMoveNumber
	ld [hli], a
	ld [hl], a
	ld hl, W_PLAYERBATTSTATUS1
	call CureVolatileStatuses
	ld hl, W_ENEMYBATTSTATUS1
	call CureVolatileStatuses
	ld hl, PlayCurrentMoveAnimation
	call CallBankF
	ld hl, StatusChangesEliminatedText
	jp PrintText

CureVolatileStatuses: ; 13a37 (4:7a37)
; only cures statuses of the Pokemon not using Haze
	res Confused, [hl]
	inc hl ; BATTSTATUS2
	ld a, [hl]
	; clear UsingXAccuracy, ProtectedByMist, GettingPumped, and Seeded statuses
	and $ff ^((1 << UsingXAccuracy) | (1 << ProtectedByMist) | (1 << GettingPumped) | (1 << Seeded)) 
	ld [hli], a ; BATTSTATUS3
	ld a, [hl]
	and %11110000 | (1 << Transformed) ; clear Bad Poison, Reflect and Light Screen statuses
	ld [hl], a
	ret

ResetStatMods: ; 13a43 (4:7a43)
	ld b, $8
.loop
	ld [hli], a 
	dec b
	jr nz, .loop
	ret

ResetStats: ; 13a4a (4:7a4a)
	ld b, $8
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	ret

StatusChangesEliminatedText: ; 13a53 (4:7a53)
	TX_FAR _StatusChangesEliminatedText
	db "@"
