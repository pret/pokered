TownMapText::
	text_far _TownMapText
	text_promptbutton
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	call GBPalWhiteOutWithDelay3
	xor a
	ldh [hWY], a
	inc a
	ldh [hAutoBGTransferEnabled], a
	call LoadFontTilePatterns
	farcall DisplayTownMap
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	ld de, TextScriptEnd
	push de
	ldh a, [hLoadedROMBank]
	push af
	jp CloseTextDisplay
