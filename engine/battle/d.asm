Func_372d6: ; 372d6 (d:72d6)
	call LoadTextBoxTilePatterns
	FuncCoord 3, 4 ; $c3f3
	ld hl, Coord
	ld b, $7
	ld c, $c
	call TextBoxBorder
	FuncCoord 4, 5 ; $c408
	ld hl, Coord
	ld de, W_PLAYERNAME ; $d158
	call PlaceString
	FuncCoord 4, 10 ; $c46c
	ld hl, Coord
	ld de, W_GRASSRATE ; $d887
	call PlaceString
	FuncCoord 9, 8 ; $c449
	ld hl, Coord
	ld a, $69
	ld [hli], a
	ld [hl], $6a
	xor a
	ld [$cfcb], a
	callab SetupPlayerAndEnemyPokeballs
	ld c, $96
	jp DelayFrames
