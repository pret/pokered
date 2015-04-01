HazeEffect_: ; 139da (4:79da)
	ld a, $7
	ld hl, wPlayerMonAttackMod
	call ResetStatMods
	ld hl, wEnemyMonAttackMod
	call ResetStatMods
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
	jr z, .asm_13a09
	ld hl, wBattleMonStatus
	dec de

.asm_13a09
	ld a, [hl]
	ld [hl], $0
	and $27
	jr z, .asm_13a13
	ld a, $ff
	ld [de], a

.asm_13a13
	xor a
	ld [W_PLAYERDISABLEDMOVE], a
	ld [W_ENEMYDISABLEDMOVE], a
	ld hl, wccee
	ld [hli], a
	ld [hl], a
	ld hl, W_PLAYERBATTSTATUS1
	call CureStatuses
	ld hl, W_ENEMYBATTSTATUS1
	call CureStatuses
	ld hl, PlayCurrentMoveAnimation
	call CallBankF
	ld hl, StatusChangesEliminatedText
	jp PrintText

CureStatuses: ; 13a37 (4:7a37)
	res Confused, [hl]
	inc hl ; BATTSTATUS2
	ld a, [hl]
	and (1 << UsingRage) | (1 << NeedsToRecharge) | (1 << HasSubstituteUp) | (1 << 3) ; clear all but these from BATTSTATUS2
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
