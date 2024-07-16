; reloads text box tile patterns, current map view, and tileset tile patterns
ReloadMapData::
	ldh a, [hLoadedROMBank]
	push af
	ld a, [wCurMap]
	call SwitchToMapRomBank
	call DisableLCD
	call LoadTextBoxTilePatterns
	call LoadCurrentMapView
	call LoadTilesetTilePatternData
	call EnableLCD
	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

; reloads tileset tile patterns
ReloadTilesetTilePatterns::
	ldh a, [hLoadedROMBank]
	push af
	ld a, [wCurMap]
	call SwitchToMapRomBank
	call DisableLCD
	call LoadTilesetTilePatternData
	call EnableLCD
	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

; shows the town map and lets the player choose a destination to fly to
ChooseFlyDestination::
	ld hl, wStatusFlags4
	res BIT_NO_BATTLES, [hl]
	farjp LoadTownMap_Fly

; causes the text box to close without waiting for a button press after displaying text
DisableWaitingAfterTextDisplay::
	ld a, $01
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret
