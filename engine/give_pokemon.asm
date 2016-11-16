_GivePokemon:
; returns success in carry
; and whether the mon was added to the party in [wAddedToParty]
	call EnableAutoTextBoxDrawing
	xor a
	ld [wAddedToParty], a
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr c, .addToParty
	ld a, [wNumInBox]
	cp MONS_PER_BOX
	jr nc, .boxFull
; add to box
	xor a
	ld [wEnemyBattleStatus3], a
	ld a, [wcf91]
	ld [wEnemyMonSpecies2], a
	ld a, [wcf91 + 1]
	ld [wEnemyMonSpecies2 + 1], a
	callab LoadEnemyMonData
	call SetPokedexOwnedFlag
	callab SendNewMonToBox
	ld hl, wcf4b
	ld a, [wCurrentBoxNum]
	and $7f
	cp 9
	jr c, .singleDigitBoxNum
	sub 9
	ld [hl], "1"
	inc hl
	add "0"
	jr .next
.singleDigitBoxNum
	add "1"
.next
	ld [hli], a
	ld [hl], "@"
	ld hl, SetToBoxText
	call PrintText
	scf
	ret
.boxFull
	ld hl, BoxIsFullText
	call PrintText
	and a
	ret
.addToParty
	call SetPokedexOwnedFlag
	call AddPartyMon
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld [wAddedToParty], a
	scf
	ret

SetPokedexOwnedFlag:
	ld a, [wcf91]
	ld e, a
	ld a, [wcf91 + 1]
	ld d, a
	push de
	ld [wd11e + 1], a
	ld a, e
	ld [wd11e], a
	predef IndexToPokedex
	ld a, [wd11e]
	ld e, a
	ld a, [wd11e + 1]
	ld d, a
	dec de
	ld hl, wPokedexOwned
	call Set16BitFlag_Bank13
	pop de
	ld a, e
	ld [wd11e], a
	ld a, d
	ld [wd11e + 1], a
	call GetMonName
	ld hl, GotMonText
	jp PrintText

GotMonText:
	TX_FAR _GotMonText
	TX_SFX_ITEM_1
	db "@"

SetToBoxText:
	TX_FAR _SetToBoxText
	db "@"

BoxIsFullText:
	TX_FAR _BoxIsFullText
	db "@"

Set16BitFlag_Bank13:
; Input: de = flag index
;        hl = flag data
	ld bc, $20
	ld a, d
.hi
	and a
	jr z, .next
	add hl, bc
	dec a
	jr .hi
.next
	ld a, e
	srl a
	srl a
	srl a
	ld b, 0
	ld c, a
	add hl, bc
	ld a, e
	and a, %00000111
	cp 7
	jr nz, .check6
	set 7, [hl]
	ret
.check6
	cp 6
	jr nz, .check5
	set 6, [hl]
	ret
.check5
	cp 5
	jr nz, .check4
	set 5, [hl]
	ret
.check4
	cp 4
	jr nz, .check3
	set 3, [hl]
	ret
.check3
	cp 3
	jr nz, .check2
	set 3, [hl]
	ret
.check2
	cp 2
	jr nz, .check1
	set 2, [hl]
	ret
.check1
	cp 1
	jr nz, .zero
	set 1, [hl]
	ret
.zero
	set 0, [hl]
	ret
