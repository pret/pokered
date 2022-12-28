; function to draw various text boxes
DisplayTextBoxID_::
	ld a, [wTextBoxID]
	cp TWO_OPTION_MENU
	jp z, DisplayTwoOptionMenu
	ld c, a
	ld hl, TextBoxFunctionTable
	ld de, 3
	call SearchTextBoxTable
	jr c, .functionTableMatch
	ld hl, TextBoxCoordTable
	ld de, 5
	call SearchTextBoxTable
	jr c, .coordTableMatch
	ld hl, TextBoxTextAndCoordTable
	ld de, 9
	call SearchTextBoxTable
	jr c, .textAndCoordTableMatch
.done
	ret
.functionTableMatch
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl = address of function
	ld de, .done
	push de
	jp hl ; jump to the function
.coordTableMatch
	call GetTextBoxIDCoords
	call GetAddressOfScreenCoords
	call TextBoxBorder
	ret
.textAndCoordTableMatch
	call GetTextBoxIDCoords
	push hl
	call GetAddressOfScreenCoords
	call TextBoxBorder
	pop hl
	call GetTextBoxIDText
	ld a, [wd730]
	push af
	ld a, [wd730]
	set 6, a ; no pauses between printing each letter
	ld [wd730], a
	call PlaceString
	pop af
	ld [wd730], a
	call UpdateSprites
	ret

; function to search a table terminated with $ff for a byte matching c in increments of de
; sets carry flag if a match is found and clears carry flag if not
SearchTextBoxTable:
	dec de
.loop
	ld a, [hli]
	cp $ff
	jr z, .notFound
	cp c
	jr z, .found
	add hl, de
	jr .loop
.found
	scf
.notFound
	ret

; function to load coordinates from the TextBoxCoordTable or the TextBoxTextAndCoordTable
; INPUT:
; hl = address of coordinates
; OUTPUT:
; b = height
; c = width
; d = row of upper left corner
; e = column of upper left corner
GetTextBoxIDCoords:
	ld a, [hli] ; column of upper left corner
	ld e, a
	ld a, [hli] ; row of upper left corner
	ld d, a
	ld a, [hli] ; column of lower right corner
	sub e
	dec a
	ld c, a     ; c = width
	ld a, [hli] ; row of lower right corner
	sub d
	dec a
	ld b, a     ; b = height
	ret

; function to load a text address and text coordinates from the TextBoxTextAndCoordTable
GetTextBoxIDText:
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a ; de = address of text
	push de ; save text address
	ld a, [hli]
	ld e, a ; column of upper left corner of text
	ld a, [hl]
	ld d, a ; row of upper left corner of text
	call GetAddressOfScreenCoords
	pop de ; restore text address
	ret

; function to point hl to the screen coordinates
; INPUT:
; d = row
; e = column
; OUTPUT:
; hl = address of upper left corner of text box
GetAddressOfScreenCoords:
	push bc
	hlcoord 0, 0
	ld bc, 20
.loop ; loop to add d rows to the base address
	ld a, d
	and a
	jr z, .addedRows
	add hl, bc
	dec d
	jr .loop
.addedRows
	pop bc
	add hl, de
	ret

INCLUDE "data/text_boxes.asm"

DisplayMoneyBox:
	ld hl, wd730
	set 6, [hl]
	ld a, MONEY_BOX_TEMPLATE
	ld [wTextBoxID], a
	call DisplayTextBoxID
	hlcoord 13, 1
	ld b, 1
	ld c, 6
	call ClearScreenArea
	hlcoord 12, 1
	ld de, wPlayerMoney
	ld c, $a3
	call PrintBCDNumber
	ld hl, wd730
	res 6, [hl]
	ret

CurrencyString:
	db "      ¥@"

DoBuySellQuitMenu:
	ld a, [wd730]
	set 6, a ; no printing delay
	ld [wd730], a
	xor a
	ld [wChosenMenuItem], a
	ld a, BUY_SELL_QUIT_MENU_TEMPLATE
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, $2
	ld [wMaxMenuItem], a
	ld a, $1
	ld [wTopMenuItemY], a
	ld a, $1
	ld [wTopMenuItemX], a
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wMenuWatchMovingOutOfBounds], a
	ld a, [wd730]
	res 6, a ; turn on the printing delay
	ld [wd730], a
	call HandleMenuInput
	call PlaceUnfilledArrowMenuCursor
	bit BIT_A_BUTTON, a
	jr nz, .pressedA
	bit BIT_B_BUTTON, a ; always true since only A/B are watched
	jr z, .pressedA
	ld a, CANCELLED_MENU
	ld [wMenuExitMethod], a
	jr .quit
.pressedA
	ld a, CHOSE_MENU_ITEM
	ld [wMenuExitMethod], a
	ld a, [wCurrentMenuItem]
	ld [wChosenMenuItem], a
	ld b, a
	ld a, [wMaxMenuItem]
	cp b
	jr z, .quit
	ret
