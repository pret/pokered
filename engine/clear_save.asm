Func_1c98a: ; 1c98a (7:498a)
	call ClearScreen
	call GoPAL_SET_CF1C
	call LoadFontTilePatterns
	call LoadTextBoxTilePatterns
	ld hl, ClearSaveDataText
	call PrintText
	hlCoord 14, 7
	ld bc, $80f
	ld a, $7
	ld [wd12c], a
	ld a, $14
	ld [wd125], a
	call DisplayTextBoxID
	ld a, [wCurrentMenuItem] ; wCurrentMenuItem
	and a
	jp z, Init
	callba Func_73b6a
	jp Init

ClearSaveDataText: ; 1c9c1 (7:49c1)
	TX_FAR _ClearSaveDataText
	db "@"
