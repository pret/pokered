; PureRGBnote: CHANGED: a lot of this file was modified for new functionalities like pressing START/SELECT to bring up map/movedex
; and new info in the data page / seeking between pokemon on the data page / showing the back sprite via SELECT on the data page

ShowPokedexMenu:
	call GBPalWhiteOut
	call ClearScreen
	call UpdateSprites
	ld a, [wListScrollOffset]
	push af
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
	ld [wLastMenuItem], a
	inc a
	ld [wd11e], a
	ldh [hJoy7], a
.setUpGraphics
	ld b, SET_PAL_GENERIC
	call RunPaletteCommand
	callfar LoadPokedexTilePatterns
;;;;;;;;;;; PureRGBnote: ADDED: load these new button prompt graphics into VRAM
	ld de, PokedexPromptGraphics
	ld hl, vChars1 tile $40
	lb bc, BANK(PokedexPromptGraphics), (PokedexPromptGraphicsEnd - PokedexPromptGraphics) / $10
	call CopyVideoData
;;;;;;;;;;
.doPokemonListMenu
	ld hl, wTopMenuItemY
	ld a, 3
	ld [hli], a ; top menu item Y
	xor a
	ld [hli], a ; top menu item X
	inc a
	ld [wMenuWatchMovingOutOfBounds], a
	inc hl
	inc hl
	ld a, 6
	ld [hli], a ; max menu item ID
	ld [hl], D_LEFT | D_RIGHT | B_BUTTON | A_BUTTON | SELECT | START ; PureRGBnote: ADDED: track the SELECT and START buttons in order to trigger new functions
	call HandlePokedexListMenu
	jr c, .goToSideMenu ; if the player chose a pokemon from the list
	cp 1
	jr z, .selectPressed
	cp 2
	jr z, .startPressed
.exitPokedex
	xor a
	ld [wMenuWatchMovingOutOfBounds], a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ldh [hJoy7], a
	ld [wOverrideSimulatedJoypadStatesMask], a
	pop af
	ld [wListScrollOffset], a
	call GBPalWhiteOutWithDelay3
	call RunDefaultPaletteCommand
.exitPokedex2
	jp ReloadMapData
.goToSideMenu
	call HandlePokedexSideMenu
	dec b
	jr z, .exitPokedex ; if the player chose Quit
	dec b
	jr z, .doPokemonListMenu ; if pokemon not seen or player pressed B button
	jp .setUpGraphics ; if pokemon data or area was shown
.selectPressed
	pop af
	ld [wListScrollOffset], a
	callfar DisplayTownMap
	jr .exitPokedex2
.startPressed
	pop af
	ld [wListScrollOffset], a
	jp ShowMovedexMenu

; handles the menu on the lower right in the pokedex screen
; OUTPUT:
; b = reason for exiting menu
; 00: showed pokemon data or area
; 01: the player chose Quit
; 02: the pokemon has not been seen yet or the player pressed the B button
HandlePokedexSideMenu:
	call PlaceUnfilledArrowMenuCursor
	ld a, [wCurrentMenuItem]
	push af
	ld b, a
	ld a, [wLastMenuItem]
	push af
	ld a, [wListScrollOffset]
	push af
	add b
	inc a
	ld [wd11e], a
	ld a, [wd11e]
	push af
	ld a, [wDexMaxSeenMon]
	push af ; this doesn't need to be preserved
	ld hl, wPokedexSeen
	call IsPokemonBitSet
	ld b, 2
	jr z, .exitSideMenu
	call PokedexToIndex
	ld hl, wTopMenuItemY
	ld a, 10
	ld [hli], a ; top menu item Y
	ld a, 15
	ld [hli], a ; top menu item X
	xor a
	ld [hli], a ; current menu item ID
	inc hl
	ld a, 3
	ld [hli], a ; max menu item ID
	;ld a, A_BUTTON | B_BUTTON not needed since A_BUTTON | B_BUTTON = 3 and 3 is already in the 'a' register
	ld [hli], a ; menu watched keys (A button and B button)
	xor a
	ld [hli], a ; old menu item ID
	ld [wMenuWatchMovingOutOfBounds], a
