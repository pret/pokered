DEF OPTION_PAGE_1_COUNT EQU 3 ; number of options on this page
DEF MAX_OPTIONS_PER_PAGE EQU 7
DEF OPTION_PAGE_NUMBER EQU 1 ; must be 1 digit
DEF HOW_MANY_MAIN_OPTIONS_PAGES EQU 4 ; must be 1 digit
DEF NEXT_BUTTON_X_COORD EQU 1
DEF BACK_BUTTON_X_COORD EQU 7
DEF PAGE_CONTROLS_Y_COORD EQU 17

; first byte = y coord
; second byte = which option on the page it is (cancel always = max option value)
ArrowYcoordXVariableOffsetList:
	db 3, 0
	db 8, 1
	db 13, 2
	db PAGE_CONTROLS_Y_COORD, MAX_OPTIONS_PER_PAGE

OptionsNextBackText::
	db "  NEXT  PREV  @"

OptionsDoNothing:
	ret

OptionsPageAorSelectButtonDefault:
	; by default the A button does nothing but the select button displays info on each option
	ldh a, [hJoy5]
	bit BIT_SELECT, a
	ret z ; if select wasn't pressed do nothing
	ld a, [wTopMenuItemY]
	cp PAGE_CONTROLS_Y_COORD ; is cursor on NEXT/PREV row?
	ret z ; don't do anything when player presses select if it's on that row
	ld h, b
	ld l, c ; put the header pointer back into hl from bc
	inc hl
	inc hl ; 8th function in options header jump table
	hl_deref
	ld a, [wCurrentOptionIndex]
	call GetAddressFromPointerArray ; get which text script to run
	call PrintText
	scf
	ret

OptionMenu1Data:
	db OPTION_PAGE_1_COUNT ; length of list
	db OPTION_PAGE_NUMBER ; current page
	db HOW_MANY_MAIN_OPTIONS_PAGES ; how many pages in total
	dw ArrowYcoordXVariableOffsetList

OptionLeftRightFuncs:
	dw CursorInTextSpeed
	dw CursorInBattleAnimation
	dw CursorInBattleStyle
	dw CursorCancelRow

DrawOptionMenu:
	hlcoord 0, 0
	lb bc, 3, 18
	call TextBoxBorder
	hlcoord 0, 5
	lb bc, 3, 18
	call TextBoxBorder
	hlcoord 0, 10
	lb bc, 3, 18
	call TextBoxBorder
	hlcoord 1, 1
	ld de, TextSpeedOptionText
	call PlaceString
	hlcoord 1, 6
	ld de, BattleAnimationOptionText
	call PlaceString
	hlcoord 0, 15
	lb bc, 3, SCREEN_WIDTH
	call ClearScreenArea
	hlcoord 1, 11
	ld de, BattleStyleOptionText
	jp PlaceString

DrawOptionsPageInfo:
	push hl
	hlcoord 16, PAGE_CONTROLS_Y_COORD
	ld a, [bc] ; current page
	push bc
	add NUMBER_CHAR_OFFSET
	ld [hl], a
	hlcoord 17, PAGE_CONTROLS_Y_COORD
	ld [hl], "/"
	hlcoord 18, PAGE_CONTROLS_Y_COORD
	pop bc
	inc bc
	ld a, [bc] ; number of pages in total
	add NUMBER_CHAR_OFFSET
	ld [hli], a
	ld [hl], " "
	hlcoord 14, PAGE_CONTROLS_Y_COORD
	ld a, [hl]
	cp $7a ; check if info text has just displayed and trashed the coords beside page number with a menu border
	jr nz, .skip
	;if so, clear the menu border tiles out
	ld a, " "
	ld [hli], a
	ld [hl], a
.skip
	hlcoord 0, PAGE_CONTROLS_Y_COORD
	ld de, OptionsNextBackText
	call PlaceString
; add cursor in front of NEXT
	hlcoord 1, PAGE_CONTROLS_Y_COORD
	ld [hl], "▷"
