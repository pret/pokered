; Loads tile patterns for tiles used in the pokedex.
LoadPokedexTilePatterns: ; 17840 (5:7840)
	call LoadHpBarAndStatusTilePatterns
	ld de,PokedexTileGraphics
	ld hl,vChars2 + $600
	ld bc,(BANK(PokedexTileGraphics) << 8) + $12
	call CopyVideoData
	ld de,PokeballTileGraphics
	ld hl,vChars2 + $720
	ld bc,(BANK(PokeballTileGraphics) << 8) + $01
	jp CopyVideoData ; load pokeball tile for marking caught mons
