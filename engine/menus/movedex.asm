ShowMovedexMenu:
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
	ld b, SET_PAL_TOWN_MAP
	call RunPaletteCommand
	callfar LoadPokedexTilePatterns

	ld de, MovedexPromptGraphics
	ld hl, vChars1 tile $40
	lb bc, BANK(MovedexPromptGraphics), (MovedexPromptGraphicsEnd - MovedexPromptGraphics) / $10
	call CopyVideoData

.stayOnMenu
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
	ld [hl], D_LEFT | D_RIGHT | B_BUTTON | A_BUTTON | SELECT | START
	call HandleMovedexListMenu
	jr c, .goToMoveData ; if the player chose a move from the list
	cp 1
	jr z, .selectPressed
	cp 2
	jr z, .startPressed
.exitMovedex
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
	jp ReloadMapData
.goToMoveData
	call ShowMoveData
	jr z, .stayOnMenu ; if pokemon not seen or player pressed B button
	jp .setUpGraphics ; if pokemon data or area was shown
.selectPressed
	pop af
	ld [wListScrollOffset], a
	farjp DisplayTownMap
.startPressed
	pop af
	ld [wListScrollOffset], a
	jp ShowPokedexMenu

; handles the list of pokemon on the left of the pokedex screen
; sets carry flag if player presses A, unsets carry flag if player presses B
HandleMovedexListMenu:
	xor a
	ldh [hAutoBGTransferEnabled], a
	CheckEvent EVENT_GOT_TOWN_MAP
	jr z, .pokedexPrompt
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
.pokedexPrompt
	hlcoord 7, 17
	; CheckEvent EVENT_GOT_MOVEDEX
	; jr z, .noSelectPrompt
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
	hlcoord 19, 0
	ld [hl], $71 ; vertical line tile
	hlcoord 19, 1
	call DrawPokedexVerticalLine
	hlcoord 19, 9
	call DrawPokedexVerticalLine
	ld hl, wMovedexSeen
	ld b, wMovedexSeenEnd - wMovedexSeen
	call CountSetBits
	ld de, wNumSetBits
	hlcoord 16, 2
	lb bc, 1, 3
	call PrintNumber ; print number of seen pokemon
	hlcoord 15, 1
	ld de, PokedexSeenText
	call PlaceString
	hlcoord 1, 1
	ld de, MovedexText
	call PlaceString

; find the lowest move number among the moves the player has seen
	ld hl, wMovedexSeen
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
	ld [wDexMinSeenMove], a

; find the highest pokedex number among the pokemon the player has seen
	ld hl, wMovedexSeenEnd - 1
	ld b, (wMovedexSeenEnd - wMovedexSeen) * 8 + 1
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
	ld [wDexMaxSeenMove], a
.loop
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 4, 2
	lb bc, 14, 12
	call ClearScreenArea
	hlcoord 1, 3
	ld a, [wListScrollOffset]
	ld [wd11e], a
	ld d, 7
	ld a, [wDexMaxSeenMove]
	cp 7
	jr nc, .printMoveLoop
	ld d, a
	dec a
	ld [wMaxMenuItem], a
; loop to print pokemon pokedex numbers and names
; if the player has owned the pokemon, it puts a pokeball beside the name
.printMoveLoop
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
	ld hl, wMovedexSeen
	call IsMoveBitSet
	jr nz, .getMoveName ; if the player has seen the move
	ld de, .dashedLine ; print a dashed line in place of the name if the player hasn't seen the pokemon
	jr .skipGettingName
.dashedLine ; for unseen pokemon in the list
	db "-----------@"
.getMoveName
	call GetMoveName
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
	jr nz, .printMoveLoop
	ld a, 01
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	call GBPalNormal
	call HandleMenuInput
	bit BIT_START, a
	jp nz, .startPressed
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
	ld a, [wDexMaxSeenMove]
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
	ld a, [wDexMaxSeenMove]
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
	call PlaySound
	ld a, 1
	and a
	ret
;;;;;;;;;;
;;;;;;;;;; PureRGBnote: CHANGED: START button will open new MoveDex.
.startPressed
	;CheckEvent EVENT_GOT_TOWN_MAP
	;jr nz, .showMoveDex
	;jp .loop
	ld a, SFX_SWITCH
	call PlaySound
	ld a, 2
	and a
	ret
