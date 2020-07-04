TownMapText::
	text_far _TownMapText
	text_promptbutton
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, wd730
	set 6, [hl]
	call GBPalWhiteOutWithDelay3
	xor a
	ld [hWY], a
	inc a
	ld [hAutoBGTransferEnabled], a
	call LoadFontTilePatterns
	callba DisplayTownMap
	ld hl, wd730
	res 6, [hl]
	ld de, TextScriptEnd
	push de
	ld a, [hLoadedROMBank]
	push af
	jp CloseTextDisplay