.quit
	ld a, CANCELLED_MENU
	ld [wMenuExitMethod], a
	ld a, [wCurrentMenuItem]
	ld [wChosenMenuItem], a
	scf
	ret

; displays a menu with two options to choose from
; b = Y of upper left corner of text region
; c = X of upper left corner of text region
; hl = address where the text box border should be drawn
DisplayTwoOptionMenu:
	push hl
	ld a, [wd730]
	set 6, a ; no printing delay
	ld [wd730], a

; pointless because both values are overwritten before they are read
	xor a
	ld [wChosenMenuItem], a
	ld [wMenuExitMethod], a

	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, $1
	ld [wMaxMenuItem], a
	ld a, b
	ld [wTopMenuItemY], a
	ld a, c
	ld [wTopMenuItemX], a
	xor a
	ld [wLastMenuItem], a
	ld [wMenuWatchMovingOutOfBounds], a
	push hl
	ld hl, wTwoOptionMenuID
	bit 7, [hl] ; select second menu item by default?
	res 7, [hl]
	jr z, .storeCurrentMenuItem
	inc a
.storeCurrentMenuItem
	ld [wCurrentMenuItem], a
	pop hl
	push hl
	push hl
	call TwoOptionMenu_SaveScreenTiles
	ld a, [wTwoOptionMenuID]
	ld hl, TwoOptionMenuStrings
	ld e, a
	ld d, $0
	ld a, $5
.menuStringLoop
	add hl, de
	dec a
	jr nz, .menuStringLoop
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld e, l
	ld d, h
	pop hl
	push de
	ld a, [wTwoOptionMenuID]
	cp TRADE_CANCEL_MENU
	jr nz, .notTradeCancelMenu
	call CableClub_TextBoxBorder
	jr .afterTextBoxBorder
.notTradeCancelMenu
	call TextBoxBorder
.afterTextBoxBorder
	call UpdateSprites
	pop hl
	ld a, [hli]
	and a ; put blank line before first menu item?
	ld bc, 20 + 2
	jr z, .noBlankLine
	ld bc, 2 * 20 + 2
.noBlankLine
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	pop hl
	add hl, bc
	call PlaceString
	ld hl, wd730
	res 6, [hl] ; turn on the printing delay
	ld a, [wTwoOptionMenuID]
	cp NO_YES_MENU
	jr nz, .notNoYesMenu
; No/Yes menu
; this menu type ignores the B button
; it only seems to be used when confirming the deletion of a save file
	xor a
	ld [wTwoOptionMenuID], a
	ld a, [wFlags_0xcd60]
	push af
	push hl
	ld hl, wFlags_0xcd60
	bit 5, [hl]
	set 5, [hl] ; don't play sound when A or B is pressed in menu
	pop hl
.noYesMenuInputLoop
	call HandleMenuInput
	bit BIT_B_BUTTON, a
	jr nz, .noYesMenuInputLoop ; try again if B was not pressed
	pop af
	pop hl
	ld [wFlags_0xcd60], a
	ld a, SFX_PRESS_AB
	call PlaySound
	jr .pressedAButton
.notNoYesMenu
	xor a
	ld [wTwoOptionMenuID], a
	call HandleMenuInput
	pop hl
	bit BIT_B_BUTTON, a
	jr nz, .choseSecondMenuItem ; automatically choose the second option if B is pressed
.pressedAButton
	ld a, [wCurrentMenuItem]
	ld [wChosenMenuItem], a
	and a
	jr nz, .choseSecondMenuItem
; chose first menu item
	ld a, CHOSE_FIRST_ITEM
	ld [wMenuExitMethod], a
	ld c, 15
	call DelayFrames
	call TwoOptionMenu_RestoreScreenTiles
	and a
	ret
.choseSecondMenuItem
	ld a, 1
	ld [wCurrentMenuItem], a
	ld [wChosenMenuItem], a
	ld a, CHOSE_SECOND_ITEM
	ld [wMenuExitMethod], a
	ld c, 15
	call DelayFrames
	call TwoOptionMenu_RestoreScreenTiles
	scf
	ret

; Some of the wider/taller two option menus will not have the screen areas
; they cover be fully saved/restored by the two functions below.
; The bottom and right edges of the menu may remain after the function returns.

TwoOptionMenu_SaveScreenTiles:
	ld de, wBuffer
	lb bc, 5, 6
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	push bc
	ld bc, SCREEN_WIDTH - 6
	add hl, bc
	pop bc
	ld c, $6
	dec b
	jr nz, .loop
	ret

TwoOptionMenu_RestoreScreenTiles:
	ld de, wBuffer
	lb bc, 5, 6
.loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .loop
	push bc
	ld bc, SCREEN_WIDTH - 6
	add hl, bc
	pop bc
	ld c, 6
	dec b
	jr nz, .loop
	call UpdateSprites
	ret

