StartMenu_Pokedex::
	predef ShowPokedexMenu
	call LoadScreenTilesFromBuffer2 ; restore saved screen
	call Delay3
	call LoadGBPal
	call UpdateSprites
	jp RedisplayStartMenu

StartMenu_Pokemon::
	ld a, [wPartyCount]
	and a
	jp z, RedisplayStartMenu
	xor a
	ld [wMenuItemToSwap], a
	ld [wPartyMenuTypeOrMessageID], a
	ld [wUpdateSpritesEnabled], a
	call DisplayPartyMenu
	jr .checkIfPokemonChosen
.loop
	xor a
	ld [wMenuItemToSwap], a
	ld [wPartyMenuTypeOrMessageID], a
	call GoBackToPartyMenu
.checkIfPokemonChosen
	jr nc, .chosePokemon
.exitMenu
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	jp RedisplayStartMenu
.chosePokemon
	call SaveScreenTilesToBuffer1
	ld a, FIELD_MOVE_MON_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID ; display pokemon menu options
	ld hl, wFieldMoves
	lb bc, 2, 12 ; max menu item ID, top menu item Y
	ld e, 5
.adjustMenuVariablesLoop
	dec e
	jr z, .storeMenuVariables
	ld a, [hli]
	and a ; end of field moves?
	jr z, .storeMenuVariables
	inc b
	dec c
	dec c
	jr .adjustMenuVariablesLoop
.storeMenuVariables
	ld hl, wTopMenuItemY
	ld a, c
	ld [hli], a ; top menu item Y
	ldh a, [hFieldMoveMonMenuTopMenuItemX]
	ld [hli], a ; top menu item X
	xor a
	ld [hli], a ; current menu item ID
	inc hl
	ld a, b
	ld [hli], a ; max menu item ID
	ld a, A_BUTTON | B_BUTTON
	ld [hli], a ; menu watched keys
	xor a
	ld [hl], a
	call HandleMenuInput
	push af
	call LoadScreenTilesFromBuffer1 ; restore saved screen
	pop af
	bit 1, a ; was the B button pressed?
	jp nz, .loop
; if the B button wasn't pressed
	ld a, [wMaxMenuItem]
	ld b, a
	ld a, [wCurrentMenuItem] ; menu selection
	cp b
	jp z, .exitMenu ; if the player chose Cancel
	dec b
	cp b
	jr z, .choseSwitch
	dec b
	cp b
	jp z, .choseStats
	ld c, a
	ld b, 0
	ld hl, wFieldMoves
	add hl, bc
	jp .choseOutOfBattleMove
.choseSwitch
	ld a, [wPartyCount]
	cp 2 ; is there more than one pokemon in the party?
	jp c, StartMenu_Pokemon ; if not, no switching
	call SwitchPartyMon_InitVarOrSwapData ; init [wMenuItemToSwap]
	ld a, SWAP_MONS_PARTY_MENU
	ld [wPartyMenuTypeOrMessageID], a
	call GoBackToPartyMenu
	jp .checkIfPokemonChosen
.choseStats
	call ClearSprites
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	predef StatusScreen
	predef StatusScreen2
	call ReloadMapData
	jp StartMenu_Pokemon
.choseOutOfBattleMove
	push hl
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	pop hl
	ld a, [hl]
	dec a
	add a
	ld b, 0
	ld c, a
	ld hl, .outOfBattleMovePointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wObtainedBadges] ; badges obtained
	jp hl
.outOfBattleMovePointers
	dw .cut
	dw .fly
	dw .surf
	dw .surf
	dw .strength
	dw .flash
	dw .dig
	dw .teleport
	dw .softboiled
.fly
	bit BIT_THUNDERBADGE, a
	jp z, .newBadgeRequired
	call CheckIfInOutsideMap
	jr z, .canFly
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, .cannotFlyHereText
	call PrintText
	jp .loop
.canFly
	call ChooseFlyDestination
	ld a, [wd732]
	bit 3, a ; did the player decide to fly?
	jp nz, .goBackToMap
	call LoadFontTilePatterns
	ld hl, wd72e
	set 1, [hl]
	jp StartMenu_Pokemon
