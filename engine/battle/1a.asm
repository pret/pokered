DecrementPP: ; 68000 (1a:4000)
; after using a move, decrement pp in battle and (if not transformed?) in party
	ld a, [de]
	cp a, STRUGGLE
	ret z                ; if the pokemon is using "struggle", there's nothing to do
	                     ; we don't decrement PP for "struggle"
	ld hl, W_PLAYERBATTSTATUS1
	ld a, [hli]          ; load the W_PLAYERBATTSTATUS1 pokemon status flags and increment hl to load the
	                     ; W_PLAYERBATTSTATUS2 status flags later
	and a, 7             ; check to see if bits 0, 1, or 2 are set
	ret nz               ; if any of these statuses are true, don't decrement PP
	bit 6, [hl]          ; check 6th bit status flag on W_PLAYERBATTSTATUS2
	ret nz               ; and return if it is set
	ld hl, wBattleMonPP  ; PP of first move (in battle)
	call .DecrementPP

	ld a, [W_PLAYERBATTSTATUS3]        ; load pokemon status bits?
	bit 3, a             ; XXX transform status?
	ret nz               ; If it is, return.  Pokemon Red stores the "current pokemon's" PP
	                     ; separately from the "Pokemon in your party's" PP.  This is
	                     ; duplication -- in all cases *other* than Pokemon with Transform.
	                     ; Normally, this means we have to go on and make the same
	                     ; modification to the "party's pokemon" PP that we made to the
	                     ; "current pokemon's" PP.  But, if we're dealing with a Transformed
	                     ; Pokemon, it has separate PP for the move set that it copied from
	                     ; its opponent, which is *not* the same as its real PP as part of your
	                     ; party.  So we return, and don't do that part.

	ld hl, wPartyMon1PP         ; PP of first move (in party)
	ld a, [wPlayerMonNumber]        ; which mon in party is active
	ld bc, $2C           ; XXX probably size of party pokemon's data structure
	call AddNTimes       ; calculate address of the mon to modify
.DecrementPP
	ld a, [wPlayerMoveListIndex]        ; which move (0, 1, 2, 3) did we use?
	ld c, a
	ld b, 0
	add hl ,bc           ; calculate the address in memory of the PP we need to decrement
	                     ; based on the move chosen.
	dec [hl]             ; Decrement PP
	ret