; add SELECT:INFO prompt to top of menu
	push bc
	hlcoord 14, 0
	lb bc, $C3, 5 ; start of SELECT:INFO prompt
	ld de, 1
	call DrawTileLineIncrement
	pop bc
	pop hl
	ret

CallOptionsMenuHeaderFunction:
	ld de, DoneCallHeaderFunction
	push hl
	push de ; this will be the return address when we ret from the below jp
	; fall through
JumpOptionsMenuHeaderFunction:
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
DoneCallHeaderFunction:
	pop hl
	ret

GetOptionCoordOffsetsList:
	ld hl, wListPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

OptionsLoadExtraTiles:
	ld de, EditPrompt
	ld hl, vChars1 tile $40
	lb bc, BANK(EditPrompt), 3
	call CopyVideoDataDouble
	ld de, PokedexPromptGraphics
	ld hl, vChars1 tile $43
	lb bc, BANK(PokedexPromptGraphics), 3
	call CopyVideoData
	ld de, InfoPromptGraphics
	ld hl, vChars1 tile $46
	lb bc, BANK(InfoPromptGraphics), 2
	jp CopyVideoData

OptionMenu1Header:
	dw DrawOptionMenu
	dw OptionSetCursorPositionActions
	dw SetOptionsFromCursorPositions
	dw OptionLeftRightFuncs
	dw DisplayOptions2
	dw DisplaySpriteOptions
	dw OptionsPageAorSelectButtonDefault
	dw OptionsMenu1InfoTextJumpTable
	; fall through (options display address should be after A button pointer)
DisplayOptionMenu:
	call OptionsLoadExtraTiles
	ld hl, OptionMenu1Header
	ld bc, OptionMenu1Data
	; fall through
DisplayOptionMenuCommon:
	ld a, [bc]
	ld [wOptionsPageOptionCount], a
	inc bc
	push bc
	inc bc
	inc bc
	ld de, ArrowYcoordXVariableOffsetList
	ld a, [bc]
	ld [wListPointer], a
	inc bc
	ld a, [bc]
	ld [wListPointer + 1], a
	call CallOptionsMenuHeaderFunction
	pop bc
	call DrawOptionsPageInfo
	inc hl
	inc hl ; second function in header
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	inc a
	ld [wLetterPrintingDelayFlags], a
	ld a, [wTopMenuItemY]
	cp PAGE_CONTROLS_Y_COORD
	jr z, .pageTurn
	and a
	jr nz, .yCoordAlreadySet
	xor a
	ld [wCurrentOptionIndex], a
	push hl
	call GetOptionCoordOffsetsList
	ld a, [hl] ; Top option y coordinate
	ld [wTopMenuItemY], a
	pop hl
	ld a, NEXT_BUTTON_X_COORD
	ld [wOptionsCancelCursorX], a
	call SetCursorPositionsFromOptions
	ld a, [wOptions1CursorX] ; first option x coordinate
	ld [wTopMenuItemX], a
	jr .doneLoad
.yCoordAlreadySet
	call SetCursorPositionsFromOptions
	jr .doneLoad
.pageTurn
	ld a, [wOptionsPageOptionCount]
	ld [wCurrentOptionIndex], a
	ld a, [wOptionsCancelCursorX]
	and a
	jr nz, .cancelXValue
	ld a, NEXT_BUTTON_X_COORD
	ld [wOptionsCancelCursorX], a
.cancelXValue
	ld [wTopMenuItemX], a ; next page x coordinate
	push af
	ld a, PAGE_CONTROLS_Y_COORD
	ld [wTopMenuItemY], a ; next page y coordinate
.setCursor
	call SetCursorPositionsFromOptions
	pop af
	cp BACK_BUTTON_X_COORD
	jr nz, .doneLoad
	push hl
	hlcoord NEXT_BUTTON_X_COORD, PAGE_CONTROLS_Y_COORD
	ld [hl], " "
	pop hl