.cut
	bit BIT_CASCADEBADGE, a
	jp z, .newBadgeRequired
	predef UsedCut
	ld a, [wActionResultOrTookBattleTurn]
	and a
	jp z, .loop
	jp CloseTextDisplay
.surf
	bit BIT_SOULBADGE, a
	jp z, .newBadgeRequired
	farcall IsSurfingAllowed
	ld hl, wd728
	bit 1, [hl]
	res 1, [hl]
	jp z, .loop
	ld a, SURFBOARD
	ld [wcf91], a
	ld [wPseudoItemID], a
	call UseItem
	ld a, [wActionResultOrTookBattleTurn]
	and a
	jp z, .loop
	call GBPalWhiteOutWithDelay3
	jp .goBackToMap
.strength
	bit BIT_RAINBOWBADGE, a
	jp z, .newBadgeRequired
	predef PrintStrengthTxt
	call GBPalWhiteOutWithDelay3
	jp .goBackToMap
.flash
	bit BIT_BOULDERBADGE, a
	jp z, .newBadgeRequired
	xor a
	ld [wMapPalOffset], a
	ld hl, .flashLightsAreaText
	call PrintText
	call GBPalWhiteOutWithDelay3
	jp .goBackToMap
.flashLightsAreaText
	text_far _FlashLightsAreaText
	text_end
.dig
	ld a, ESCAPE_ROPE
	ld [wcf91], a
	ld [wPseudoItemID], a
	call UseItem
	ld a, [wActionResultOrTookBattleTurn]
	and a
	jp z, .loop
	call GBPalWhiteOutWithDelay3
	jp .goBackToMap
.teleport
	call CheckIfInOutsideMap
	jr z, .canTeleport
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, .cannotUseTeleportNowText
	call PrintText
	jp .loop
.canTeleport
	ld hl, .warpToLastPokemonCenterText
	call PrintText
	ld hl, wd732
	set 3, [hl]
	set 6, [hl]
	ld hl, wd72e
	set 1, [hl]
	res 4, [hl]
	ld c, 60
	call DelayFrames
	call GBPalWhiteOutWithDelay3
	jp .goBackToMap
.warpToLastPokemonCenterText
	text_far _WarpToLastPokemonCenterText
	text_end
.cannotUseTeleportNowText
	text_far _CannotUseTeleportNowText
	text_end
.cannotFlyHereText
	text_far _CannotFlyHereText
	text_end
.softboiled
	ld hl, wPartyMon1MaxHP
	ld a, [wWhichPokemon]
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld a, [hli]
	ldh [hDividend], a
	ld a, [hl]
	ldh [hDividend + 1], a
	ld a, 5
	ldh [hDivisor], a
	ld b, 2 ; number of bytes
	call Divide
	ld bc, wPartyMon1HP - wPartyMon1MaxHP
	add hl, bc
	ld a, [hld]
	ld b, a
	ldh a, [hQuotient + 3]
	sub b
	ld b, [hl]
	ldh a, [hQuotient + 2]
	sbc b
	jp nc, .notHealthyEnough
	ld a, [wPartyAndBillsPCSavedMenuItem]
	push af
	ld a, POTION
	ld [wcf91], a
	ld [wPseudoItemID], a
	call UseItem
	pop af
	ld [wPartyAndBillsPCSavedMenuItem], a
	jp .loop
.notHealthyEnough ; if current HP is less than 1/5 of max HP
	ld hl, .notHealthyEnoughText
	call PrintText
	jp .loop
.notHealthyEnoughText
	text_far _NotHealthyEnoughText
	text_end
.goBackToMap
	call RestoreScreenTilesAndReloadTilePatterns
	jp CloseTextDisplay
.newBadgeRequired
	ld hl, .newBadgeRequiredText
	call PrintText
	jp .loop
.newBadgeRequiredText
	text_far _NewBadgeRequiredText
	text_end

; writes a blank tile to all possible menu cursor positions on the party menu
ErasePartyMenuCursors::
	hlcoord 0, 1
	ld bc, 2 * 20 ; menu cursor positions are 2 rows apart
	ld a, 6 ; 6 menu cursor positions
