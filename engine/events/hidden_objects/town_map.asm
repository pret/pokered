TownMapText::
	text_far _TownMapText
	text_promptbutton
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, wScriptEngineFlags3
	set SCRIPT_ENGINE3_PRINT_TEXT_NO_DELAY_F, [hl]
	call GBPalWhiteOutWithDelay3
	xor a
	ldh [hWY], a
	inc a
	ldh [hAutoBGTransferEnabled], a
	call LoadFontTilePatterns
	farcall DisplayTownMap
	ld hl, wScriptEngineFlags3
	res SCRIPT_ENGINE3_PRINT_TEXT_NO_DELAY_F, [hl]
	ld de, TextScriptEnd
	push de
	ldh a, [hLoadedROMBank]
	push af
	jp CloseTextDisplay
