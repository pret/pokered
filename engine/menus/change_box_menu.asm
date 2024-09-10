LoadBillsPCExtraTiles::
	ld hl, vChars2 tile $78
	ld de, PokeballTileGraphics ; pokeball tile
	lb bc, BANK(PokeballTileGraphics), 1
	call CopyVideoData
	ld hl, vChars2 tile $77
	ld de, PokeballTileGraphics tile 2 ; pokeball with x tile
	lb bc, BANK(PokeballTileGraphics), 1
	call CopyVideoData
	ld de, HpBarAndStatusGraphics tile 18 ; "No" tile
	ld hl, vChars2 tile $76
	lb bc, BANK(HpBarAndStatusGraphics), 1
	call CopyVideoData
	ld de, ExtraMenuBorderConnectors
	ld hl, vChars1 tile $40
	lb bc, BANK(ExtraMenuBorderConnectors), 8
	call CopyVideoDataDouble
	ld de, FromToChangeBoxPrompt
	ld hl, vChars1 tile $48
	lb bc, BANK(FromToChangeBoxPrompt), 5
	jp CopyVideoDataDouble

; PureRGBnote: MOVED: moved from save.asm to here since it didn't rely on much from the other file
; this function was updated a bunch to display extra information about boxes and reformat the layout
DisplayChangeBoxMenu:
	xor a
	ldh [hAutoBGTransferEnabled], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, 11
	ld [wMaxMenuItem], a
	ld a, 1
	ld [wTopMenuItemY], a
	ld a, 7
	ld [wTopMenuItemX], a
	xor a
	ld [wMenuWatchMovingOutOfBounds], a
	ld a, [wCurrentBoxNum]
	and %01111111
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a

	decoord 0, 0
	call DrawCurrentBoxPrompt
	CheckEvent EVENT_HIDE_CHANGE_BOX_SAVE_MSG
	ld hl, ChooseABoxDataWillSaveText
	jr nz, .printPrompt
	ld hl, ChooseABoxText
.printPrompt
	rst _PrintText
	hlcoord 6, 0
	lb bc, 12, 12
	call TextBoxBorder
.addExtraBorder
	ld a, $C0 ; menu connector 1
	ldcoord_a 6, 0 
	ld a, $C1 ; menu connector 2
	ldcoord_a 19, 13 
	ld a, $C4 ; menu connector 5
	ldcoord_a 6, 4 
	ldcoord_a 6, 12
	ld de, 1
	lb bc, $C8, 3 ; start of FROM prompt
	hlcoord 1, 0
	call DrawTileLineIncrement
	lb bc, $CB, 2 ; start of TO prompt
	hlcoord 7, 0
	call DrawTileLineIncrement

	callfar GetMonCountsForAllBoxes

	hlcoord 8, 1
	ld de, wBoxMonCounts
	ld bc, SCREEN_WIDTH
	ld a, NUM_BOXES
.loop
	push af
	push hl
	push bc
	push de
	n_sub_a NUM_BOXES + 1
	push af
	ld de, BoxText
	call PlaceString 
	lb bc, 0, 3
	add hl, bc
	pop af
	ld de, wSum
	ld [de], a
	lb bc, 1, 2
	call PrintNumber
	pop de
	ld a, [de]
	and a ; is the box empty?
	jr z, .boxEmpty ; don't print anything beside it
	push af
	cp MONS_PER_BOX
	ld a, $78 ; pokeball tile
	jr nz, .placeBallTile
	ld a, $77 ; ball tile with X on top
.placeBallTile
	ld [hli], a ; place pokeball tile next to box name if box not empty
.placeBoxCount
	pop af
	push de
	ld de, wSum
	ld [de], a
	lb bc, 1, 2
	call PrintNumber
	ld de, BoxOutOf20
	call PlaceString
	pop de
.boxEmpty
	pop bc
	pop hl
	add hl, bc
	inc de
	pop af
	dec a
	jr nz, .loop
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	ret

ChooseABoxText:
	text_far _ChooseABoxText
	text_end

ChooseABoxDataWillSaveText:
	text_far _ChooseABoxDataWillSaveText
	text_end

; draws a box that says info about the current box (used in pc and change box menus)
; input = de, top left coord of the prompt box
DrawCurrentBoxPrompt::
	ld h, d
	ld l, e
	push hl
	lb bc, 3, 5
	call TextBoxBorder
	pop hl
	inc_hl_ycoord
	inc hl
	ld de, BoxText
	call PlaceString
	inc_hl_ycoord
	push hl
	ld a, $76 ; "No" tile
	ld [hli], a
	ld a, "."
	ld [hli], a
	ld a, [wCurrentBoxNum]
	and $7f
	cp 9
	jr c, .singleDigitBoxNum
	sub 9
	ld [hl], "1"
	inc hl
	add NUMBER_CHAR_OFFSET
	jr .next
.singleDigitBoxNum
	add NUMBER_CHAR_OFFSET + 1 ; wCurrentBoxNum starts at 0 so we need to increment it by 1
.next
	ld [hli], a
	pop hl
	push hl
	lb de, 0, 4
	add hl, de
	ld a, [wBoxCount]
	push af
	and a
	jr z, .noBallTile
	cp 20
	ld a, $78 ; normal pokeball tile
	jr nz, .loadBallTile
	ld a, $77 ; x over pokeball tile
.loadBallTile
	ld [hl], a
.noBallTile
	pop af
	pop hl
	inc_hl_ycoord
	ld de, wSum
	ld [de], a
	lb bc, 1, 2
	call PrintNumber
	ld de, BoxOutOf20
	jp PlaceString

BoxText:
	db "BOX@"
BoxOutOf20:
	db "/20@"
