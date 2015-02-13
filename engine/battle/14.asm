InitBattleVariables: ; 525af (14:65af)
	ld a, [hTilesetType]
	ld [wd0d4], a
	xor a
	ld [wcd6a], a
	ld [wBattleResult], a
	ld hl, wcc2b
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [wListScrollOffset], a
	ld [wCriticalHitOrOHKO], a
	ld [wBattleMonSpecies], a
	ld [wPartyGainExpFlags], a
	ld [wPlayerMonNumber], a 
	ld [wEscapedFromBattle], a
	ld [wMapPalOffset], a
	ld hl, wcf1d
	ld [hli], a
	ld [hl], a
	ld hl, wccd3
	ld b, $3c
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	inc a
	ld [wccd9], a
	ld a, [W_CURMAP] 
	cp SAFARI_ZONE_EAST
	jr c, .notSafariBattle
	cp SAFARI_ZONE_REST_HOUSE_1
	jr nc, .notSafariBattle
	ld a, $2 ; safari battle
	ld [W_BATTLETYPE], a
.notSafariBattle
	ld hl, PlayBattleMusic
	ld b, BANK(PlayBattleMusic)
	jp Bankswitch

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
	ld hl, PrintMayNotAttackText
	ld b, BANK(PrintMayNotAttackText)
	jp Bankswitch
.didntAffect
	ld c, 50
	call DelayFrames
	ld hl, PrintDidntAffectText
	ld b, BANK(PrintDidntAffectText)
	jp Bankswitch
.doesntAffect
	ld c, 50
	call DelayFrames
	ld hl, PrintDoesntAffectText
	ld b, BANK(PrintDoesntAffectText)
	jp Bankswitch
