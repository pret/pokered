Func_372d6: ; 372d6 (d:72d6)
	call LoadTextBoxTilePatterns
	FuncCoord 3, 4
	ld hl, Coord
	ld b, $7
	ld c, $c
	call TextBoxBorder
	FuncCoord 4, 5
	ld hl, Coord
	ld de, wPlayerName ; wd158
	call PlaceString
	FuncCoord 4, 10
	ld hl, Coord
	ld de, W_GRASSRATE ; W_GRASSRATE
	call PlaceString
	FuncCoord 9, 8
	ld hl, Coord
	ld a, $69
	ld [hli], a
	ld [hl], $6a
	xor a
	ld [wcfcb], a
	callab SetupPlayerAndEnemyPokeballs
	ld c, $96
	jp DelayFrames
