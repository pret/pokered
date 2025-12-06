BurnEffect_:
	ld hl, wEnemyMonStatus
	ldh a, [hWhoseTurn]
	and a
	jp z, .next
	ld hl, wBattleMonStatus
.next
	ld a, [hl]
	and a
	jr nz, .didntAffect ; miss if target is already statused
; BTV
; type check, can't burn a FIRE target; ugly done, but whatever
	ldh a, [hWhoseTurn]
	and a
	jp z, .playersTurn
; opponent's turn
	ld a, [wBattleMonType1]
	cp FIRE
	jr z, .didntAffect
	ld a, [wBattleMonType2]
	cp FIRE
	jr z, .didntAffect
	jr .hitTest
.playersTurn
	ld a, [wEnemyMonType1]
	cp FIRE
	jr z, .didntAffect
	ld a, [wEnemyMonType2]
	cp FIRE
	jr z, .didntAffect
.hitTest
	push hl
	callfar MoveHitTest
	pop hl
	ld a, [wMoveMissed]
	and a
	jr nz, .didntAffect
	set BRN, [hl]
	callfar HalveAttackDueToBurn
	ld c, 3 ; edited, was 30
	call DelayFrames
	callfar PlayCurrentMoveAnimation
	ld hl, BurnedText2
	jp PrintText
.didntAffect
	ld c, 5 ; edited, was 50
	call DelayFrames
	jpfar PrintDidntAffectText
.doesntAffect
	ld c, 5 ; edited, was 50
	call DelayFrames
	jpfar PrintDoesntAffectText

BurnedText2:
	text_far _BurnedText
	text_end