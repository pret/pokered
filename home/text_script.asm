; this function is used to display sign messages, sprite dialog, etc.
; INPUT: [hSpriteIndex] = sprite ID or [hTextID] = text ID
DisplayTextID::
	ASSERT hSpriteIndex == hTextID ; these are at the same memory location
	ldh a, [hLoadedROMBank]
	push af
	farcall DisplayTextIDInit ; initialization
	ld hl, wTextPredefFlag
	bit BIT_TEXT_PREDEF, [hl]
	res BIT_TEXT_PREDEF, [hl]
	jr nz, .skipSwitchToMapBank
	ld a, [wCurMap]
	call SwitchToMapRomBank
.skipSwitchToMapBank
	ld a, 30 ; half a second
	ldh [hFrameCounter], a ; used as joypad poll timer
	ld hl, wCurMapTextPtr
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl = map text pointer
	ld d, $00
	ldh a, [hTextID]
	ld [wSpriteIndex], a

	dict TEXT_START_MENU,       DisplayStartMenu
	dict TEXT_SAFARI_GAME_OVER, DisplaySafariGameOverText
	dict TEXT_MON_FAINTED,      DisplayPokemonFaintedText
	dict TEXT_BLACKED_OUT,      DisplayPlayerBlackedOutText
	dict TEXT_REPEL_WORE_OFF,   DisplayRepelWoreOffText
	dict TEXT_RANGER_SAFARI_GAME_OVER, DisplayRangerSafariGameOverText ; PureRGBnote: ADDED: text that displays when ranger hunt is completed
	
	cp $FF
	jp z, CloseTextDisplay

	ld a, [wNumSprites]
	ld e, a
	ldh a, [hSpriteIndex] ; sprite ID
	cp e
	jr z, .spriteHandling
	jr nc, .skipSpriteHandling
.spriteHandling
; get the text ID of the sprite
	push hl
	push de
	push bc
	farcall UpdateSpriteFacingOffsetAndDelayMovement ; update the graphics of the sprite the player is talking to (to face the right direction)
	pop bc
	pop de
	ld hl, wMapSpriteData ; NPC text entries
	ldh a, [hSpriteIndex]
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

MACRO dict2
	cp \1
	jr nz, .not\@
	\2
	jr AfterDisplayingTextID
.not\@
ENDM

	dict  TX_SCRIPT_MART,                    DisplayPokemartDialogue
	dict  TX_SCRIPT_POKECENTER_NURSE,        DisplayPokemonCenterDialogue
	dict  TX_SCRIPT_PLAYERS_PC,              TextScript_ItemStoragePC
	dict  TX_SCRIPT_BILLS_PC,                TextScript_BillsPC
	dict  TX_SCRIPT_POKECENTER_PC,           TextScript_PokemonCenterPC
	dict2 TX_SCRIPT_VENDING_MACHINE,         farcall VendingMachineMenu
	dict  TX_SCRIPT_PRIZE_VENDOR,            TextScript_GameCornerPrizeMenu
	dict2 TX_SCRIPT_CABLE_CLUB_RECEPTIONIST, callfar CableClubNPC

	call PrintText_NoCreatingTextBox ; display the text
	ld a, [wDoNotWaitForButtonPressAfterDisplayingText]
	and a
	jr nz, HoldTextDisplayOpen

AfterDisplayingTextID::
	ld a, [wEnteringCableClub]
	and a
	call z, WaitForTextScrollButtonPress ; wait for a button press after displaying all the text
	; fall through

; loop to hold the dialogue box open as long as the player keeps holding down the A button
HoldTextDisplayOpen::
	call Joypad
	ldh a, [hJoyHeld]
	bit BIT_A_BUTTON, a
	jr nz, HoldTextDisplayOpen

; FIXME: this unintentionally gets run after HoldTextDisplayOpen...but that may be a good thing since resetting sprite facings seems pointless.
CloseTextDisplayNoSpriteUpdate:: ; PureRGBnote: ADDED: less laggy version of closing the text display that doesn't reset sprite facings
	call CloseTextDisplayPart1
	jp CloseTextDisplayPart2

CloseTextDisplay::
	call CloseTextDisplayPart1
	call CloseTextDisplaySpriteUpdateLoop
	jp CloseTextDisplayPart2

CloseTextDisplayPart1:
	ld a, [wCurMap]
	call SwitchToMapRomBank
	ld a, $90
	ldh [hWY], a ; move the window off the screen
	rst _DelayFrame
	call LoadGBPal
	xor a
	ldh [hAutoBGTransferEnabled], a ; disable continuous WRAM to VRAM transfer each V-blank
	ret

CloseTextDisplaySpriteUpdateLoop:
; loop to make sprites face the directions they originally faced before the dialogue
	ld hl, wSprite01StateData2OrigFacingDirection
	ld c, $0f
	ld de, $10
.restoreSpriteFacingDirectionLoop
	ld a, [hl] ; x#SPRITESTATEDATA2_ORIGFACINGDIRECTION
	dec h
	ld [hl], a ; [x#SPRITESTATEDATA1_FACINGDIRECTION]
	inc h
	add hl, de
	dec c
	jr nz, .restoreSpriteFacingDirectionLoop
	ret

CloseTextDisplayPart2:
	ld a, BANK(InitMapSprites)
	call SetCurBank
	call InitMapSprites ; reload sprite tile pattern data (since it was partially overwritten by text tile patterns)
	ld hl, wFontLoaded
	res BIT_FONT_LOADED, [hl]
	ld a, [wStatusFlags6]
	bit BIT_FLY_WARP, a
	call z, LoadPlayerSpriteGraphics
	call LoadCurrentMapView
	pop af
	call SetCurBank
	jp UpdateSprites

DisplayPokemartDialogue::
	push hl
	ld hl, PokemartGreetingText
	rst _PrintText
	pop hl
	call DisplayPokemartNoGreeting
	jp AfterDisplayingTextID

DisplayPokemartNoGreeting:: ; PureRGBnote: ADDED: show pokemart without the "welcome!" dialogue first, allows vendors to say something else beforehand.
	inc hl
	call LoadItemList
	ld a, PRICEDITEMLISTMENU
	ld [wListMenuID], a
	homecall DisplayPokemartDialogue_
	ret

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
	ldh [hItemPrice], a
	ldh [hItemPrice + 1], a
	ldh [hItemPrice + 2], a

	inc hl
	homecall DisplayPokemonCenterDialogue_
	jp AfterDisplayingTextID

DisplaySafariGameOverText::
	callfar PrintSafariGameOverText
	jp AfterDisplayingTextID

DisplayRangerSafariGameOverText::
	callfar PrintRangerSafariGameOverText
	jp AfterDisplayingTextID

DisplayPokemonFaintedText::
	ld hl, PokemonFaintedText
	rst _PrintText
	jp AfterDisplayingTextID

DisplayPlayerBlackedOutText::
	ld hl, PlayerBlackedOutText
	rst _PrintText
	ld hl, wStatusFlags6
	res BIT_ALWAYS_ON_BIKE, [hl] ; reset forced to use bike bit
	jp HoldTextDisplayOpen

DisplayRepelWoreOffText::
	ld hl, RepelWoreOffText
	rst _PrintText
	callfar UseAnotherRepel ; PureRGBnote: ADDED: when repel wears off ask to use another if available
	jp CloseTextDisplay
	
DisplayTextPromptButton::
	ld hl, TextScriptPromptButton
	jp TextCommandProcessor
