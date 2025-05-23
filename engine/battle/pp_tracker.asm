;shinpokerednote: ADDED: let's get some PP tracking for enemies both trainer and wild
ChooseMovePPTrack:
	;retrieve hl pointer
	hl_deref_reverse wPPTrackingPointer
	ld b, e	;retrieve move number
;b holds the move slot (1 to 4)

	call IsTrainerBattlePPCheck

	ld a, b
	dec a
	ld [wEnemyMoveListIndex], a
;is move disabled?
	ld a, [wEnemyDisabledMove]
	swap a
	and $f
	cp b
	jp z, .flagset
;is the move non-existant?
	ld a, [hl]
	and a
	jp z, .flagset
;now check the PP for the slot specified by "b"
	push hl
	ld hl, wEnemyMonPP
	push bc
	ld c, b
	ld b, 0
	dec bc
	add hl, bc
	pop bc
	ld a, [hl]
	and a
	jr z, .PPexhausted
.PPremaining
	;else decrement PP
	push hl
	ld hl, wOptions3
	bit BIT_NPC_PP, [hl]
	pop hl
	jr z, .noEnemyPP
	dec a
	ld [hl], a
.noEnemyPP
	ld a, 1
	ld e, a	;return nz flag if there was PP left
	push bc
	call transformPPtasks
	pop bc
	pop hl
	jp .back
.PPexhausted	;return zero flag if no PP left
	pop hl
.flagset	;d is holding flags for unusable moves
	ld e, 0
	ld a, b
	cp 4
	jr z, .move4
	cp 3
	jr z, .move3
	cp 2
	jr z, .move2
.move1
	set 0, d
	jr .back
.move2
	set 1, d
	jr .back
.move3
	set 2, d
	jr .back
.move4
	set 3, d
.back
	ld a, h
	ld [wPPTrackingPointer], a
	ld a, l
	ld [wPPTrackingPointer + 1], a
	ret

;this function will try to pick a trainer's preferred choice of move
;while also taking into account unusable moves
IsTrainerBattlePPCheck:
	ld a, [wIsInBattle]
	cp 2
	ret nz
;first, adjust the scores in the backup buffer so that unusable moves are maxed out (based on flags in d)
	push hl
	push de
	ld hl, wBuffer + NUM_MOVES
	ld e, NUM_MOVES
.loop
	rr d
	jr nc, .noLoad
	ld [hl], $ff
.noLoad
	inc hl
	dec e
	jr nz, .loop
	pop de
	pop hl
	
;now determine if the randomly chosen move is a preferred move that is usuable
	ld a, [hl]
	and a
	jr z, .next	;not preferred if zero; else check against backup score
	push hl
	push bc
	
	ld bc, NUM_MOVES
	add hl, bc
	pop bc
	ld a, [hl]
	pop hl
	cp $ff
	jr nz, .done	;the preferred move is not unuseable so we're good to go
.next	
;so the randomly picked move is either not preferred or is preferred but unusable
;in that case, pick the move with the lowest score moving towards the left and circling back if needed
	push hl
	push de
	push bc
	;move HL to the backup score buffer and set the loop counter
	push bc
	ld bc, NUM_MOVES
	add hl, bc
	pop bc
	ld c, NUM_MOVES	
	;initialize current score as best score
	ld a, [hl]
	ld e, a
	;initialize current move position as best move
	ld d, b
.loop2
	ld a, [hl]
	cp e
	call c, .updateBestScore
	dec hl
	dec b
	call z, .circleB
	dec c
	jr nz, .loop2
	pop bc
	ld b, d
	pop de
	pop hl
.done
	ld hl, wEnemyMonMoves
	push bc
	ld c, b
	ld b, 0
	dec bc
	add hl, bc
	pop bc
	ret
.updateBestScore
	ld e, a
	ld d, b
	ret
.circleB
	ld b, NUM_MOVES
	push bc
	ld bc, NUM_MOVES
	add hl, bc
	pop bc
	ret

;if trainer uses transform, then write transform PP to party struct
transformPPtasks:
	ld a, [wIsInBattle]
	cp 2
	ret nz

	ld c, b
	ld b, 0
	dec bc
	
	; return if not using transform
	ld hl, wEnemyMonMoves
	add hl, bc
	ld a, [hl]
	cp TRANSFORM
	ret nz

	; return if using Transform while already transformed into something
	ld a, [wEnemyBattleStatus3]
	bit TRANSFORMED, a
	ret nz
	
	ld hl, wEnemyMonPP
	add hl, bc
	ld a, [hl]
	push af
	
	ld hl, wEnemyMon1PP
	add hl, bc
	ld a, [wEnemyMonPartyPos]
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	
	pop af
	ld [hl], a
	ret

advancedLoadPP:
	ld a, [wIsInBattle]
	cp 2
	jr nz, .doRegular ; don't do anything special for wild battles, and gift pokemon (outside battle)
	;else see if the mon has been sent out before
	callfar CheckAISentOut
	jr z, .doRegular	;don't do anything special if the mon has not been out before

	;else load its PPs from the wEnemyMonxPP
	ld a, [wWhichPokemon]
	ld hl, wEnemyMon1PP
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	;HL now points to wEnemyMonxPP
	ld de, wEnemyMonPP
	ld bc, NUM_MOVES
	rst _CopyData	;copy the pp data from wEnemyMonxPP to wEnemyMonPP
	ret
.doRegular
	ld hl, wEnemyMonMoves
	ld de, wEnemyMonPP - 1
	predef_jump LoadMovePPs