;.showTownMap
;;;;;;;;;;

; tests if a pokemon's bit is set in the seen or owned pokemon bit fields
; INPUT:
; [wd11e] = move id
; hl = address of bit field
IsMoveBitSet:
	ld a, [wd11e]
	dec a
	ld c, a
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	and a
	ret

; displays data about the move, first we have to load up a bunch of data to display this screen
ShowMoveData:
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wListScrollOffset]
	add b
	inc a
	ld [wd11e], a
	ld a, [wd11e]
	ld hl, wMovedexSeen
	call IsMoveBitSet
	ret z
	ld hl, wd72c
	set 1, [hl]
	ld a, $33 ; 3/7 volume
	ldh [rNR50], a
	call ClearScreen
	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hTileAnimations], a

	; load movedex data page UI tiles
	ld de, MovedexUI
	lb bc, BANK(MovedexUI), (MovedexUIEnd - MovedexUI) / $10
	ld hl, vChars1 tile $44
	call CopyVideoData

	call DrawDataBorder

	ld de, MoveTypeText
	hlcoord 4, 3
	call PlaceString

	ld de, MovePPText
	hlcoord 13, 6
	call PlaceString
	ld de, MovePowerText
	hlcoord 1, 6
	call PlaceString
	ld de, MoveAccuracyText
	hlcoord 1, 8
	call PlaceString
	ld de, MovePercentText
	hlcoord 13, 8
	call PlaceString

	hlcoord 10, 16 ; where the text down arrow should end up flashing at
	ld a, h
	ld [wMenuCursorLocation], a
	ld a, l
	ld [wMenuCursorLocation+1], a

	; fall through

; display the move data itself - if switching between moves with left/right, we don't need to reload the above stuff

ShowNextMoveData:
	ld a, [wd11e] ; move ID
	push af
	call LoadMoveDexMoveData
	ld a, [wPlayerMoveType]
	ld d, a
	call LoadTypeIcon
	ld a, [wPlayerMoveType]
	ld [wcf91], a
	ld b, SET_PAL_MOVEDEX
	call RunPaletteCommand
	pop af
	ld [wd11e], a

	hlcoord 1, 3
	ld a, $C0 ; type icon first tile
	ld [hli], a
	inc a
	ld [hl], a
	inc a
	hlcoord 1, 4
	ld [hli], a
	inc a
	ld [hl], a

	call DrawBottomDataBorder

	call GetMoveName
	hlcoord 1, 1
	call PlaceString

	hlcoord 14, 1
	ld a, "№"
	ld [hli], a
	ld a, "<DOT>"
	ld [hli], a
	ld de, wd11e
	lb bc, LEADING_ZEROES | 1, 3
	call PrintNumber ; print pokedex number

	hlcoord 5, 4
	ld d, h
	ld e, l ; de = coordinate to print the type at
	callfar FarPrintType ; print the move type

	hlcoord 7, 6 ; location we will print power number

	ld a, [wPlayerMovePower]
	and a
	ld de, MoveZeroPowerText
	jr z, .zeroPowerMove

	ld a, [wPlayerMoveEffect]
	cp OHKO_EFFECT
	jr z, .OHKO
	cp SPECIAL_DAMAGE_EFFECT
	ld de, MoveQuestionMarkPowerText
	jr z, .specialDamage
	cp SUPER_FANG_EFFECT
	jr z, .specialDamage
	ld de, wPlayerMovePower
	jr .normalMove
.zeroPowerMove
	call PlaceString
	jr .donePrintingPower
.OHKO
	ld de, wSum
	ld a, %11
	ld [de], a
	inc de
	ld a, 231
	ld [de], a
	dec de
	lb bc, LEFT_ALIGN | 2, 3
	call PrintNumber ; print the numeric value for power (999 in this case for OHKO moves)
	jr .donePrintingPower
.specialDamage
	call PlaceString
	jr .donePrintingPower
.normalMove
	lb bc, LEFT_ALIGN | 1, 3
	call PrintNumber ; print the numeric value for power
