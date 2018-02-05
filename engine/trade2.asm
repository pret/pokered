Trade_PrintPlayerMonInfoText:
	coord hl, 5, 0
	ld de, Trade_MonInfoText
	call PlaceString
	ld a, [wTradedPlayerMonSpecies]
	ld [wd11e], a
	predef IndexToPokedex
	coord hl, 9, 0
	ld de, wd11e
	lb bc, LEADING_ZEROES | 1, 3
	call PrintNumber
	coord hl, 5, 2
	ld de, wcf4b
	call PlaceString
	coord hl, 8, 4
	ld de, wTradedPlayerMonOT
	call PlaceString
	coord hl, 8, 6
	ld de, wTradedPlayerMonOTID
	lb bc, LEADING_ZEROES | 2, 5
	jp PrintNumber

Trade_PrintEnemyMonInfoText:
	coord hl, 5, 10
	ld de, Trade_MonInfoText
	call PlaceString
	ld a, [wTradedEnemyMonSpecies]
	ld [wd11e], a
	predef IndexToPokedex
	coord hl, 9, 10
	ld de, wd11e
	lb bc, LEADING_ZEROES | 1, 3
	call PrintNumber
	coord hl, 5, 12
	ld de, wcd6d
	call PlaceString
	coord hl, 8, 14
	ld de, wTradedEnemyMonOT
	call PlaceString
	coord hl, 8, 16
	ld de, wTradedEnemyMonOTID
	lb bc, LEADING_ZEROES | 2, 5
	jp PrintNumber

Trade_MonInfoText:
	db "──№⠄",$4E
	next "OT/"
	next $73,"№⠄","@"
