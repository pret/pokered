; checks if the mon in [wWhichPokemon] already knows the move in [wMoveNum]
CheckIfMoveIsKnown:
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [wMoveNum]
	ld b, a
	ld c, NUM_MOVES
.loop
	ld a, [hli]
	cp b
	jr z, .alreadyKnown ; found a match
	dec c
	jr nz, .loop
	and a
	ret
.alreadyKnown
	ld hl, AlreadyKnowsText
	call PrintText
	scf
	ret

AlreadyKnowsText:
	text_far _AlreadyKnowsText
	text_end
