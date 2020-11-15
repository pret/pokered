Trade_PrintPlayerMonInfoText:
	hlcoord 5, 0
	ld de, Trade_MonInfoText
	call PlaceString
	ld a, [wTradedPlayerMonSpecies]
	ld [wd11e], a
	predef IndexToPokedex
	hlcoord 9, 0
	ld de, wd11e
	lb bc, LEADING_ZEROES | 1, 3
	call PrintNumber
	hlcoord 5, 2
	ld de, wcf4b
	call PlaceString
	hlcoord 8, 4
	ld de, wTradedPlayerMonOT
	call PlaceString
	hlcoord 8, 6
	ld de, wTradedPlayerMonOTID
	lb bc, LEADING_ZEROES | 2, 5
	jp PrintNumber

Trade_PrintEnemyMonInfoText:
	hlcoord 5, 10
	ld de, Trade_MonInfoText
	call PlaceString
	ld a, [wTradedEnemyMonSpecies]
	ld [wd11e], a
	predef IndexToPokedex
	hlcoord 9, 10
	ld de, wd11e
	lb bc, LEADING_ZEROES | 1, 3
	call PrintNumber
	hlcoord 5, 12
	ld de, wcd6d
	call PlaceString
	hlcoord 8, 14
	ld de, wTradedEnemyMonOT
	call PlaceString
	hlcoord 8, 16
	ld de, wTradedEnemyMonOTID
	lb bc, LEADING_ZEROES | 2, 5
	jp PrintNumber

Trade_MonInfoText:
	db   "──№<DOT>"
	next ""
	next "OT/"
	next "<ID>№<DOT>@"
