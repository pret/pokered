DEF DATA_SIZE EQU (NUM_POKEMON + 7) / 8

; this function temporarily makes the starters (and Ivysaur) owned
; so that the full Pokedex information gets displayed in Oak's lab
StarterDex:
    ld hl, wPokedexOwned
    ld b, DATA_SIZE ; pokedex data length
    ld a, $ff ; $ff functions to set pokedex the data to fully completed
.markAsOwned
    ld [hli], a
    dec b
    jr nz, .markAsOwned
	predef ShowPokedexData
    ld hl, wPokedexOwned
    ld b, DATA_SIZE ; pokedex data length
    xor a ; 0, functions to set pokedex the data back to blank
.clearOwned
    ld [hli], a
    dec b
    jr nz, .clearOwned
	ret

PURGE DATA_SIZE