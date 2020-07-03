BookOrSculptureText::
	TX_ASM
	ld hl, PokemonBooksText
	ld a, [wCurMapTileset]
	cp MANSION ; Celadon Mansion tileset
	jr nz, .ok
	aCoord 8, 6
	cp $38
	jr nz, .ok
	ld hl, DiglettSculptureText
.ok
	call PrintText
	jp TextScriptEnd

PokemonBooksText:
	TX_FAR _PokemonBooksText
	db "@"

DiglettSculptureText:
	TX_FAR _DiglettSculptureText
	db "@"
