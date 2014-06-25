Func_372d6: ; 372d6 (d:72d6)
	call LoadTextBoxTilePatterns
	hlCoord 3, 4
	ld b, $7
	ld c, $c
	call TextBoxBorder
	hlCoord 4, 5
	ld de, wPlayerName ; wd158
	call PlaceString
	hlCoord 4, 10
	ld de, W_GRASSRATE ; W_GRASSRATE
	call PlaceString
	hlCoord 9, 8
	ld a, $69
	ld [hli], a
	ld [hl], $6a
	xor a
	ld [wcfcb], a
	callab SetupPlayerAndEnemyPokeballs
	ld c, $96
	jp DelayFrames