.loop
	ld [hl], " "
	add hl, bc
	dec a
	jr nz, .loop
	ret

ItemMenuLoop:
	call LoadScreenTilesFromBuffer2DisableBGTransfer ; restore saved screen
	call RunDefaultPaletteCommand

StartMenu_Item::
	ld a, [wLinkState]
	dec a ; is the player in the Colosseum or Trade Centre?
	jr nz, .notInCableClubRoom
	ld hl, CannotUseItemsHereText
	call PrintText
	jr .exitMenu
.notInCableClubRoom
	ld bc, wNumBagItems
	ld hl, wListPointer
	ld a, c
	ld [hli], a
	ld [hl], b ; store item bag pointer in wListPointer (for DisplayListMenuID)
	xor a
	ld [wPrintItemPrices], a
	ld a, ITEMLISTMENU
	ld [wListMenuID], a
	ld a, [wBagSavedMenuItem]
	ld [wCurrentMenuItem], a
	call DisplayListMenuID
	ld a, [wCurrentMenuItem]
	ld [wBagSavedMenuItem], a
	jr nc, .choseItem
.exitMenu
	call LoadScreenTilesFromBuffer2 ; restore saved screen
	call LoadTextBoxTilePatterns
	call UpdateSprites
	jp RedisplayStartMenu
.choseItem
; erase menu cursor (blank each tile in front of an item name)
	ld a, " "
	ldcoord_a 5, 4
	ldcoord_a 5, 6
	ldcoord_a 5, 8
	ldcoord_a 5, 10
	call PlaceUnfilledArrowMenuCursor
	xor a
	ld [wMenuItemToSwap], a
	ld a, [wcf91]
	cp BICYCLE
	jp z, .useOrTossItem
.notBicycle1
	ld a, USE_TOSS_MENU_TEMPLATE
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, wTopMenuItemY
	ld a, 11
	ld [hli], a ; top menu item Y
	ld a, 14
	ld [hli], a ; top menu item X
	xor a
	ld [hli], a ; current menu item ID
	inc hl
	inc a ; a = 1
	ld [hli], a ; max menu item ID
	ld a, A_BUTTON | B_BUTTON
	ld [hli], a ; menu watched keys
	xor a
	ld [hl], a ; old menu item id
	call HandleMenuInput
	call PlaceUnfilledArrowMenuCursor
	bit 1, a ; was the B button pressed?
	jr z, .useOrTossItem
	jp ItemMenuLoop
.useOrTossItem ; if the player made the choice to use or toss the item
	ld a, [wcf91]
	ld [wd11e], a
	call GetItemName
	call CopyStringToCF4B ; copy name to wcf4b
	ld a, [wcf91]
	cp BICYCLE
	jr nz, .notBicycle2
	ld a, [wd732]
	bit 5, a
	jr z, .useItem_closeMenu
	ld hl, CannotGetOffHereText
	call PrintText
	jp ItemMenuLoop
.notBicycle2
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .tossItem
; use item
	ld [wPseudoItemID], a ; a must be 0 due to above conditional jump
	ld a, [wcf91]
	cp HM01
	jr nc, .useItem_partyMenu
	ld hl, UsableItems_CloseMenu
	ld de, 1
	call IsInArray
	jr c, .useItem_closeMenu
	ld a, [wcf91]
	ld hl, UsableItems_PartyMenu
	ld de, 1
	call IsInArray
	jr c, .useItem_partyMenu
	call UseItem
	jp ItemMenuLoop
.useItem_closeMenu
	xor a
	ld [wPseudoItemID], a
	call UseItem
	ld a, [wActionResultOrTookBattleTurn]
	and a
	jp z, ItemMenuLoop
	jp CloseStartMenu
.useItem_partyMenu
	ld a, [wUpdateSpritesEnabled]
	push af
	call UseItem
	ld a, [wActionResultOrTookBattleTurn]
	cp $02
	jp z, .partyMenuNotDisplayed
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	pop af
	ld [wUpdateSpritesEnabled], a
	jp StartMenu_Item
