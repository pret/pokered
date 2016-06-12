; this function temporarily makes the starters (and Ivysaur) seen
; so that the full Pokedex information gets displayed in Oak's lab
StarterDex:
	ld a, %01001011 ; set starter flags
	ld [wPokedexOwned], a
	predef ShowPokedexData
	xor a ; unset starter flags
	ld [wPokedexOwned], a
	ret
