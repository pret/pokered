; copy party pokemon's name to wcd6d
GetPartyMonName2:: ; 15b4 (0:15b4)
	ld a,[wWhichPokemon] ; index within party
	ld hl,wPartyMonNicks

; this is called more often
GetPartyMonName:: ; 15ba (0:15ba)
	push hl
	push bc
	call SkipFixedLengthTextEntries ; add 11 to hl, a times
	ld de,wcd6d
	push de
	ld bc,11
	call CopyData
	pop de
	pop bc
	pop hl
	ret