.partyMenuNotDisplayed
	pop af
	ld [wUpdateSpritesEnabled], a
	jp ItemMenuLoop
.tossItem
	call IsKeyItem
	ld a, [wIsKeyItem]
	and a
	jr nz, .skipAskingQuantity
	ld a, [wcf91]
	call IsItemHM
	jr c, .skipAskingQuantity
	call DisplayChooseQuantityMenu
	inc a
	jr z, .tossZeroItems
.skipAskingQuantity
	ld hl, wNumBagItems
	call TossItem
.tossZeroItems
	jp ItemMenuLoop

CannotUseItemsHereText:
	text_far _CannotUseItemsHereText
	text_end

CannotGetOffHereText:
	text_far _CannotGetOffHereText
	text_end

INCLUDE "data/items/use_party.asm"

INCLUDE "data/items/use_overworld.asm"

StartMenu_TrainerInfo::
	call GBPalWhiteOut
	call ClearScreen
	call UpdateSprites
	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hTileAnimations], a
	call DrawTrainerInfo
	predef DrawBadges ; draw badges
	ld b, SET_PAL_TRAINER_CARD
	call RunPaletteCommand
	call GBPalNormal
	call WaitForTextScrollButtonPress ; wait for button press
	call GBPalWhiteOut
	call LoadFontTilePatterns
	call LoadScreenTilesFromBuffer2 ; restore saved screen
	call RunDefaultPaletteCommand
	call ReloadMapData
	call LoadGBPal
	pop af
	ldh [hTileAnimations], a
	jp RedisplayStartMenu

; loads tile patterns and draws everything except for gym leader faces / badges
DrawTrainerInfo:
	ld de, RedPicFront
	lb bc, BANK(RedPicFront), $01
	predef DisplayPicCenteredOrUpperRight
	call DisableLCD
	hlcoord 0, 2
	ld a, " "
	call TrainerInfo_DrawVerticalLine
	hlcoord 1, 2
	call TrainerInfo_DrawVerticalLine
	ld hl, vChars2 tile $07
	ld de, vChars2 tile $00
	ld bc, $1c tiles
	call CopyData
	ld hl, TrainerInfoTextBoxTileGraphics ; trainer info text box tile patterns
	ld de, vChars2 tile $77
	ld bc, 8 tiles
	push bc
	call TrainerInfo_FarCopyData
	ld hl, BlankLeaderNames
	ld de, vChars2 tile $60
	ld bc, $17 tiles
	call TrainerInfo_FarCopyData
	pop bc
	ld hl, BadgeNumbersTileGraphics  ; badge number tile patterns
	ld de, vChars1 tile $58
	call TrainerInfo_FarCopyData
	ld hl, GymLeaderFaceAndBadgeTileGraphics  ; gym leader face and badge tile patterns
	ld de, vChars2 tile $20
	ld bc, 8 * 8 tiles
	ld a, BANK(GymLeaderFaceAndBadgeTileGraphics)
	call FarCopyData2
	ld hl, TextBoxGraphics
	ld de, 13 tiles
	add hl, de ; hl = colon tile pattern
	ld de, vChars1 tile $56
	ld bc, 1 tiles
	ld a, BANK(TextBoxGraphics)
	push bc
	call FarCopyData2
	pop bc
	ld hl, TrainerInfoTextBoxTileGraphics tile 8  ; background tile pattern
	ld de, vChars1 tile $57
	call TrainerInfo_FarCopyData
	call EnableLCD
	ld hl, wTrainerInfoTextBoxWidthPlus1
	ld a, 18 + 1
	ld [hli], a
	dec a
	ld [hli], a
	ld [hl], 1
	hlcoord 0, 0
	call TrainerInfo_DrawTextBox
	ld hl, wTrainerInfoTextBoxWidthPlus1
	ld a, 16 + 1
	ld [hli], a
	dec a
	ld [hli], a
	ld [hl], 3
	hlcoord 1, 10
	call TrainerInfo_DrawTextBox
	hlcoord 0, 10
	ld a, $d7
	call TrainerInfo_DrawVerticalLine
	hlcoord 19, 10
	call TrainerInfo_DrawVerticalLine
	hlcoord 6, 9
	ld de, TrainerInfo_BadgesText
	call PlaceString
	hlcoord 2, 2
	ld de, TrainerInfo_NameMoneyTimeText
	call PlaceString
	hlcoord 7, 2
	ld de, wPlayerName
	call PlaceString
	hlcoord 8, 4
	ld de, wPlayerMoney
	ld c, $e3
	call PrintBCDNumber
	hlcoord 9, 6
	ld de, wPlayTimeHours ; hours
	lb bc, LEFT_ALIGN | 1, 3
	call PrintNumber
	ld [hl], $d6 ; colon tile ID
	inc hl
	ld de, wPlayTimeMinutes ; minutes
	lb bc, LEADING_ZEROES | 1, 2
	jp PrintNumber

