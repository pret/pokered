; display "[player] VS [enemy]" text box with pokeballs representing their parties next to the names
DisplayLinkBattleVersusTextBox:
	call LoadTextBoxTilePatterns
	coord hl, 3, 4
	ld b, 7
	ld c, 12
	call TextBoxBorder
	coord hl, 4, 5
	ld de, wPlayerName
	call PlaceString
	coord hl, 4, 10
	ld de, wLinkEnemyTrainerName
	call PlaceString
; place bold "VS" tiles between the names
	coord hl, 9, 8
	ld a, $69
	ld [hli], a
	ld [hl], $6a
	xor a
	ld [wUpdateSpritesEnabled], a
	callab SetupPlayerAndEnemyPokeballs
	ld c, 150
	jp DelayFrames
