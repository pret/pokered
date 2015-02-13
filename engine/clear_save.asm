DoClearSaveDialogue: ; 1c98a (7:498a)
	call ClearScreen
	call GoPAL_SET_CF1C
	call LoadFontTilePatterns
	call LoadTextBoxTilePatterns
	ld hl, ClearSaveDataText
	call PrintText
	hlCoord 14, 7
	ld bc, $80f
	ld a, NO_YES_MENU
	ld [wTwoOptionMenuID], a
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld a, [wCurrentMenuItem]
	and a
	jp z, Init
	callba ClearSAV
	jp Init

ClearSaveDataText: ; 1c9c1 (7:49c1)
	TX_FAR _ClearSaveDataText
	db "@"