.handleMenuInput
	call HandleMenuInput
	bit BIT_B_BUTTON, a
	ld b, 2
	jr nz, .buttonBPressed
	ld a, [wCurrentMenuItem]
	and a
	jr z, .choseData
	dec a
	jr z, .choseCry
	dec a
	jr z, .choseArea
.choseQuit
	ld b, 1
.exitSideMenu
	pop af
	ld [wDexMaxSeenMon], a
	pop af
	ld [wd11e], a
	pop af
	ld [wListScrollOffset], a
	pop af
	ld [wLastMenuItem], a
	pop af
	ld [wCurrentMenuItem], a
	push bc
	hlcoord 0, 3
	ld de, 20
	lb bc, " ", 13
	call DrawTileLine ; cover up the menu cursor in the pokemon list
	pop bc
	ret

.buttonBPressed
	push bc
	hlcoord 15, 10
	ld de, 20
	lb bc, " ", 7
	call DrawTileLine ; cover up the menu cursor in the side menu
	pop bc
	jr .exitSideMenu

.choseData
	pop af
	pop af
	pop af
	ld [wListScrollOffset], a
	pop af
	pop af
	ld [wCurrentMenuItem], a
	call ShowPokedexDataInternal
	ld b, 0
	push bc
	jr .exitedData

; play pokemon cry
.choseCry
	ld a, [wd11e]
	call GetCryData
	rst _PlaySound
	jr .handleMenuInput

.choseArea
	predef LoadTownMap_Nest ; display pokemon areas
	ld b, 0
	jr .exitSideMenu

.exitedData
	hlcoord 0, 3
	ld de, 20
	lb bc, " ", 13
	call DrawTileLine ; cover up the menu cursor in the pokemon list
	pop bc
	ret

; handles the list of pokemon on the left of the pokedex screen
; sets carry flag if player presses A, unsets carry flag if player presses B
HandlePokedexListMenu:
	xor a
	ldh [hAutoBGTransferEnabled], a
;;;;;;;;;;; PureRGBnote: ADDED: If we got the town map, draw the "SELECT: MAP" prompt at the very bottom
	CheckEvent EVENT_GOT_TOWN_MAP
	jr z, .movedexPrompt
	hlcoord 1, 17
	ld a, $C0 ; tile in VRAM that this prompt starts at, it's 5 tiles horizontally across
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
.movedexPrompt
	hlcoord 7, 17
	CheckEvent EVENT_GOT_MOVEDEX
	jr z, .noSelectPrompt
	ld a, $C5
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
.noSelectPrompt
;;;;;;;;;;;
; draw the horizontal line separating the seen and owned amounts from the menu
	hlcoord 15, 8
	ld a, "─"
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	hlcoord 14, 0
	ld [hl], $71 ; vertical line tile
	hlcoord 14, 1
	call DrawPokedexVerticalLine
	hlcoord 14, 9
	call DrawPokedexVerticalLine
	ld hl, wPokedexSeen
	ld b, wPokedexSeenEnd - wPokedexSeen
	call CountSetBits
	ld de, wNumSetBits
	hlcoord 16, 3
	lb bc, 1, 3
	call PrintNumber ; print number of seen pokemon
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld de, wNumSetBits
	hlcoord 16, 6
	lb bc, 1, 3
	call PrintNumber ; print number of owned pokemon
	hlcoord 16, 2
	ld de, PokedexSeenText
	call PlaceString
	hlcoord 16, 5
	ld de, PokedexOwnText
	call PlaceString
	hlcoord 1, 1
	ld de, PokedexContentsText
	call PlaceString
	hlcoord 16, 10
	ld de, PokedexMenuItemsText
	call PlaceString

; find the lowest pokedex number among the pokemon the player has seen
	ld hl, wPokedexSeen
	ld b, 0
.minSeenPokemonLoop
	ld a, [hli]
	ld c, 0
.minSeenPokemonInnerLoop
	inc b
	srl a
	jr c, .storeMinSeenPokemon
	ld d, a
	inc c
	ld a, c
	cp 8
	ld a, d
	jr nz, .minSeenPokemonInnerLoop
	jr .minSeenPokemonLoop