TrainerInfo_FarCopyData:
	ld a, BANK(TrainerInfoTextBoxTileGraphics)
	jp FarCopyData2

TrainerInfo_NameMoneyTimeText:
	db   "NAME/"
	next "MONEY/"
	next "TIME/@"

; $76 is a circle tile
TrainerInfo_BadgesText:
	db $76,"BADGES",$76,"@"

; draws a text box on the trainer info screen
; height is always 6
; INPUT:
; hl = destination address
; [wTrainerInfoTextBoxWidthPlus1] = width
; [wTrainerInfoTextBoxWidth] = width - 1
; [wTrainerInfoTextBoxNextRowOffset] = distance from the end of a text box row to the start of the next
TrainerInfo_DrawTextBox:
	ld a, $79 ; upper left corner tile ID
	lb de, $7a, $7b ; top edge and upper right corner tile ID's
	call TrainerInfo_DrawHorizontalEdge ; draw top edge
	call TrainerInfo_NextTextBoxRow
	ld a, [wTrainerInfoTextBoxWidthPlus1]
	ld e, a
	ld d, 0
	ld c, 6 ; height of the text box
.loop
	ld [hl], $7c ; left edge tile ID
	add hl, de
	ld [hl], $78 ; right edge tile ID
	call TrainerInfo_NextTextBoxRow
	dec c
	jr nz, .loop
	ld a, $7d ; lower left corner tile ID
	lb de, $77, $7e ; bottom edge and lower right corner tile ID's

TrainerInfo_DrawHorizontalEdge:
	ld [hli], a ; place left corner tile
	ld a, [wTrainerInfoTextBoxWidth]
	ld c, a
	ld a, d
.loop
	ld [hli], a ; place edge tile
	dec c
	jr nz, .loop
	ld a, e
	ld [hl], a ; place right corner tile
	ret

TrainerInfo_NextTextBoxRow:
	ld a, [wTrainerInfoTextBoxNextRowOffset] ; distance to the start of the next row
.loop
	inc hl
	dec a
	jr nz, .loop
	ret

; draws a vertical line
; INPUT:
; hl = address of top tile in the line
; a = tile ID
TrainerInfo_DrawVerticalLine:
	ld de, SCREEN_WIDTH
	ld c, 8
.loop
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret

StartMenu_SaveReset::
	ld a, [wd72e]
	bit 6, a ; is the player using the link feature?
	jp nz, Init
	predef SaveSAV ; save the game
	call LoadScreenTilesFromBuffer2 ; restore saved screen
	jp HoldTextDisplayOpen

StartMenu_Option::
	xor a
	ldh [hAutoBGTransferEnabled], a
	call ClearScreen
	call UpdateSprites
	callfar DisplayOptionMenu
	call LoadScreenTilesFromBuffer2 ; restore saved screen
	call LoadTextBoxTilePatterns
	call UpdateSprites
	jp RedisplayStartMenu

SwitchPartyMon::
	call SwitchPartyMon_InitVarOrSwapData ; swap data
	ld a, [wSwappedMenuItem]
	call SwitchPartyMon_ClearGfx
	ld a, [wCurrentMenuItem]
	call SwitchPartyMon_ClearGfx
	jp RedrawPartyMenu_

