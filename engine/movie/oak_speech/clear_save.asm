DoClearSaveDialogue:
	call ClearScreen
	call RunDefaultPaletteCommand
	call LoadFontTilePatterns
	call LoadTextBoxTilePatterns
	ld hl, ClearSaveDataText
	call PrintText
IF DEF(_ENGLISH)
	hlcoord 14, 7
	lb bc, 8, 15
ENDC
IF DEF(_GERMAN)
	hlcoord 13, 7
	lb bc, 8, 14
ENDC
	ld a, NO_YES_MENU
	ld [wTwoOptionMenuID], a
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld a, [wCurrentMenuItem]
	and a
	jp z, Init
	farcall ClearSAV
	jp Init

ClearSaveDataText:
	text_far _ClearSaveDataText
	text_end
