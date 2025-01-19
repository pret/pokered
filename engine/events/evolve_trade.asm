CheckEvolveTradeMonName: ; unused
; This routine is a leftover from Japanese Blue
; and development builds of English Red and Blue.
	ld a, [wInGameTradeReceiveMonName]
	cp "G" ; GRAVELER
	jr z, .ok
	cp "S" ; "SPECTRE" (HAUNTER)
	ret nz
	ld a, [wInGameTradeReceiveMonName + 1]
	cp "P" ; "SPECTRE" (HAUNTER)
	ret nz
.ok
	ld a, [wPartyCount]
	dec a
	ld [wWhichPokemon], a
	ld a, 1
	ld [wForceEvolution], a
	ld a, LINK_STATE_TRADING
	ld [wLinkState], a
	callfar TryEvolvingMon
	xor a ; LINK_STATE_NONE
	ld [wLinkState], a
	jp PlayDefaultMusic
