Func_1c9c6: ; 1c9c6 (7:49c6)
	ld hl, WhichFloorText
	call PrintText
	ld hl, $cf7b
	ld a, l
	ld [$cf8b], a
	ld a, h
	ld [$cf8c], a
	ld a, [wListScrollOffset] ; $cc36
	push af
	xor a
	ld [wCurrentMenuItem], a ; $cc26
	ld [wListScrollOffset], a ; $cc36
	ld [$cf93], a
	ld a, $4
	ld [wListMenuID], a ; $cf94
	call DisplayListMenuID
	pop bc
	ld a, b
	ld [wListScrollOffset], a ; $cc36
	ret c
	ld hl, $d126
	set 7, [hl]
	ld hl, $cc5b
	ld a, [wWhichPokemon] ; $cf92
	add a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	ld hl, $d3af
	call Func_1ca0d

Func_1ca0d: ; 1ca0d (7:4a0d)
	inc hl
	inc hl
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ret

WhichFloorText: ; 1ca14 (7:4a14)
	TX_FAR _WhichFloorText
	db "@"
