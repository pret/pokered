; Loads tile patterns for tiles used in the pokedex.
LoadPokedexTilePatterns: ; 17840 (5:7840)
	call LoadHpBarAndStatusTilePatterns
	ld de,PokedexTileGraphics
	ld hl,vChars2 + $600
	lb bc, BANK(PokedexTileGraphics), $12
	call CopyVideoData
	ld de,PokeballTileGraphics
	ld hl,vChars2 + $720
	lb bc, BANK(PokeballTileGraphics), $01
	jp CopyVideoData ; load pokeball tile for marking caught mons