.doneLoad
	ld a, 1
	ldh [hAutoBGTransferEnabled], a ; enable auto background transfer
	call Delay3
	call GBPalNormal ; PureRGBnote: CHANGED: prevents options menu from being dark in dark areas like rock tunnel.
	inc hl
	inc hl ; third function in hl
	; fall through
OptionsMenuLoop:
	push hl
	call PlaceMenuCursor
	pop hl
	push hl
	call CallOptionsMenuHeaderFunction ; run third function in hl
.getJoypadStateLoop
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	ld b, a
	and A_BUTTON | B_BUTTON | START | SELECT | D_RIGHT | D_LEFT | D_UP | D_DOWN 
	jr z, .getJoypadStateLoop
	bit BIT_B_BUTTON, b
	jr nz, .exitMenu
	bit BIT_START, b
	jr nz, .exitMenu
	bit BIT_SELECT, b
	jr nz, .selectPressed
	bit BIT_A_BUTTON, b
	jr z, .checkDirectionKeys
.AbuttonPressed
	ld b, PAGE_CONTROLS_Y_COORD
	ld a, [wTopMenuItemY]
	cp b ; is the cursor on the next/back row?
	jr z, .pageRow
.selectPressed ; both select and the A button if not on the bottom row use this function
	lb de, 0, 8
	add hl, de ; seventh function in header
	ld b, h
	ld c, l ; put the header index into bc for use in the a button/select button action code
	and a ; clear carry
	call CallOptionsMenuHeaderFunction ; A-button action when not on the bottom row
	inc hl
	inc hl
	inc hl
	inc hl ; hl points to the function that draws this whole options menu
	jr nc, .skip
	pop bc ; this is a pop hl but we wish to avoid modifying hl so we can jump to it
	jp hl ; if returned carry we will redraw the whole menu
.skip
	pop hl
	jr OptionsMenuLoop
.pageRow
	ld a, SFX_PRESS_AB
	rst _PlaySound
	call ClearScreen
	pop hl ; points to third function in header
	lb de, 0, 4
	add hl, de ; now points to fifth function in header
	ld a, [wTopMenuItemX]
	cp BACK_BUTTON_X_COORD ; is the cursor on 'BACK'?
	jp nz, JumpOptionsMenuHeaderFunction
	inc hl
	inc hl ; sixth function in header
	jp JumpOptionsMenuHeaderFunction
.exitMenu
	ld a, SFX_PRESS_AB
	rst _PlaySound
	pop hl
	ret
.checkDirectionKeys
	ld hl, wCurrentOptionIndex
	bit BIT_D_DOWN, b
	jr nz, .downPressed
	bit BIT_D_UP, b
	jr nz, .upPressed
	ld e, [hl]
	pop hl
	push hl
	inc hl
	inc hl ; fourth function in header (option functions)
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; now get the specific option function from this list of option functions
	ld c, e
	ld d, 0
	add hl, de
	add hl, de
	jp JumpOptionsMenuHeaderFunction
.downPressed
	ld a, [wOptionsPageOptionCount]
	ld e, a
	ld a, [hl]
	cp e
	ld a, 0
	jr z, .updateMenuVariables
	ld a, [hl]
	inc a
	jr .updateMenuVariables
.upPressed
	ld a, [hl]
	and a
	ld a, [wOptionsPageOptionCount]
	jr z, .updateMenuVariables
	ld a, [hl]
	dec a
.updateMenuVariables
	ld [hl], a
	ld e, a
	call GetYCoordAndXVariable
	ld [wTopMenuItemY], a
	ld a, [hl]
	ld [wTopMenuItemX], a
	call PlaceUnfilledArrowMenuCursor
	pop hl
	jp OptionsMenuLoop

CursorInTextSpeed:
	bit BIT_D_LEFT, b
	jp z, .pressedRightInTextSpeed