.storeMinSeenPokemon
	ld a, b
	ld [wDexMinSeenMon], a
; find the highest pokedex number among the pokemon the player has seen
	ld hl, wPokedexSeenEnd - 1
	ld b, (wPokedexSeenEnd - wPokedexSeen) * 8 + 1
.maxSeenPokemonLoop
	ld a, [hld]
	ld c, 8
.maxSeenPokemonInnerLoop
	dec b
	sla a
	jr c, .storeMaxSeenPokemon
	dec c
	jr nz, .maxSeenPokemonInnerLoop
	jr .maxSeenPokemonLoop

.storeMaxSeenPokemon
	ld a, b
	ld [wDexMaxSeenMon], a
.loop
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 4, 2
	lb bc, 14, 10
	call ClearScreenArea
	hlcoord 1, 3
	ld a, [wListScrollOffset]
	ld [wd11e], a
	ld d, 7
	ld a, [wDexMaxSeenMon]
	cp 7
	jr nc, .printPokemonLoop
	ld d, a
	dec a
	ld [wMaxMenuItem], a
; loop to print pokemon pokedex numbers and names
; if the player has owned the pokemon, it puts a pokeball beside the name
.printPokemonLoop
	ld a, [wd11e]
	inc a
	ld [wd11e], a
	push af
	push de
	push hl
	ld de, -SCREEN_WIDTH
	add hl, de
	ld de, wd11e
	lb bc, LEADING_ZEROES | 1, 3
	call PrintNumber ; print the pokedex number
	ld de, SCREEN_WIDTH
	add hl, de
	dec hl
	push hl
	ld hl, wPokedexOwned
	call IsPokemonBitSet
	pop hl
	ld a, " "
	jr z, .writeTile
	ld a, $72 ; pokeball tile
.writeTile
	ld [hl], a ; put a pokeball next to pokemon that the player has owned
	push hl
	ld hl, wPokedexSeen
	call IsPokemonBitSet
	jr nz, .getPokemonName ; if the player has seen the pokemon
	ld de, .dashedLine ; print a dashed line in place of the name if the player hasn't seen the pokemon
	jr .skipGettingName
.dashedLine ; for unseen pokemon in the list
	db "----------@"
.getPokemonName
	call PokedexToIndex
	call GetMonName
.skipGettingName
	pop hl
	inc hl
	call PlaceString
	pop hl
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	pop de
	pop af
	ld [wd11e], a
	dec d
	jr nz, .printPokemonLoop
	ld a, 01
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	call GBPalNormal
	call HandleMenuInput
;;;;;;;;;; PureRGBnote: ADDED: track the SELECT button in order to trigger town map when able
	bit BIT_START, a
	jp nz, .startPressed
;;;;;;;;;;
;;;;;;;;;; PureRGBnote: ADDED: track the SELECT button in order to trigger town map when able
	bit BIT_SELECT, a
	jp nz, .selectPressed
;;;;;;;;;;
	bit BIT_B_BUTTON, a
	jp nz, .buttonBPressed
;;;;;;;;;; PureRGBnote: FIXED: code from yellow, avoids a bug where pressing down/up and then 
;;;;;;;;;; immediately A scrolls up/down twice instead of selecting the next pokemon
	bit BIT_A_BUTTON, a 
	jp nz, .buttonAPressed 
;;;;;;;;;;
.checkIfUpPressed
	bit BIT_D_UP, a
	jr z, .checkIfDownPressed
.upPressed ; scroll up one row
	ld a, [wListScrollOffset]
	and a
	jp z, .loop
	dec a
	ld [wListScrollOffset], a
	jp .loop
.checkIfDownPressed
	bit BIT_D_DOWN, a
	jr z, .checkIfRightPressed
.downPressed ; scroll down one row
	ld a, [wDexMaxSeenMon]
	cp 7
	jp c, .loop ; can't if the list is shorter than 7
	sub 7
	ld b, a
	ld a, [wListScrollOffset]
	cp b
	jp z, .loop
	inc a
	ld [wListScrollOffset], a
	jp .loop
.checkIfRightPressed
	bit BIT_D_RIGHT, a
	jr z, .checkIfLeftPressed
