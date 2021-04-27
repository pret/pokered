_RemovePokemon::
	ld hl, wPartyCount
	ld a, [wRemoveMonFromBox]
	and a
	jr z, .usePartyCount
	ld hl, wBoxCount
.usePartyCount
	ld a, [hl]
	dec a
	ld [hli], a
	ld a, [wWhichPokemon]
	ld c, a
	ld b, $0
	add hl, bc
	ld e, l
	ld d, h
	inc de
.shiftMonSpeciesLoop
	ld a, [de]
	inc de
	ld [hli], a
	inc a ; reached terminator?
	jr nz, .shiftMonSpeciesLoop ; if not, continue shifting species
	ld hl, wPartyMonOT
	ld d, PARTY_LENGTH - 1 ; max number of pokemon to shift
	ld a, [wRemoveMonFromBox]
	and a
	jr z, .usePartyMonOTs
	ld hl, wBoxMonOT
	ld d, MONS_PER_BOX - 1
.usePartyMonOTs
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
	ld a, [wWhichPokemon]
	cp d ; are we removing the last pokemon?
	jr nz, .notRemovingLastMon ; if not, shift the pokemon below
	ld [hl], $ff ; else, write the terminator and return
	ret
.notRemovingLastMon
	ld d, h
	ld e, l
	ld bc, NAME_LENGTH
	add hl, bc
	ld bc, wPartyMonNicks
	ld a, [wRemoveMonFromBox]
	and a
	jr z, .usePartyMonNicks
	ld bc, wBoxMonNicks
.usePartyMonNicks
	call CopyDataUntil
	ld hl, wPartyMons
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wRemoveMonFromBox]
	and a
	jr z, .usePartyMonStructs
	ld hl, wBoxMons
	ld bc, wBoxMon2 - wBoxMon1
.usePartyMonStructs
	ld a, [wWhichPokemon]
	call AddNTimes ; get address of the pokemon removed
	ld d, h ; store in de for CopyDataUntil
	ld e, l
	ld a, [wRemoveMonFromBox]
	and a
	jr z, .copyUntilPartyMonOTs
	ld bc, wBoxMon2 - wBoxMon1
	add hl, bc ; get address of pokemon after the pokemon removed
	ld bc, wBoxMonOT ; address of when to stop copying
	jr .continue
.copyUntilPartyMonOTs
	ld bc, wPartyMon2 - wPartyMon1
	add hl, bc ; get address of pokemon after the pokemon removed
	ld bc, wPartyMonOT ; address of when to stop copying
.continue
	call CopyDataUntil ; shift all pokemon data after the removed mon to the removed mon's location
	ld hl, wPartyMonNicks
	ld a, [wRemoveMonFromBox]
	and a
	jr z, .usePartyMonNicks2
	ld hl, wBoxMonNicks
.usePartyMonNicks2
	ld bc, NAME_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes
	ld d, h
	ld e, l
	ld bc, NAME_LENGTH
	add hl, bc
	ld bc, wPartyMonNicksEnd
	ld a, [wRemoveMonFromBox]
	and a
	jr z, .copyUntilPartyMonNicksEnd
	ld bc, wBoxMonNicksEnd
.copyUntilPartyMonNicksEnd
	jp CopyDataUntil