;;;;;;;;;; PureRGBnote: CHANGED: Instant text speed replaced medium speed, so we need to adjust the X positions of the cursors a bit.
	ld a, [wOptions1CursorX] ; text speed cursor X coordinate
	cp 1                             ; leftmost position
	jr z, .updateTextSpeedXCoord     ; don't do anything
	cp 9                             ; middle position
	jr nz, .fromSlowToMedium         ; not in middle, go from slow to medium
	sub 8                            ; subtract from accumulator to go from medium to fast
	jr .updateTextSpeedXCoord
.fromSlowToMedium
	sub 5
	jr .updateTextSpeedXCoord
.pressedRightInTextSpeed
	ld a, [wOptions1CursorX] ; text speed cursor X coordinate
	cp 14                            ; rightmost position
	jr z, .updateTextSpeedXCoord     ; don't do anything if rightmost
	cp 9                             ; middle position
	jr nz, .fromFastToMedium         ; not middle, go from leftmost to middle
	add 5                            ; add to accumulator to go from medium to slow
	jr .updateTextSpeedXCoord
.fromFastToMedium
	add 8
.updateTextSpeedXCoord
	ld [wOptions1CursorX], a ; text speed cursor X coordinate
	jr EraseOldMenuCursor

CursorInBattleAnimation:
	ld a, [wOptions2CursorX] ; battle animation cursor X coordinate
	xor $0b ; toggle between 1 and 10
	ld [wOptions2CursorX], a
	jr EraseOldMenuCursor

CursorInBattleStyle:
	ld a, [wOptions3CursorX] ; battle style cursor X coordinate
	xor $0b ; toggle between 1 and 10
	ld [wOptions3CursorX], a
	jr EraseOldMenuCursor

CursorCancelRow:
	ld a, [wOptionsCancelCursorX] ; battle style cursor X coordinate
	xor 6 ; toggle between 1 and 7
	ld [wOptionsCancelCursorX], a
	; fall through

EraseOldMenuCursor:
	ld [wTopMenuItemX], a
	call EraseMenuCursor
DontChangeOptionCursor:
	pop hl
	jp OptionsMenuLoop

GetYCoordAndXVariable:
	call GetOptionCoordOffsetsList
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli] ; y coordinate
	ld e, [hl] ; index of x coordinate variable
	ld hl, wOptions1CursorX
	add hl, de
	ret

TextSpeedOptionText:
	db   "TEXT SPEED"
	next " INSTANT FAST SLOW@"

BattleAnimationOptionText:
	db   "BATTLE ANIMATION"
	next " ON       OFF@"

BattleStyleOptionText:
	db   "BATTLE STYLE"
	next " SHIFT    SET@"

; sets the options variable according to the current placement of the menu cursors in the options menu
SetOptionsFromCursorPositions:
	ld hl, TextSpeedOptionData
	ld a, [wOptions1CursorX] ; text speed cursor X coordinate
	ld c, a
.loop
	ld a, [hli]
	cp c
	jr z, .textSpeedMatchFound
	inc hl
	jr .loop
.textSpeedMatchFound
	ld a, [hl]
	ld b, a
	ld a, [wOptions]
	and %11111100
	or b
	ld [wOptions], a
	ld hl, wOptions
	ld a, [wOptions2CursorX] ; battle animation cursor X coordinate
	lb bc, BIT_BATTLE_ANIMATION, 10
	call SetSingleBitOption
	ld a, [wOptions3CursorX] ; battle style cursor X coordinate
	lb bc, BIT_BATTLE_SHIFT, 10
	; fall through

; option with 2 possible values
; input =
; a = current x value of option
; b = which bit it uses
; c = which x value is considered "bit set"
; hl = where the bit will be set
SetSingleBitOption:
	sub c
	ld c, b
	ld b, FLAG_SET
	jr z, .set
	ld b, FLAG_RESET
.set
	predef_jump FlagActionPredef

LoadXValueAndGetHLCoord:
	hlcoord 0, 0
	push hl
	call GetYCoordAndXVariable
	ld [hl], b ; load x index into wram variable
	pop hl