.donePrintingPower
	
	ld a, [wPlayerMoveAccuracy] ; accuracy value is in 0-255 format, so we need to convert to a percentage with multiplication+division
	ldh [hMultiplicand + 2], a
	xor a
	ldh [hMultiplicand], a
	ldh [hMultiplicand + 1], a
	ld a, 100
	ldh [hMultiplier], a
	call Multiply
	ld a, 255
	ldh [hDivisor], a
	ld b, 4 ; number of bytes that the dividend can have currently
	call Divide
	ldh a, [hRemainder] ; resultant accuracy percentage
	cp 123
	ldh a, [hQuotient + 3]
	jr c, .noRemainder
	inc a
.noRemainder
	ld de, wSum
	ld [de], a
	hlcoord 10, 8
	lb bc, 1, 3
	call PrintNumber ; print the numeric value for accuracy

	ld de, wPlayerMoveMaxPP
	hlcoord 16, 6
	lb bc, LEFT_ALIGN | 1, 2
	call PrintNumber ; print the numeric value for PP

.printDescription
	; start by storing the buttons we will track while displaying the description
	ld a, B_BUTTON
	ld b, a
	ld a, [wd11e]
	ld c, a
	ld a, [wDexMaxSeenMove]
	cp c
	jr z, .noRight
	ld a, D_RIGHT
	or b
	ld b, a
.noRight
	ld a, [wDexMinSeenMove]
	cp c
	jr z, .noLeft
	ld a, D_LEFT
	or b
	ld b, a
.noLeft
	ld a, b ; buttons to watch while displaying the below text
	ld [wMenuWatchedKeys], a

	ld hl, MovedexEntryPointers
	ld a, [wd11e]
	dec a
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl] ; de = address of movedex entry

	ld h, d
	ld l, e
	bccoord 1, 11
	ld a, %10
	ldh [hClearLetterPrintingDelayFlags], a

	call TextCommandProcessor ; print movedex description text
	ld a, [wMenuWatchedKeys]
	ld c, a
	ldh a, [hJoy5]
	ld b, a
	and c
	jr nz, .dontLoop

.waitForButtonPress
	call JoypadLowSensitivity
	ld a, [wMenuWatchedKeys]
	ld c, a
	ldh a, [hJoy5]
	ld b, a
	and c
	jr z, .waitForButtonPress
.dontLoop
	bit BIT_B_BUTTON, b
	jr nz, .closeMenu
	bit BIT_D_LEFT, b
	jr nz, .prevMove
	bit BIT_D_RIGHT, b
	jr nz, .nextMove
	jr .waitForButtonPress
.closeMenu
	xor a
	ldh [hClearLetterPrintingDelayFlags], a
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
	ld a, 1 ; 1 = indicate we have shown the data page and need to reload more stuff to go back
	and a
	ret
.nextMove
	ld a, [wDexMaxSeenMove]
	ld b, a
	ld a, [wd11e]
	cp b
	jr nc, .reprintDescription
	ld hl, wMovedexSeen
	call SeekToNextMove
	jr c, .reprintDescription
	call ChangeListPosition
	call ClearBasicMoveData
	jp ShowNextMoveData
.prevMove
	ld a, [wDexMinSeenMove]
	ld b, a
	ld a, [wd11e]
	cp b
	jr z, .reprintDescription
	ld hl, wMovedexSeen
	call SeekToPreviousMove
	jr c, .reprintDescription
	call ChangeListPosition
	call ClearBasicMoveData
	jp ShowNextMoveData
.reprintDescription
	; clear the description box in case we're not on page 1
	hlcoord 1, 11
	lb bc, 5, 18
	call ClearScreenArea
	jp .printDescription

; loads the move identified by wd11e's properties (power, accuracy, pp, type) into wram
LoadMoveDexMoveData:
	ld de, wPlayerMoveNum
	ld a, [wd11e]
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call FarCopyData ; copy the move's stats
	ret

DrawDataBorder: ; doesn't change between moves
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

	hlcoord 0, 2
	ld de, MovedexTitleDividerLine
	call PlaceString ; draw horizontal divider line
	hlcoord 0, 9
	ld de, MovedexTitleDividerLine
	call PlaceString ; draw horizontal divider line

	ret