SwitchPartyMon_ClearGfx:
	push af
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * 2
	call AddNTimes
	ld c, SCREEN_WIDTH * 2
	ld a, " "
.clearMonBGLoop ; clear the mon's row in the party menu
	ld [hli], a
	dec c
	jr nz, .clearMonBGLoop
	pop af
	ld hl, wOAMBuffer
	ld bc, $10
	call AddNTimes
	ld de, $4
	ld c, e
.clearMonOAMLoop
	ld [hl], $a0
	add hl, de
	dec c
	jr nz, .clearMonOAMLoop
	call WaitForSoundToFinish
	ld a, SFX_SWAP
	jp PlaySound

SwitchPartyMon_InitVarOrSwapData:
; This is used to initialise [wMenuItemToSwap] and to actually swap the data.
	ld a, [wMenuItemToSwap]
	and a ; has [wMenuItemToSwap] been initialised yet?
	jr nz, .pickedMonsToSwap
; If not, initialise [wMenuItemToSwap] so that it matches the current mon.
	ld a, [wWhichPokemon]
	inc a ; [wMenuItemToSwap] counts from 1
	ld [wMenuItemToSwap], a
	ret
.pickedMonsToSwap
	xor a
	ld [wPartyMenuTypeOrMessageID], a
	ld a, [wMenuItemToSwap]
	dec a
	ld b, a
	ld a, [wCurrentMenuItem]
	ld [wSwappedMenuItem], a
	cp b ; swapping a mon with itself?
	jr nz, .swappingDifferentMons
; can't swap a mon with itself
	xor a
	ld [wMenuItemToSwap], a
	ld [wPartyMenuTypeOrMessageID], a
	ret
.swappingDifferentMons
	ld a, b
	ld [wMenuItemToSwap], a
	push hl
	push de
	ld hl, wPartySpecies
	ld d, h
	ld e, l
	ld a, [wCurrentMenuItem]
	add l
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	ld a, [wMenuItemToSwap]
	add e
	ld e, a
	jr nc, .noCarry2
	inc d
.noCarry2
	ld a, [hl]
	ldh [hSwapTemp], a
	ld a, [de]
	ld [hl], a
	ldh a, [hSwapTemp]
	ld [de], a
	ld hl, wPartyMons
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wCurrentMenuItem]
	call AddNTimes
	push hl
	ld de, wSwitchPartyMonTempBuffer
	ld bc, wPartyMon2 - wPartyMon1
	call CopyData
	ld hl, wPartyMons
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wMenuItemToSwap]
	call AddNTimes
	pop de
	push hl
	ld bc, wPartyMon2 - wPartyMon1
	call CopyData
	pop de
	ld hl, wSwitchPartyMonTempBuffer
	ld bc, wPartyMon2 - wPartyMon1
	call CopyData
	ld hl, wPartyMonOT
	ld a, [wCurrentMenuItem]
	call SkipFixedLengthTextEntries
	push hl
	ld de, wSwitchPartyMonTempBuffer
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, wPartyMonOT
	ld a, [wMenuItemToSwap]
	call SkipFixedLengthTextEntries
	pop de
	push hl
	ld bc, NAME_LENGTH
	call CopyData
	pop de
	ld hl, wSwitchPartyMonTempBuffer
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, wPartyMonNicks
	ld a, [wCurrentMenuItem]
	call SkipFixedLengthTextEntries
	push hl
	ld de, wSwitchPartyMonTempBuffer
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, wPartyMonNicks
	ld a, [wMenuItemToSwap]
	call SkipFixedLengthTextEntries
	pop de
	push hl
	ld bc, NAME_LENGTH
	call CopyData
	pop de
	ld hl, wSwitchPartyMonTempBuffer
	ld bc, NAME_LENGTH
	call CopyData
	ld a, [wMenuItemToSwap]
	ld [wSwappedMenuItem], a
	xor a
	ld [wMenuItemToSwap], a
	ld [wPartyMenuTypeOrMessageID], a
	pop de
	pop hl
	ret