.loopYAdd
	lb de, 0, SCREEN_WIDTH
	add hl, de
	dec a
	jr nz, .loopYAdd
	ld a, b
	ret

; a = "bit set" x index
; d = "bit not set" x index
; c = which bit to check
; hl = location of bit field
Get2ValueOptionCursorPosition:
	ld b, FLAG_TEST
	push af
	predef FlagActionPredef
	pop af
	ld b, a
	ld a, c
	and a
	ret nz
	ld b, d
	ret

OptionSetCursorPositionActions:
	dw SetTextSpeedCursorPosition
	dw SetBattleAnimationCursorPosition
	dw SetBattleStyleCursorPosition

; reads the options variable and places menu cursors in the correct positions within the options menu
SetCursorPositionsFromOptions:
	push hl
	ld a, [hli]
	ld h, [hl]
	ld l, a ; get address of OptionSetCursorPositionActions
	ld e, 0
.loopActions
	push de
	push hl
	ld a, [hli]
	ld h, [hl]
	ld l, a ; get action within hl
	call hl_caller
	pop hl
	inc hl
	inc hl
	pop de
	inc e
	ld a, [wOptionsPageOptionCount]
	cp e
	jr nz, .loopActions
	pop hl
	ret

PlaceUnfilledRightArrow:
	ld e, a
	ld d, 0
	add hl, de
	ld [hl], "▷"
	ret

SetTextSpeedCursorPosition:
	push de
	ld hl, TextSpeedOptionData + 1
	ld a, [wOptions]
	and TEXT_DELAY_MASK
	ld de, 2
	call IsInArray
	dec hl
	ld b, [hl]
	pop de
	call LoadXValueAndGetHLCoord
	jp PlaceUnfilledRightArrow

SetBattleAnimationCursorPosition:
	ld hl, wOptions
	ld a, 10
	ld c, BIT_BATTLE_ANIMATION
	ld d, 1
	jr SetSingleBitOptionCursorPosition

SetBattleStyleCursorPosition:
	ld hl, wOptions
	ld a, 10
	ld c, BIT_BATTLE_SHIFT
	ld d, 1
	; fall through

SetSingleBitOptionCursorPosition:
	call Get2ValueOptionCursorPosition
	call LoadXValueAndGetHLCoord
	jp PlaceUnfilledRightArrow

; PureRGBnote: CHANGED: x coordinates modified due to text changes for INSTANT speed.
; table that indicates how the 3 text speed options affect frame delays
; Format:
; 00: X coordinate of menu cursor
; 01: delay after printing a letter (in frames)
TextSpeedOptionData:
	db 14, TEXT_DELAY_SLOW
	db  9, TEXT_DELAY_MEDIUM
	db  1, TEXT_DELAY_FAST
	db  9, -1 ; end (default X coordinate)

; PureRGBnote: MOVED: CHANGED: Used to be in main_menu.asm but moved for space. 
; this menu was changed a bit to have a NEXT and BACK button to navigate pages more easily.

CopyOptionsFromSRAM::
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, 1
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamBank], a
	; by checking if a name has been saved we can know if a save file was created
	callfar CheckSaveFileExists
	jr nc, .doneLoad
	ld a, [sOptions2]
	ld [wOptions2], a
	ld a, [sSpriteOptions]
	ld [wSpriteOptions], a
	ld a, [sSpriteOptions3]
	ld [wSpriteOptions3], a
.doneLoad
	xor a
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	ret

OptionsMenu1InfoTextJumpTable:
	dw TextSpeedInfoText
	dw BattleAnimationInfoText
	dw BattleStyleInfoText

TextSpeedInfoText:
	text_far _TextSpeedInfoText
	text_end

BattleAnimationInfoText:
	text_far _BattleAnimationInfoText
	text_end	

BattleStyleInfoText:
	text_far _BattleStyleInfoText
	text_end