DrawBottomDataBorder: ; can change if there's no previous or next move
	hlcoord 4, 17
	ld de, 1
	lb bc, $6f, 12
	call DrawTileLine ; draw bottom border

	ld a, [wd11e]
	ld b, a
	ld a, [wDexMinSeenMove]
	cp b
	push bc
	jr z, .noPrev

	hlcoord 1, 17
	ld a, $C4 ; start of <prev prompt
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	add 4
	hlcoord 1, 16 ; now we do the top line of each's little box
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	jr .nextButton
.noPrev
	hlcoord 1, 17
	ld de, 1
	lb bc, $6f, 3
	call DrawTileLine ; obscure prev button
	hlcoord 1, 16
	lb bc, 1, 3
	call ClearScreenArea ; remove line above it
.nextButton
	pop bc
	ld a, [wDexMaxSeenMove]
	cp b
	jr z, .noNext
	hlcoord 16, 17 ; now we do the next> prompt
	ld a, $C7 ; start of <prev prompt
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	inc a
	hlcoord 16, 16
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ret
.noNext
	hlcoord 16, 17
	ld de, 1
	lb bc, $6f, 3
	call DrawTileLine ; obscure next button
	hlcoord 16, 16
	lb bc, 1, 3
	call ClearScreenArea ; remove line above it
	ret

ClearBasicMoveData:
	hlcoord 1, 1
	lb bc, 1, 13
	call ClearScreenArea
	hlcoord 3, 4
	lb bc, 1, 16
	call ClearScreenArea
	hlcoord 7, 6
	lb bc, 1, 3
	call ClearScreenArea
	hlcoord 16, 6
	lb bc, 1, 2
	call ClearScreenArea
	hlcoord 10, 8
	lb bc, 1, 3
	call ClearScreenArea
	hlcoord 1, 11
	lb bc, 5, 18
	call ClearScreenArea
	ret

; seeks to the next move that has been seen
SeekToNextMon:
SeekToNextMove:
	ld a, [wd11e] ; = move ID
	dec a ; = move bit index
	ld d, a
	ld a, [wDexMaxSeenMove]
	inc a 
	ld e, a
.loop
	inc d ; move forward one index
	ld a, e
	cp d ; e = the index after the last move, stop searching if we hit that
	jr z, .reachedEnd
	ld c, d
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	and a
	jr z, .loop ; if c = 0 keep searching
	ld a, d
	inc a ; now a = the desired move ID
	ld [wd11e], a
	and a
	ret
.reachedEnd
	scf
	ret

; seeks to the next move that has been seen
; INPUT: hl = which set of flags to check
SeekToPreviousMon:
SeekToPreviousMove:
	ld a, [wd11e] ; = move ID
	dec a ; = current move bit index
	ld d, a
	ld a, [wDexMinSeenMove]
	dec a ; = first move bit index
	dec a ; = before first move's bit index (if we get here, we should exit the function)
	ld e, a
.loop
	dec d ; move back one index
	ld a, e
	cp d ; e = the index before the first move or index 0, stop searching if we hit that
	jr z, .reachedFirst
	ld c, d
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	and a
	jr z, .loop ; if c = 0 keep searching
	ld a, d
	inc a ; now a = desired move ID
	ld [wd11e], a
	and a
	ret
.reachedFirst
	scf
	ret

ChangeListPosition:
	ld a, [wDexMaxSeenMove]
	sub 6
	ld b, a
	ld a, [wd11e]
	cp b
	jr c, .listTop
	ld a, b
	dec a
	ld [wListScrollOffset], a
	ld a, [wd11e]
	sub b
	ld [wCurrentMenuItem], a
	ret
.listTop
	xor a
	ld [wCurrentMenuItem], a
	ld a, [wd11e]
	dec a
	ld [wListScrollOffset], a
	ret

INCLUDE "data/moves/movedex_entries.asm"

MovedexText:
	db "MOVEDEX@"

MoveTypeText:
	db "TYPE/@"

MovePowerText:
	db "POWER:@"

MoveAccuracyText:
	db "ACCURACY:@"

MovePPText:
	db "PP:@"

MoveZeroPowerText:
	db "---@"

MovePercentText:
	db "%@"

MoveQuestionMarkPowerText:
	db "???@"

MoveMoreInfoText:
	db "o:More Info@"

MovedexTitleDividerLine:
	db $68, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6A
	db "@"