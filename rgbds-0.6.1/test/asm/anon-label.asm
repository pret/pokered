
SECTION "Anonymous label test", ROM0[0]

	ld hl, :++
:	ld a, [hli]
	ldh [c], a
	dec c
	jr nz, :-
	ret

:
	dw $7FFF, $1061, $03E0, $58A5
