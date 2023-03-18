; PureRGBnote: ADDED: this code lets you bring up selection lists of 2-6 entries without relying on item menu code.
; INPUT:
; [wListPointer] = address of the text list (2 bytes) (expected to be defined within this bank)
; [wMenuWatchedKeys] = which buttons should exit the menu (like A button for selecting an option)
; Should only be used to display up to 6 options
; OUTPUT: 
; [wCurrentMenuItem] = what was chosen from the menu
DisplayMultiChoiceMenu::
	xor a
	ldh [hAutoBGTransferEnabled], a ; disable auto-transfer
	ld a, 1
	ldh [hJoy7], a ; joypad state update flag
	ld a, [wd730]
	push af
	set 6, a ; turn off letter printing delay
	ld [wd730], a
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
	pop af
	ld [wd730], a ; reset letter printing delay to what it was before calling this function
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
	ld c, 14 ; width
	call TextBoxBorder

	hlcoord 6, 8 ; where the list will be drawn at
	jp DoneDrawFunc

TwoOptionSmallMenu::
	ld a, 1 ; 2-item menu (0 counts)
	ld [wListCount], a
	ld [wMaxMenuItem], a

	ld a, 8
	ld [wTopMenuItemY], a
	ld a, 14
	ld [wTopMenuItemX], a

	hlcoord 13, 7
	ld b, 3  ; height
	ld c, 5 ; width
	call TextBoxBorder

	hlcoord 15, 8 ; where the list will be drawn at
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
	ld c, 13 ; width
	call TextBoxBorder

	hlcoord 6, 6 ; where the list will be drawn at
	jp DoneDrawFunc

ThreeOptionMenuSmall::
	ld a, 2 ; 4-item menu (0 counts)
	ld [wListCount], a
	ld [wMaxMenuItem], a

	ld a, 6
	ld [wTopMenuItemY], a
	ld a, 12
	ld [wTopMenuItemX], a

	hlcoord 11, 5
	ld b, 5 ; height
	ld c, 7 ; width
	call TextBoxBorder

	hlcoord 13, 6 ; where the list will be drawn at
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
	ld c, 13 ; width
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
	ld c, 13 ; width
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
	ld c, 13 ; width
	call TextBoxBorder
	
	hlcoord 6, 1 ; where the list will be drawn at
	jp DoneDrawFunc

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
	
YesNoSkip::
	dw ThreeOptionMenuSmall
	db "YES"
	next "NO"
	next "SKIP@"

YesNoSmall::
	dw TwoOptionSmallMenu
	db "YES"
	next "NO@"

CeladonMartPhoneList::
	dw ThreeOptionMenu
	db "HOME"
	next "PROF.OAK"
	next "<RIVAL>@"

CeladonMartCallMomQuestion1::
	dw ThreeOptionMenu
	db "Great!"
	next "Bored"
	next "Homesick@"
	
CeladonMartCallMomQuestion2::
	dw TwoOptionMenu
	db "Good idea!"
	next "It's gambling!@"

CeladonMartCallMomQuestion3::
	dw FourOptionMenu
	db "Rice Balls"
	next "Jelly Donuts"
	next "Brisket"
	next "Lasagna@"
	
CeladonMartCallMomQuestion4::
	dw ThreeOptionMenu
	db "See ya!"
	next "Sayonara!"
	next "Love you!@"
	
CeladonMartCallOakQuestion1::
	dw TwoOptionMenu
	db "It evolved!"
	next "I love it!@"

CeladonMartCallOakQuestion2::
	dw TwoOptionMenu
	db "How's the lab?"
	next "How's DAISY?@"

BillsGardenBlueThanks::
	dw TwoOptionMenu
	db "Thank you!"
	next "You wish.@"
