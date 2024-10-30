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
	ld a, [wStatusFlags5]
	push af
	set BIT_NO_TEXT_DELAY, a ; turn off letter printing delay
	ld [wStatusFlags5], a
	hl_deref wListPointer ; hl = address of the list
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
	CheckAndResetEvent FLAG_SKIP_MULTI_CHOICE_LOADGBPAL
	call z, LoadGBPal
	call HandleMenuInput
	xor a
	ldh [hJoy7], a ; joypad state update flag
	pop af
	ld [wStatusFlags5], a ; reset letter printing delay to what it was before calling this function
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
	lb bc, 3, 14  ; height, width
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
	lb bc, 3, 5  ; height, width
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
	lb bc, 5, 13  ; height, width
	call TextBoxBorder

	hlcoord 6, 6 ; where the list will be drawn at
	jp DoneDrawFunc

InitThreeOptionMenuSmall::
	ld [wTopMenuItemY], a
	ld a, 2 ; 3-item menu (0 counts)
	ld [wListCount], a
	ld [wMaxMenuItem], a
	ld a, 12
	ld [wTopMenuItemX], a
	lb bc, 5, 7 ; height, width
	ret

ThreeOptionMenuSmall::
	ld a, 6
	call InitThreeOptionMenuSmall
	hlcoord 11, 5
	call TextBoxBorder

	hlcoord 13, 6 ; where the list will be drawn at
	jp DoneDrawFunc

ThreeOptionMenuSmallLower::
	ld a, 8
	call InitThreeOptionMenuSmall
	hlcoord 11, 7
	call TextBoxBorder

	hlcoord 13, 8 ; where the list will be drawn at
	jp DoneDrawFunc


FourOptionMenuBig::
	ld c, 14 ; width
	jr FourOptionMenuCommon

FourOptionMenu::
	ld c, 13 ; width
	; fall through
FourOptionMenuCommon::
	ld a, 3 ; 4-item menu (0 counts)
	ld [wListCount], a
	ld [wMaxMenuItem], a

	ld a, 4
	ld [wTopMenuItemY], a
	ld a, 5
	ld [wTopMenuItemX], a

	hlcoord 4, 3
	ld b, 7  ; height
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
	lb bc, 9, 13  ; height, width
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
	lb bc, 11, 13 ; height, width
	call TextBoxBorder
	
	hlcoord 6, 1 ; where the list will be drawn at
	jp DoneDrawFunc

ChampArenaMusicSelectMenu::
	;ld a, [wChampArenaChallenger]
	;cp 13 ; last challenger (blue)
	ld a, 2
	ld [wListCount], a
	ld [wMaxMenuItem], a

	ld a, 6
	ld [wTopMenuItemY], a
	ld a, 5
	ld [wTopMenuItemX], a

	hlcoord 4, 5
	lb bc, 5, 13  ; height, width
	call TextBoxBorder
	call UpdateSprites ; disable sprites behind the text box
	xor a
	ld [wMenuWatchMovingOutOfBounds], a ; enable menu wrapping

	hlcoord 6, 6 ; where the list will be drawn at
	ld de, ClassicText
	call PlaceString

	pop hl ; hl = which music name will be printed next
	ld a, [hli]
	push hl
	; get name into de
	call GetChampArenaMusicName
	ld d, h
	ld e, l
	hlcoord 6, 8
	call PlaceString

	pop hl ; hl = which music name will be printed next
	ld a, [hl]
	; get name into de
	call GetChampArenaMusicName
	ld d, h
	ld e, l
	hlcoord 6, 10
	call PlaceString

	ld a, 1
	ldh [hAutoBGTransferEnabled], a ; enable transfer
	call Delay3
	call LoadGBPal
	call HandleMenuInput
	xor a
	ldh [hJoy7], a ; joypad state update flag
	pop af
	ld [wStatusFlags5], a ; reset letter printing delay to what it was before calling this function
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
	