.rightPressed ; scroll down 7 rows
	ld a, [wDexMaxSeenMon]
	cp 7
	jp c, .loop ; can't if the list is shorter than 7
	sub 6
	ld b, a
	ld a, [wListScrollOffset]
	add 7
	ld [wListScrollOffset], a
	cp b
	jp c, .loop
	dec b
	ld a, b
	ld [wListScrollOffset], a
	jp .loop
.checkIfLeftPressed ; scroll up 7 rows
	bit BIT_D_LEFT, a
	jr z, .buttonAPressed
.leftPressed
	ld a, [wListScrollOffset]
	sub 7
	ld [wListScrollOffset], a
	jp nc, .loop
	xor a
	ld [wListScrollOffset], a
	jp .loop
.buttonAPressed
	scf
	ld a, 0
	ret
.buttonBPressed
	and a
	ld a, 0
	ret
;;;;;;;;;; PureRGBnote: CHANGED: SELECT button will open the town map while in the pokedex. You need the town map from rival's sister to do this.
;;;;;;;;;;                       Town map doesn't take up space in the bag due to this modification.
.selectPressed
	CheckEvent EVENT_GOT_TOWN_MAP
	jr nz, .showTownMap
	jp .loop
.showTownMap
	ld a, SFX_SWITCH
	rst _PlaySound
	ld a, 1
	and a
	ret
;;;;;;;;;; PureRGBnote: CHANGED: START button will open new MoveDex.
.startPressed
	CheckEvent EVENT_GOT_MOVEDEX
	jr nz, .showMoveDex
	jp .loop
.showMoveDex
	ld a, SFX_SWITCH
	rst _PlaySound
	ld a, 2
	and a
	ret
;;;;;;;;;;

DrawPokedexVerticalLine:
	ld c, 9 ; height of line
	ld de, SCREEN_WIDTH
	ld a, $71 ; vertical line tile
.loop
	ld [hl], a
	add hl, de
	xor 1 ; toggle between vertical line tile and box tile
	dec c
	jr nz, .loop
	ret

PokedexSeenText:
	db "SEEN@"

PokedexOwnText:
	db "OWN@"

PokedexContentsText:
	db "CONTENTS@"

PokedexMenuItemsText:
	db   "DATA"
	next "CRY"
	next "AREA"
	next "QUIT@"

; tests if a pokemon's bit is set in the seen or owned pokemon bit fields
; INPUT:
; [wd11e] = pokedex number
; hl = address of bit field
IsPokemonBitSet:
	ld a, [wd11e]
	dec a
	ld c, a
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	and a
	ret

ShowPokedexDataInternal:
	ld hl, wPokedexDataFlags
	res BIT_POKEDEX_DATA_DISPLAY_TYPE, [hl]
	hlcoord 10, 16 ; where the text down arrow should end up flashing at
	ld a, h
	ld [wMenuCursorLocation], a
	ld a, l
	ld [wMenuCursorLocation+1], a
	; load pokedex data page UI tiles (left + right arrows)
	ld de, PokedexDataUI
	lb bc, BANK(PokedexDataUI), (PokedexDataUIEnd - PokedexDataUI) / $10
	ld hl, vChars1 tile $4C
	call CopyVideoData

	ld a, B_BUTTON
	ld [wMenuWatchedKeys], a ; buttons this menu will track when displaying text (A Button used to proceed the text)

	jr ShowPokedexDataCommon

; function to display pokedex data from outside the pokedex
ShowPokedexData:
	ld hl, wPokedexDataFlags
	set BIT_POKEDEX_DATA_DISPLAY_TYPE, [hl]
	CheckEvent EVENT_GOT_POKEDEX
	ld a, B_BUTTON 
	jr nz, .loadButtons
	xor a
.loadButtons
	ld [wMenuWatchedKeys], a
	hlcoord 18, 16 ; where the text down arrow should end up flashing at
	ld a, h
	ld [wMenuCursorLocation], a
	ld a, l
	ld [wMenuCursorLocation+1], a

	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call UpdateSprites
	callfar LoadPokedexTilePatterns ; load pokedex tiles

