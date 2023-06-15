; this function temporarily makes the starters (and once Ivysaur) seen
; so that the full Pokedex information gets displayed in Oak's lab
StarterDex:
	ld a, 1 << (DEX_BULBASAUR - 1) | 1 << (DEX_CHARMANDER - 1) | 1 << (DEX_SQUIRTLE - 1) ;first byte of Pokédex flag array (values 0-7)
	ld [wPokedexOwned], a
	ld a, 1 << (DEX_PIKACHU - 9) | 1 << (DEX_EEVEE - 9) ;second byte of Pokédex flag array (values 8-15)
	ld [wPokedexOwned + 1], a
	predef ShowPokedexData
	xor a
	ld [wPokedexOwned], a
	ret
