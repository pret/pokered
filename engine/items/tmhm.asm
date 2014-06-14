; checks if the mon in wWhichPokemon already knows the move in wd0e0
CheckIfMoveIsKnown: ; 2fe18 (b:7e18)
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Moves
	ld bc, $2c
	call AddNTimes
	ld a, [wd0e0]
	ld b, a
	ld c, $4 ; nubmer of moves
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

AlreadyKnowsText: ; 2fe3b (b:7e3b)
	TX_FAR _AlreadyKnowsText
	db "@"
