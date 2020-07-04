; this function is used to display sign messages, sprite dialog, etc.
; INPUT: [hSpriteIndexOrTextID] = sprite ID or text ID
DisplayTextID::
	ld a, [hLoadedROMBank]
	push af
	callba DisplayTextIDInit ; initialization
	ld hl, wTextPredefFlag
	bit 0, [hl]
	res 0, [hl]
	jr nz, .skipSwitchToMapBank
	ld a, [wCurMap]
	call SwitchToMapRomBank
.skipSwitchToMapBank
	ld a, 30 ; half a second
	ld [hFrameCounter], a ; used as joypad poll timer
	ld hl, wMapTextPtr
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl = map text pointer
	ld d, $00
	ld a, [hSpriteIndexOrTextID] ; text ID
	ld [wSpriteIndex], a
	and a
	jp z, DisplayStartMenu
	cp TEXT_SAFARI_GAME_OVER
	jp z, DisplaySafariGameOverText
	cp TEXT_MON_FAINTED
	jp z, DisplayPokemonFaintedText
	cp TEXT_BLACKED_OUT
	jp z, DisplayPlayerBlackedOutText
	cp TEXT_REPEL_WORE_OFF
	jp z, DisplayRepelWoreOffText
	ld a, [wNumSprites]
	ld e, a
	ld a, [hSpriteIndexOrTextID] ; sprite ID
	cp e
	jr z, .spriteHandling
	jr nc, .skipSpriteHandling
.spriteHandling
; get the text ID of the sprite
	push hl
	push de
	push bc
	callba UpdateSpriteFacingOffsetAndDelayMovement ; update the graphics of the sprite the player is talking to (to face the right direction)
	pop bc
	pop de
	ld hl, wMapSpriteData ; NPC text entries
	ld a, [hSpriteIndexOrTextID]
	dec a
	add a
	add l
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	inc hl
	ld a, [hl] ; a = text ID of the sprite
	pop hl
.skipSpriteHandling
; look up the address of the text in the map's text entries
	dec a
	ld e, a
	sla e
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl = address of the text
	ld a, [hl] ; a = first byte of text
; check first byte of text for special cases
	cp $fe   ; Pokemart NPC
	jp z, DisplayPokemartDialogue
	cp $ff   ; Pokemon Center NPC
	jp z, DisplayPokemonCenterDialogue
	cp $fc   ; Item Storage PC
	jp z, FuncTX_ItemStoragePC
	cp $fd   ; Bill's PC
	jp z, FuncTX_BillsPC
	cp $f9   ; Pokemon Center PC
	jp z, FuncTX_PokemonCenterPC
	cp $f5   ; Vending Machine
	jr nz, .notVendingMachine
	callba VendingMachineMenu ; jump banks to vending machine routine
	jr AfterDisplayingTextID
.notVendingMachine
	cp $f7   ; prize menu
	jp z, FuncTX_GameCornerPrizeMenu
	cp $f6   ; cable connection NPC in Pokemon Center
	jr nz, .notSpecialCase
	callab CableClubNPC
	jr AfterDisplayingTextID
.notSpecialCase
	call PrintText_NoCreatingTextBox ; display the text
	ld a, [wDoNotWaitForButtonPressAfterDisplayingText]
	and a
	jr nz, HoldTextDisplayOpen

AfterDisplayingTextID::
	ld a, [wEnteringCableClub]
	and a
	jr nz, HoldTextDisplayOpen
	call WaitForTextScrollButtonPress ; wait for a button press after displaying all the text

; loop to hold the dialogue box open as long as the player keeps holding down the A button
HoldTextDisplayOpen::
	call Joypad
	ld a, [hJoyHeld]
	bit 0, a ; is the A button being pressed?
	jr nz, HoldTextDisplayOpen

CloseTextDisplay::
	ld a, [wCurMap]
	call SwitchToMapRomBank
	ld a, $90
	ld [hWY], a ; move the window off the screen
	call DelayFrame
	call LoadGBPal
	xor a
	ld [hAutoBGTransferEnabled], a ; disable continuous WRAM to VRAM transfer each V-blank
; loop to make sprites face the directions they originally faced before the dialogue
	ld hl, wSpriteStateData2 + $19
	ld c, $0f
	ld de, $10
.restoreSpriteFacingDirectionLoop
	ld a, [hl]
	dec h
	ld [hl], a
	inc h
	add hl, de
	dec c
	jr nz, .restoreSpriteFacingDirectionLoop
	ld a, BANK(InitMapSprites)
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call InitMapSprites ; reload sprite tile pattern data (since it was partially overwritten by text tile patterns)
	ld hl, wFontLoaded
	res 0, [hl]
	ld a, [wd732]
	bit 3, a ; used fly warp
	call z, LoadPlayerSpriteGraphics
	call LoadCurrentMapView
	pop af
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	jp UpdateSprites

DisplayPokemartDialogue::
	push hl
	ld hl, PokemartGreetingText
	call PrintText
	pop hl
	inc hl
	call LoadItemList
	ld a, PRICEDITEMLISTMENU
	ld [wListMenuID], a
	ld a, [hLoadedROMBank]
	push af
	ld a, BANK(DisplayPokemartDialogue_)
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call DisplayPokemartDialogue_
	pop af
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	jp AfterDisplayingTextID

PokemartGreetingText::
	TX_FAR _PokemartGreetingText
	db "@"

LoadItemList::
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	ld a, h
	ld [wItemListPointer], a
	ld a, l
	ld [wItemListPointer + 1], a
	ld de, wItemList
.loop
	ld a, [hli]
	ld [de], a
	inc de
	cp $ff
	jr nz, .loop
	ret

DisplayPokemonCenterDialogue::
; zeroing these doesn't appear to serve any purpose
	xor a
	ld [hItemPrice], a
	ld [hItemPrice + 1], a
	ld [hItemPrice + 2], a

	inc hl
	ld a, [hLoadedROMBank]
	push af
	ld a, BANK(DisplayPokemonCenterDialogue_)
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call DisplayPokemonCenterDialogue_
	pop af
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	jp AfterDisplayingTextID

DisplaySafariGameOverText::
	callab PrintSafariGameOverText
	jp AfterDisplayingTextID

DisplayPokemonFaintedText::
	ld hl, PokemonFaintedText
	call PrintText
	jp AfterDisplayingTextID

PokemonFaintedText::
	TX_FAR _PokemonFaintedText
	db "@"

DisplayPlayerBlackedOutText::
	ld hl, PlayerBlackedOutText
	call PrintText
	ld a, [wd732]
	res 5, a ; reset forced to use bike bit
	ld [wd732], a
	jp HoldTextDisplayOpen

PlayerBlackedOutText::
	TX_FAR _PlayerBlackedOutText
	db "@"

DisplayRepelWoreOffText::
	ld hl, RepelWoreOffText
	call PrintText
	jp AfterDisplayingTextID

RepelWoreOffText::
	TX_FAR _RepelWoreOffText
	db "@"
