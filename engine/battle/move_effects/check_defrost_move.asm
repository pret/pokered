;PureRGBnote: FIXED: check if the move the game thinks should be used after being defrosted is one of the battling pokemon's moves
; if the move was 0 or a move the pokemon didn't know, it won't do anything. 
; In the original game, it would use a move it didn't know, or if it was 0, it would use a glitch move.
CheckDefrostMove::
	ldh a, [hWhoseTurn]
	and a
	ld de, wPlayerSelectedMove
	ld hl, wBattleMonMoves
	jr nz, .opponent2
	ld de, wEnemySelectedMove
	ld hl, wEnemyMonMoves
.opponent2
	ld a, [de]
	and a
	jr z, .noMove
	cp $ff
	jr z, .noMove
	ld b, a
	ld c, NUM_MOVES + 1
.loop
	dec c
	jr z, .noMove
	ld a, [hli]
	and a
	jr z, .loop ; if the pokemon only has 1-3 moves the empty slots will be 0 so we need to avoid comparing them
	cp b
	ret z
	jr .loop
.noMove
	; we will default to no move being used if no moves match the move the game thinks should be used
	ld a, $ff
	ld [de], a
	ret

