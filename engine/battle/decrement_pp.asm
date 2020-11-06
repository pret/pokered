DecrementPP:
; after using a move, decrement pp in battle and (if not transformed?) in party
	ld a, [de]
	cp STRUGGLE
	ret z                ; if the pokemon is using "struggle", there's nothing to do
	                     ; we don't decrement PP for "struggle"
	ld hl, wPlayerBattleStatus1
	ld a, [hli]          ; load the wPlayerBattleStatus1 pokemon status flags and increment hl to load the
	                     ; wPlayerBattleStatus2 status flags later
	and (1 << STORING_ENERGY) | (1 << THRASHING_ABOUT) | (1 << ATTACKING_MULTIPLE_TIMES)
	ret nz               ; if any of these statuses are true, don't decrement PP
	bit USING_RAGE, [hl]
	ret nz               ; don't decrement PP either if Pokemon is using Rage
	ld hl, wBattleMonPP  ; PP of first move (in battle)

; decrement PP in the battle struct
	call .DecrementPP

; decrement PP in the party struct
	ld a, [wPlayerBattleStatus3]
	bit TRANSFORMED, a
	ret nz               ; Return if transformed. Pokemon Red stores the "current pokemon's" PP
	                     ; separately from the "Pokemon in your party's" PP.  This is
	                     ; duplication -- in all cases *other* than Pokemon with Transform.
	                     ; Normally, this means we have to go on and make the same
	                     ; modification to the "party's pokemon" PP that we made to the
	                     ; "current pokemon's" PP.  But, if we're dealing with a Transformed
	                     ; Pokemon, it has separate PP for the move set that it copied from
	                     ; its opponent, which is *not* the same as its real PP as part of your
	                     ; party.  So we return, and don't do that part.

	ld hl, wPartyMon1PP  ; PP of first move (in party)
	ld a, [wPlayerMonNumber] ; which mon in party is active
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes       ; calculate address of the mon to modify
.DecrementPP:
	ld a, [wPlayerMoveListIndex] ; which move (0, 1, 2, 3) did we use?
	ld c, a
	ld b, 0
	add hl, bc           ; calculate the address in memory of the PP we need to decrement
	                     ; based on the move chosen.
	dec [hl]             ; Decrement PP
	ret