; function to display pokedex data from inside the pokedex
ShowPokedexDataCommon:
	ld hl, wd72c
	set 1, [hl]
	ld a, $33 ; 3/7 volume
	ldh [rNR50], a
	call GBPalWhiteOut ; zero all palettes
	call ClearScreen

	ld hl, wPokedexDataFlags
	set 2, [hl] ; flag indicates we're currently in the pokedex data page

	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hTileAnimations], a

	hlcoord 0, 0
	ld de, 1
	lb bc, $64, SCREEN_WIDTH
	call DrawTileLine ; draw top border

	hlcoord 0, 1
	ld de, 20
	lb bc, $66, $10
	call DrawTileLine ; draw left border

	hlcoord 19, 1
	ld b, $67
	call DrawTileLine ; draw right border

	ld a, $63 ; upper left corner tile
	ldcoord_a 0, 0
	ld a, $65 ; upper right corner tile
	ldcoord_a 19, 0
	ld a, $6c ; lower left corner tile
	ldcoord_a 0, 17
	ld a, $6e ; lower right corner tile
	ldcoord_a 19, 17

	hlcoord 2, 8
	ld a, "№"
	ld [hli], a
	ld a, "<DOT>"
	ld [hli], a

	hlcoord 0, 9
	ld de, PokedexDataDividerLine
	call PlaceString ; draw horizontal divider line

	; fall through

ShowNextPokemonData:
	ld hl, wPokedexDataFlags
	res BIT_POKEDEX_WHICH_SPRITE_SHOWING, [hl]
	ld a, [wd11e] ; pokemon ID
	ld [wcf91], a
	ld [wBattleMonSpecies2], a
	push af
	ld b, SET_PAL_POKEDEX
	call RunPaletteCommand
	pop af
	ld [wd11e], a

	hlcoord 9, 6
	ld de, HeightWeightText
	call PlaceString

	call GetMonName
	hlcoord 9, 2
	call PlaceString

	ld hl, PokedexEntryPointers
	ld a, [wd11e]
	dec a
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl] ; de = address of pokedex entry

	hlcoord 9, 4
	call PlaceString ; print species name

	ld h, b
	ld l, c
	push de
	ld a, [wd11e]
	push af
	call IndexToPokedex

	hlcoord 4, 8
	ld de, wd11e
	lb bc, LEADING_ZEROES | 1, 3
	call PrintNumber ; print pokedex number

	ld a, [wPokedexDataFlags]
	bit BIT_POKEDEX_DATA_DISPLAY_TYPE, a
	jr nz, .noPrevNextPrompt

	hlcoord 1, 17
	ld a, [wDexMinSeenMon]
	ld b, a
	ld a, [wd11e]
	cp b
	ld a, $CC ; < prompt
	jr nz, .loadLeftPrompt
	ld a, $6f ; border tile instead
.loadLeftPrompt
	ld [hl], a

	hlcoord 18, 17
	ld a, [wDexMaxSeenMon]
	ld b, a
	ld a, [wd11e]
	cp b
	ld a, $CD ; > prompt
	jr nz, .loadRightPrompt
	ld a, $6f ; border tile instead
.loadRightPrompt
	ld [hl], a

	hlcoord 2, 17
	lb bc, $6f, 16
	jr .drawBottomBorder
.noPrevNextPrompt
	hlcoord 1, 17
	lb bc, $6f, 18
.drawBottomBorder
	ld de, 1
	call DrawTileLine ; draw bottom border

.checkLeftRightButtonFunctionality
	ld a, [wPokedexDataFlags]
	bit BIT_POKEDEX_DATA_DISPLAY_TYPE, a
	jr nz, .noLeftRight ; no left or right tracking when we are displaying an external pokedex entry
	; we will add D_RIGHT and D_LEFT to the tracked buttons if going left or right to other pokedex entries is allowed
	ld a, [wMenuWatchedKeys]
	ld b, a
	ld a, [wd11e]
	ld c, a
	ld a, [wDexMaxSeenMon]
	cp c
	jr z, .noRight
	ld a, D_RIGHT
	or b
	ld b, a
.noRight
	ld a, [wDexMinSeenMon]
	cp c
	jr z, .noLeft
	ld a, D_LEFT
	or b
	ld b, a
