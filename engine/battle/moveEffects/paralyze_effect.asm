ParalyzeEffect_: ; 52601 (14:6601)
	ld hl, wEnemyMonStatus
	ld de, W_PLAYERMOVETYPE
	ld a, [H_WHOSETURN]
	and a
	jp z, .next
	ld hl, wBattleMonStatus
	ld de, W_ENEMYMOVETYPE
.next
	ld a, [hl]
	and a ; does the target already have a status ailment?
	jr nz, .didntAffect
; check if the target is immune due to types
	ld a, [de]
	cp ELECTRIC
	jr nz, .hitTest
	ld b, h
	ld c, l
	inc bc
	ld a, [bc]
	cp GROUND
	jr z, .doesntAffect
	inc bc
	ld a, [bc]
	cp GROUND
	jr z, .doesntAffect
.hitTest
	push hl
	callab MoveHitTest
	pop hl
	ld a, [W_MOVEMISSED]
	and a
	jr nz, .didntAffect
	set PAR, [hl]
	callab QuarterSpeedDueToParalysis
	ld c, 30
	call DelayFrames
	callab PlayCurrentMoveAnimation
	jpab PrintMayNotAttackText
.didntAffect
	ld c, 50
	call DelayFrames
	jpab PrintDidntAffectText
.doesntAffect
	ld c, 50
	call DelayFrames
	jpab PrintDoesntAffectText