YesNoHide::
	dw ThreeOptionMenuSmall
	db "YES"
	next "NO"
	next "HIDE@"

YesNoHideTM::
	dw ThreeOptionMenuSmallLower
	db "YES"
	next "NO"
	next "HIDE@"

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

TreeDeleterOptions::
	dw FourOptionMenuBig
	db "ROUTE 2"
	next "CERULEAN CITY"
	next "ROUTE 9"
	next "FUCHSIA CITY@"

SafariTypeOptions::
	dw ThreeOptionMenu
	db "CLASSIC"
	next "RANGER HUNT"
	next "FREE ROAM@"

ClassicText:
	db "CLASSIC@"

TitleText:
	db "TITLE@"

ChampArenaMusicSelectErika::
	dw ChampArenaMusicSelectMenu
	db 0, 1

ChampArenaMusicSelectBlaine::
	dw ChampArenaMusicSelectMenu
	db 2, 3

ChampArenaMusicSelectSurge::
	dw ChampArenaMusicSelectMenu
	db 4, 5

ChampArenaMusicSelectSabrina::
	dw ChampArenaMusicSelectMenu
	db 6, 7

ChampArenaMusicSelectBruno::
	dw ChampArenaMusicSelectMenu
	db 8, 9

ChampArenaMusicSelectMisty::
	dw ChampArenaMusicSelectMenu
	db 0, 3

ChampArenaMusicSelectLance::
	dw ChampArenaMusicSelectMenu
	db 6, 8

ChampArenaMusicSelectKoga::
	dw ChampArenaMusicSelectMenu
	db 9, 10

ChampArenaMusicSelectLorelei::
	dw ChampArenaMusicSelectMenu
	db 1, 6

ChampArenaMusicSelectBrock::
	dw ChampArenaMusicSelectMenu
	db 5, 2

ChampArenaMusicSelectAgatha::
	dw ChampArenaMusicSelectMenu
	db 10, 8

ChampArenaMusicSelectGymGuide::
	dw ChampArenaMusicSelectMenu
	db 7, 3

ChampArenaMusicSelectBlue::
	dw FourOptionMenu
	db "CLASSIC"
	next "COOL"
	next "FRIENDLY"
	next "TITLE@"

GetChampArenaMusicNameIntoWRAM:
	ld a, [wNamedObjectIndex]
	and a
	ld hl, ClassicText
	jr z, .loadNameIntoWram
	cp 12
	ld hl, TitleText
	jr z, .loadNameIntoWram
	dec a
	call GetChampArenaMusicName
.loadNameIntoWram
	ld de, wNameBuffer
.loop
	ld a, [hli]
	ld [de], a
	cp "@"
	jr z, .done
	inc de
	jr .loop
.done
	ld de, wNameBuffer
	ret

GetChampArenaMusicName:
	ld hl, ChampArenaMusicTextData
	and a
	ret z
	ld b, a ; b = which name in the list it is
.loop
	ld a, [hli]
	cp "@"
	jr nz, .loop
	dec b
	ret z
	jr .loop

ChampArenaMusicTextData::
	li "FRIENDLY"
	li "CUTE"
	li "MACHO"
	li "JAZZY"
	li "COOL"
	li "ROCKIN"
	li "ANTHEMIC"
	li "GENIUS"
	li "SERIOUS"
	li "INSPIRING"
	li "TENSE"
	db -1

ConversionMenu::
	dw TwoOptionMenu
	db "ATTACK"
	next "DEFENSE@"

SSAnneFoodMenu::
	dw FourOptionMenu
	db "Barbecue Eel"
	next "Prime Steak"
	next "Salmon Salad"
	next "Cherry Pie@"

RocketPasswordMenu::
	dw FourOptionMenu
	db "<ROCKET>"
	next "B<ROCKET>"
	next "SP<ROCKET>"
	next "DENNIS@"

SaveFileUpdaterMenu::
	dw TwoOptionMenu
	db "Before v2.6.0"
	next "Original Game@"