.noLeft
	ld a, b ; buttons to watch while displaying description/base stats
	ld [wMenuWatchedKeys], a
.noLeftRight

	ld hl, wPokedexOwned
	call IsPokemonBitSet
	pop af
	ld [wd11e], a
	ld a, [wcf91]
	ld [wd0b5], a
	pop de

	push af
	push bc
	push de
	push hl

	call Delay3
	call GBPalNormal
	call GetMonHeader ; load pokemon picture location
	hlcoord 1, 1
	call LoadFlippedFrontSpriteByMonIndex ; draw pokemon picture
	ld a, [wcf91]
	call PlayCry ; play pokemon cry

	pop hl
	pop de
	pop bc
	pop af

	ld a, c
	and a
	jp z, .seenOnly ; if the pokemon has not been owned, don't print the height or weight, but show their type


	CheckEvent EVENT_GOT_POKEDEX
	jr z, .printHeightWeight ; don't track the select button if we're showing the starter dex entries before getting the pokedex

	ld a, [wMenuWatchedKeys]
	ld b, SELECT
	or b
	ld [wMenuWatchedKeys], a ; watch the select button too if the pokemon is owned (allows the player to see the back sprite on pressing select)


.printHeightWeight
	inc de ; de = address of feet (height)
	ld a, [de] ; reads feet, but a is overwritten without being used
	hlcoord 12, 6
	lb bc, 1, 2
	call PrintNumber ; print feet (height)
	ld a, "′"
	ld [hl], a
	inc de
	inc de ; de = address of inches (height)
	hlcoord 15, 6
	lb bc, LEADING_ZEROES | 1, 2
	call PrintNumber ; print inches (height)
	ld a, "″"
	ld [hl], a
; now print the weight (note that weight is stored in tenths of pounds internally)
	inc de
	inc de
	inc de ; de = address of upper byte of weight
	push de
; put weight in big-endian order at hDexWeight
	ld hl, hDexWeight
	ld a, [hl] ; save existing value of [hDexWeight]
	push af
	ld a, [de] ; a = upper byte of weight
	ld [hli], a ; store upper byte of weight in [hDexWeight]
	ld a, [hl] ; save existing value of [hDexWeight + 1]
	push af
	dec de
	ld a, [de] ; a = lower byte of weight
	ld [hl], a ; store lower byte of weight in [hDexWeight + 1]
	ld de, hDexWeight
	hlcoord 11, 8
	lb bc, 2, 5 ; 2 bytes, 5 digits
	call PrintNumber ; print weight
	hlcoord 14, 8
	ldh a, [hDexWeight + 1]
	sub 10
	ldh a, [hDexWeight]
	sbc 0
	jr nc, .next
	ld [hl], "0" ; if the weight is less than 10, put a 0 before the decimal point
.next
	inc hl
	ld a, [hli]
	ld [hld], a ; make space for the decimal point by moving the last digit forward one tile
	ld [hl], "<DOT>" ; decimal point tile
	pop af
	ldh [hDexWeight + 1], a ; restore original value of [hDexWeight + 1]
	pop af
	ldh [hDexWeight], a ; restore original value of [hDexWeight]

.printDescription
	pop hl
	push hl
	inc hl ; hl = address of pokedex description text
	bccoord 1, 11
	ld a, %10
	ldh [hClearLetterPrintingDelayFlags], a
	call TextCommandProcessor ; print pokedex description text
	CheckEvent EVENT_GOT_POKEDEX
	jp z, .starterDisplay ; don't display additional page if we're showing the starters before getting the pokedex.
	ld a, [wMenuWatchedKeys]
	ld c, a
	ldh a, [hJoy5]
	ld b, a
	and c
	jr nz, .buttonTracking1
	callfar TextCommandPromptMultiButton
	ldh a, [hJoy5]
	ld b, a
.buttonTracking1
	bit BIT_A_BUTTON, b
	jr nz, .printBaseStats
	bit BIT_B_BUTTON, b
	jp nz, .exitDataPage
	bit BIT_D_LEFT, b
	jp nz, .prevMon
	bit BIT_D_RIGHT, b
	jp nz, .nextMon
	bit BIT_SELECT, b
	jp nz, .switchMonSprite
