; Loads tile patterns for tiles used in the pokedex.
LoadPokedexTilePatterns:
	call LoadHpBarAndStatusTilePatterns
	ld de, PokedexTileGraphics
	ld hl, vChars2 + $600
	lb bc, BANK(PokedexTileGraphics), (PokedexTileGraphicsEnd - PokedexTileGraphics) / $10
	call CopyVideoData
	ld de, PokeballTileGraphics
	ld hl, vChars2 + $720
	lb bc, BANK(PokeballTileGraphics), $01
	jp CopyVideoData ; load pokeball tile for marking caught mons