INCLUDE "data/yes_no_menu_strings.asm"

DisplayFieldMoveMonMenu:
	xor a
	ld hl, wFieldMoves
	ld [hli], a ; wFieldMoves
	ld [hli], a ; wFieldMoves + 1
	ld [hli], a ; wFieldMoves + 2
	ld [hli], a ; wFieldMoves + 3
	ld [hli], a ; wNumFieldMoves
	ld [hl], 12 ; wFieldMovesLeftmostXCoord
	call GetMonFieldMoves
	ld a, [wNumFieldMoves]
	and a
	jr nz, .fieldMovesExist

; no field moves
	hlcoord 11, 11
	ld b, 5
	ld c, 7
	call TextBoxBorder
	call UpdateSprites
	ld a, 12
	ldh [hFieldMoveMonMenuTopMenuItemX], a
	hlcoord 13, 12
	ld de, PokemonMenuEntries
	jp PlaceString

.fieldMovesExist
	push af

; Calculate the text box position and dimensions based on the leftmost X coord
; of the field move names before adjusting for the number of field moves.
	hlcoord 0, 11
	ld a, [wFieldMovesLeftmostXCoord]
	dec a
	ld e, a
	ld d, 0
	add hl, de
	ld b, 5
	ld a, 18
	sub e
	ld c, a
	pop af

; For each field move, move the top of the text box up 2 rows while the leaving
; the bottom of the text box at the bottom of the screen.
	ld de, -SCREEN_WIDTH * 2
.textBoxHeightLoop
	add hl, de
	inc b
	inc b
	dec a
	jr nz, .textBoxHeightLoop

; Make space for an extra blank row above the top field move.
	ld de, -SCREEN_WIDTH
	add hl, de
	inc b

	call TextBoxBorder
	call UpdateSprites

; Calculate the position of the first field move name to print.
	hlcoord 0, 12
	ld a, [wFieldMovesLeftmostXCoord]
	inc a
	ld e, a
	ld d, 0
	add hl, de
	ld de, -SCREEN_WIDTH * 2
	ld a, [wNumFieldMoves]
.calcFirstFieldMoveYLoop
	add hl, de
	dec a
	jr nz, .calcFirstFieldMoveYLoop

	xor a
	ld [wNumFieldMoves], a
	ld de, wFieldMoves
.printNamesLoop
	push hl
	ld hl, FieldMoveNames
	ld a, [de]
	and a
	jr z, .donePrintingNames
	inc de
	ld b, a ; index of name
.skipNamesLoop ; skip past names before the name we want
	dec b
	jr z, .reachedName
.skipNameLoop ; skip past current name
	ld a, [hli]
	cp "@"
	jr nz, .skipNameLoop
	jr .skipNamesLoop
.reachedName
	ld b, h
	ld c, l
	pop hl
	push de
	ld d, b
	ld e, c
	call PlaceString
	ld bc, SCREEN_WIDTH * 2
	add hl, bc
	pop de
	jr .printNamesLoop

.donePrintingNames
	pop hl
	ld a, [wFieldMovesLeftmostXCoord]
	ldh [hFieldMoveMonMenuTopMenuItemX], a
	hlcoord 0, 12
	ld a, [wFieldMovesLeftmostXCoord]
	inc a
	ld e, a
	ld d, 0
	add hl, de
	ld de, PokemonMenuEntries
	jp PlaceString

INCLUDE "data/moves/field_move_names.asm"

PokemonMenuEntries:
	db   "STATS"
	next "SWITCH"
	next "CANCEL@"

GetMonFieldMoves:
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld d, h
	ld e, l
	ld c, NUM_MOVES + 1
	ld hl, wFieldMoves
.loop
	push hl
.nextMove
	dec c
	jr z, .done
	ld a, [de] ; move ID
	and a
	jr z, .done
	ld b, a
	inc de
	ld hl, FieldMoveDisplayData
.fieldMoveLoop
	ld a, [hli]
	cp $ff
	jr z, .nextMove ; if the move is not a field move
	cp b
	jr z, .foundFieldMove
	inc hl
	inc hl
	jr .fieldMoveLoop
.foundFieldMove
	ld a, b
	ld [wLastFieldMoveID], a
	ld a, [hli] ; field move name index
	ld b, [hl] ; field move leftmost X coordinate
	pop hl
	ld [hli], a ; store name index in wFieldMoves
	ld a, [wNumFieldMoves]
	inc a
	ld [wNumFieldMoves], a
	ld a, [wFieldMovesLeftmostXCoord]
	cp b
	jr c, .skipUpdatingLeftmostXCoord
	ld a, b
	ld [wFieldMovesLeftmostXCoord], a
.skipUpdatingLeftmostXCoord
	ld a, [wLastFieldMoveID]
	ld b, a
	jr .loop
.done
	pop hl
	ret

INCLUDE "data/moves/field_moves.asm"