;;;;;;;;;; PureRGBnote: ADDED: pokedex will display the pokemon's types and their base stats on a new third page.
.printBaseStats
	hlcoord 1, 10
	lb bc, 7, 18
	call ClearScreenArea
	; print mon base stats
	hlcoord 9, 10
	ld de, BaseStatsText
	call PlaceString
	hlcoord 12, 11
	ld de, HPText
	call PlaceString
	ld de, wMonHBaseHP
	hlcoord 15, 11
	lb bc, 1, 3
	call PrintNumber 
	hlcoord 11, 12
	ld de, AtkText
	call PlaceString
	ld de, wMonHBaseAttack
	hlcoord 15, 12
	lb bc, 1, 3
	call PrintNumber 
	hlcoord 11, 13
	ld de, DefText
	call PlaceString
	ld de, wMonHBaseDefense
	hlcoord 15, 13
	lb bc, 1, 3
	call PrintNumber
	hlcoord 11, 14
	ld de, SpdText
	call PlaceString
	ld de, wMonHBaseSpeed
	hlcoord 15, 14
	lb bc, 1, 3
	call PrintNumber
	hlcoord 11, 15
	ld de, SpcText
	call PlaceString
	ld de, wMonHBaseSpecial
	hlcoord 15, 15
	lb bc, 1, 3
	call PrintNumber 
	hlcoord 9, 16
	ld de, TotalText
	call PlaceString
	; calculate the base stat total to print it
	ld b, 0
	ld a, [wMonHBaseHP]
	ld hl, 0
	ld c, a
	add hl, bc
	ld a, [wMonHBaseAttack]
	ld c, a
	add hl, bc
	ld a, [wMonHBaseDefense]
	ld c, a
	add hl, bc
	ld a, [wMonHBaseSpeed]
	ld c, a
	add hl, bc
	ld a, [wMonHBaseSpecial]
	ld c, a
	add hl, bc
	ld a, h
	ld [wSum], a
	ld a, l
	ld [wSum+1], a
	ld de, wSum
	hlcoord 15, 16
	lb bc, 2, 3
	call PrintNumber
	jr .printMonTypes

.seenOnly
	push hl
;;;;;;;;;;; PureRGBnote: ADDED: code for printing the current pokemon's type(s)
.printMonTypes
	hlcoord 1, 11
	ld de, DexType1Text
	call PlaceString
	hlcoord 2, 12
	predef PrintMonType
	ld a, [wMonHType1]
	ld b, a
	ld a, [wMonHType2]
	cp b
	jr z, .waitForButtonPress2 ; don't print TYPE2/ if the pokemon has 1 type only.
	hlcoord 1, 13
	ld de, DexType2Text
	call PlaceString
	jr .waitForButtonPress2
.starterDisplay
	ld a, [wMenuWatchedKeys]
	or A_BUTTON
	ld [wMenuWatchedKeys], a
.waitForButtonPress2
;;;;;;;;;;
	call JoypadLowSensitivity
	ld a, [wMenuWatchedKeys]
	ld c, a
	ldh a, [hJoy5]
	ld b, a
	and c
	jr z, .waitForButtonPress2
.buttonTracking2
	bit BIT_B_BUTTON, b
	jp nz, .exitDataPage
	bit BIT_D_LEFT, b
	jp nz, .prevMon
	bit BIT_D_RIGHT, b
	jr nz, .nextMon
	bit BIT_SELECT, b
	jr nz, .switchMonSprite
	bit BIT_A_BUTTON, b
	jp nz, .exitDataPage ; only an option if in the starter pokedex display at the beginning of the game
.exitDataPage
	xor a
	ldh [hClearLetterPrintingDelayFlags], a
	ld [wPokedexDataFlags], a
	pop hl
	pop af
	ldh [hTileAnimations], a
	call GBPalWhiteOut
	call ClearScreen
	call RunDefaultPaletteCommand
	call LoadTextBoxTilePatterns
	call GBPalNormal
	ld hl, wd72c
	res 1, [hl]
	ld a, $77 ; max volume
	ldh [rNR50], a
	ret
