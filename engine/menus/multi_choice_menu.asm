; PureRGBnote: ADDED: this code lets you bring up selection lists of 2-6 entries without relying on item menu code.
; INPUT:
; [wListPointer] = address of the text list (2 bytes) (expected to be defined within this bank)
; [wMenuWatchedKeys] = which buttons should exit the menu (like A button for selecting an option)
; Should only be used to display up to 4 options
; OUTPUT: 
; [wCurrentMenuItem] = what was chosen from the menu
DisplayMultiChoiceMenu::
	xor a
	ldh [hAutoBGTransferEnabled], a ; disable auto-transfer
	ld a, 1
	ldh [hJoy7], a ; joypad state update flag
	ld hl, wd730
	set 6, [hl] ; turn off letter printing delay
	ld a, [wListPointer]
	ld l, a
	ld a, [wListPointer + 1]
	ld h, a ; hl = address of the list
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a ; de = address of the text box drawing function to call
	push hl ; address of the start of the text we will draw later
	xor a
	ldh [hAutoBGTransferEnabled], a ; disable transfer
	ld h, d
	ld l, e
	jp hl ; function that draws the textbox

DoneDrawFunc:
	push hl
	call UpdateSprites ; disable sprites behind the text box
	xor a
	ld [wMenuWatchMovingOutOfBounds], a ; enable menu wrapping
	pop hl ; hl = coordinate of the list
	pop de ; de = address of the start of text
	call PlaceString
	ld a, 1
	ldh [hAutoBGTransferEnabled], a ; enable transfer
	call Delay3
	call LoadGBPal
	call HandleMenuInput
	xor a
	ldh [hJoy7], a ; joypad state update flag
	ld hl, wd730
	res 6, [hl] ; turn on letter printing delay
	ret

; multi-option menus can have 2-6 options, visually set up by the below functions

TwoOptionMenu::
	ld a, 1 ; 2-item menu (0 counts)
	ld [wListCount], a
	ld [wMaxMenuItem], a

	ld a, 8
	ld [wTopMenuItemY], a
	ld a, 5
	ld [wTopMenuItemX], a

	hlcoord 4, 7
	ld b, 3  ; height
	ld c, 12 ; width
	call TextBoxBorder

	hlcoord 6, 8 ; where the list will be drawn at
	jp DoneDrawFunc

ThreeOptionMenu::
	ld a, 2 ; 3-item menu (0 counts)
	ld [wListCount], a
	ld [wMaxMenuItem], a

	ld a, 6
	ld [wTopMenuItemY], a
	ld a, 5
	ld [wTopMenuItemX], a

	hlcoord 4, 5
	ld b, 5  ; height
	ld c, 12 ; width
	call TextBoxBorder

	hlcoord 6, 6 ; where the list will be drawn at
	jp DoneDrawFunc

FourOptionMenu::
	ld a, 3 ; 4-item menu (0 counts)
	ld [wListCount], a
	ld [wMaxMenuItem], a

	ld a, 4
	ld [wTopMenuItemY], a
	ld a, 5
	ld [wTopMenuItemX], a

	hlcoord 4, 3
	ld b, 7  ; height
	ld c, 12 ; width
	call TextBoxBorder

	hlcoord 6, 4 ; where the list will be drawn at
	jp DoneDrawFunc

FiveOptionMenu::
	ld a, 4 ; 5-item menu (0 counts)
	ld [wListCount], a
	ld [wMaxMenuItem], a


	ld a, 2
	ld [wTopMenuItemY], a
	ld a, 5
	ld [wTopMenuItemX], a

	hlcoord 4, 1
	ld b, 9  ; height
	ld c, 12 ; width
	call TextBoxBorder
	
	hlcoord 6, 2 ; where the list will be drawn at
	jp DoneDrawFunc

SixOptionMenu::
	ld a, 5 ; 6-item menu (0 counts)
	ld [wListCount], a
	ld [wMaxMenuItem], a

	ld a, 1
	ld [wTopMenuItemY], a
	ld a, 5
	ld [wTopMenuItemX], a

	hlcoord 4, 0
	ld b, 11 ; height
	ld c, 12 ; width
	call TextBoxBorder
	
	hlcoord 6, 1 ; where the list will be drawn at
	jp DoneDrawFunc

; draws a line of tiles
; INPUT:
; b = tile ID
; c = number of tile ID's to write
; de = amount to destination address after each tile (1 for horizontal, 20 for vertical)
; hl = destination address
DrawTileLine2:
	push bc
	push de
.loop
	ld [hl], b
	add hl, de
	dec c
	jr nz, .loop
	pop de
	pop bc
	ret

MoveDexQuestion1::
	dw FourOptionMenu
	db   "FLYING"
	next "NORMAL"
	next "GRASS"
	next "ICE@"

MoveDexQuestion2::
	dw FourOptionMenu
	db   "AGILITY"
	next "QUICK ATTACK"
	next "WHIRLWIND"
	next "PIN MISSILE@"

MoveDexQuestion3::
	dw FourOptionMenu
	db   "BURN"
	next "PARALYZE"
	next "POISON"
	next "FREEZE@"

MoveDexQuestion4::
	dw FourOptionMenu
	db   "DOUBLE KICK"
	next "TRI ATTACK"
	next "TWINEEDLE"
	next "DOUBLESLAP@"

MoveDexQuestion5::
	dw FourOptionMenu
	db   "TACKLE"
	next "GROWL"
	next "TAIL WHIP"
	next "WATER GUN@"

StatTextList::
	dw FiveOptionMenu
	db "HP"
	next "ATTACK"
	next "DEFENSE"
	next "SPEED"
	next "SPECIAL@"
	