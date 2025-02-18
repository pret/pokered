InGameTrade_CheckForTradeEvo:
; In Japanese Blue, TradeMons include a Graveler and a Haunter,
; both of which have Japanese names that start with "ゴ",
; which is what this routine originally checked in that game.
; For English Red and Blue, this routine was adjusted for
; Graveler's English name and Haunter's early English name "Spectre".
; The final release replaced Graveler and Haunter in TradeMons.
	ld a, [wInGameTradeReceiveMonName]
	cp "G" ; GRAVELER
	jr z, .nameMatched
	; "SPECTRE" (HAUNTER)
	cp "S"
	ret nz
	ld a, [wInGameTradeReceiveMonName + 1]
	cp "P"
	ret nz
.nameMatched
	ld a, [wPartyCount]
	dec a
	ld [wWhichPokemon], a
	ld a, TRUE
	ld [wForceEvolution], a
	ld a, LINK_STATE_TRADING
	ld [wLinkState], a
	callfar TryEvolvingMon
	xor a ; LINK_STATE_NONE
	ld [wLinkState], a
	jp PlayDefaultMusic
