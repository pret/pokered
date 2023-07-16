; display "[player] VS [enemy]" text box with pokeballs representing their parties next to the names
DisplayLinkBattleVersusTextBox:
	call LoadTextBoxTilePatterns
	hlcoord 3, 4
	ld b, 7
	ld c, 12
	call TextBoxBorder
	hlcoord 4, 5
	ld de, wPlayerName
	call PlaceString
	hlcoord 4, 10
	ld de, wLinkEnemyTrainerName
	call PlaceString
; place bold "VS" tiles between the names
	hlcoord 9, 8
	ld a, "<BOLD_V>"
	ld [hli], a
	ld [hl], "<BOLD_S>"
	xor a
	ld [wUpdateSpritesEnabled], a
	callfar SetupPlayerAndEnemyPokeballs
	ld c, 150
	jp DelayFrames