.switchMonSprite
	ld a, [wd11e]
	push af
	call IndexToPokedex
	hlcoord 1, 1
	ld b, 7
	ld c, 8
	call ClearScreenArea
	ld a, [wPokedexDataFlags]
	xor %00000010 ; toggle BIT_POKEDEX_WHICH_SPRITE_SHOWING
	bit BIT_POKEDEX_WHICH_SPRITE_SHOWING, a
	ld [wPokedexDataFlags], a
	jr nz, .backSprite
.frontSprite
	hlcoord 1, 1
	call LoadFlippedFrontSpriteByMonIndex ; draw front sprite
	jr .reloadwd11e
.backSprite
	callfar LoadMonBackPicInPokedex ; draw back sprite
	xor a
	ldh [hStartTileID], a
	hlcoord 1, 1
	predef CopyUncompressedPicToTilemap
	jr .reloadwd11e
.nextMon
	ld a, [wd11e]
	push af
	call IndexToPokedex
	ld hl, wPokedexSeen
	call SeekToNextMon
	jr c, .reloadwd11e
	pop af
	call ChangeListPosition
	call PokedexToIndex
	jr .showNextPokemon
.prevMon
	ld a, [wd11e]
	push af
	call IndexToPokedex
	ld hl, wPokedexSeen
	call SeekToPreviousMon
	jr c, .reloadwd11e
	pop af
	call ChangeListPosition
	call PokedexToIndex
	jr .showNextPokemon
.reloadwd11e
	pop af
	ld [wd11e], a
.reprintDescription
	; clear the description box in case we're not on page 1
	hlcoord 1, 10
	lb bc, 6, 18
	call ClearScreenArea
	hlcoord 9, 16
	lb bc, 1, 9
	call ClearScreenArea
	jp .printDescription
.showNextPokemon
	; clear the variable portions of the on-screen data so they don't overlap
	; clear pokemon sprite box
	hlcoord 1, 1
	lb bc, 7, 8
	call ClearScreenArea
	; clear bottom text window
	hlcoord 1, 10
	lb bc, 6, 18
	call ClearScreenArea
	hlcoord 3, 16
	lb bc, 1, 15
	call ClearScreenArea
	; clear pokemon name + class
	hlcoord 9, 2
	lb bc, 3, 10
	call ClearScreenArea

	ld a, B_BUTTON
	ld [wMenuWatchedKeys], a ; reset the default watched buttons for internal entries

	call Delay3

	pop hl
	jp ShowNextPokemonData

HeightWeightText:
	db   "HT  ?′??″"
	next "WT   ???lb@"

; XXX does anything point to this?
PokeText:
	db "#@"

; horizontal line that divides the pokedex text description from the rest of the data
PokedexDataDividerLine:
	db $68, $69, $6B, $69, $6B, $69, $6B, $69, $6B, $6B
	db $6B, $6B, $69, $6B, $69, $6B, $69, $6B, $69, $6A
	db "@"

INCLUDE "data/pokemon/dex_entries.asm"

PokedexToIndex:
	; converts the Pokédex number at wd11e to an index
	push bc
	push hl
	ld a, [wd11e]
	ld b, a
	ld c, 0
	ld hl, PokedexOrder

.loop ; go through the list until we find an entry with a matching dex number
	inc c
	ld a, [hli]
	cp b
	jr nz, .loop

	ld a, c
	ld [wd11e], a
	pop hl
	pop bc
	ret

IndexToPokedex:
	; converts the index number at wd11e to a Pokédex number
	push bc
	push hl
	ld a, [wd11e]
	dec a
	ld hl, PokedexOrder
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wd11e], a
	pop hl
	pop bc
	ret

INCLUDE "data/pokemon/dex_order.asm"

DexType1Text:
	db "TYPE1/@"

DexType2Text:
	db "TYPE2/@"

BaseStatsText:
	db "BASE STATS@"

HPText:
	db "HP@"

AtkText:
	db "ATK@"

DefText:
	db "DEF@"

SpdText:
	db "SPD@"

SpcText:
	db "SPC@"

TotalText:
	db "TOTAL@"



