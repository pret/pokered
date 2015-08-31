LeechSeedEffect_: ; 2bea9 (a:7ea9)
	callab MoveHitTest
	ld a, [wMoveMissed]
	and a
	jr nz, .moveMissed
	ld hl, wEnemyBattleStatus2
	ld de, wEnemyMonType1
	ld a, [H_WHOSETURN]
	and a
	jr z, .leechSeedEffect
	ld hl, wPlayerBattleStatus2
	ld de, wBattleMonType1
.leechSeedEffect
; miss if the target is grass-type or already seeded
	ld a, [de]
	cp GRASS
	jr z, .moveMissed
	inc de
	ld a, [de]
	cp GRASS
	jr z, .moveMissed
	bit Seeded, [hl]
	jr nz, .moveMissed
	set Seeded, [hl]
	callab PlayCurrentMoveAnimation
	ld hl, WasSeededText
	jp PrintText
.moveMissed
	ld c, 50
	call DelayFrames
	ld hl, EvadedAttackText
	jp PrintText

WasSeededText: ; 2bef2 (a:7ef2)
	TX_FAR _WasSeededText
	db "@"

EvadedAttackText: ; 2bef7 (a:7ef7)
	TX_FAR _EvadedAttackText
	db "@"
