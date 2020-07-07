Random::
; Return a random number in a.
; For battles, use BattleRandom.
	push hl
	push de
	push bc
	farcall Random_
	ldh a, [hRandomAdd]
	pop bc
	pop de
	pop hl
	ret
