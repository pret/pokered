LoadDefaultNamesPlayer: ; 695d (1:695d)
	call Func_6a12
	ld de, DefaultNamesPlayer ; $6aa8
	call DisplayIntroNameTextBox
	ld a, [wCurrentMenuItem] ; wCurrentMenuItem
	and a
	jr z, .asm_697a
	ld hl, DefaultNamesPlayerList ; $6af2
	call Func_6ad6
	ld de, wPlayerName ; wd158
	call Func_69ec
	jr .asm_6999
.asm_697a
	ld hl, wPlayerName ; wd158
	xor a
	ld [wd07d], a
	call DisplayNamingScreen
	ld a, [wcf4b]
	cp $50
	jr z, .asm_697a
	call ClearScreen
	call Delay3
	ld de, RedPicFront ; $6ede
	ld b, BANK(RedPicFront)
	call IntroPredef3B
.asm_6999
	ld hl, YourNameIsText
	jp PrintText

YourNameIsText: ; 699f (1:699f)
	TX_FAR _YourNameIsText
	db "@"

LoadDefaultNamesRival: ; 69a4 (1:69a4)
	call Func_6a12 ; 0x69a4 call 0x6a12
	ld de, DefaultNamesRival
	call DisplayIntroNameTextBox
	ld a, [wCurrentMenuItem] ; wCurrentMenuItem
	and a
	jr z, .asm_69c1
	ld hl, DefaultNamesRivalList
	call Func_6ad6
	ld de, W_RIVALNAME ; wd34a
	call Func_69ec
	jr .asm_69e1
.asm_69c1
	ld hl, W_RIVALNAME ; wd34a
	ld a, $1
	ld [wd07d], a
	call DisplayNamingScreen
	ld a, [wcf4b]
	cp $50
	jr z, .asm_69c1
	call ClearScreen
	call Delay3
	ld de, Rival1Pic ; $6049
	ld b, $13
	call IntroPredef3B
.asm_69e1
	ld hl, HisNameIsText
	jp PrintText

HisNameIsText: ; 69e7 (1:69e7)
	TX_FAR _HisNameIsText
	db "@"

Func_69ec: ; 69ec (1:69ec)
	push de
	ld hl, wTileMap
	ld bc, $c0b
	call ClearScreenArea
	ld c, $a
	call DelayFrames
	pop de
	ld hl, wcd6d
	ld bc, $b
	call CopyData
	call Delay3
	hlCoord 12, 4
	ld de, $67d
	ld a, $ff
	jr asm_6a19

Func_6a12: ; 6a12 (1:6a12)
	hlCoord 5, 4
	ld de, $67d
	xor a
asm_6a19: ; 6a19 (1:6a19)
	push hl
	push de
	push bc
	ld [$ff8d], a
	ld a, d
	ld [H_DOWNARROWBLINKCNT1], a ; $ff8b
	ld a, e
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	ld c, a
	ld a, [$ff8d]
	and a
	jr nz, .asm_6a2d
	ld d, $0
	add hl, de
.asm_6a2d
	ld d, h
	ld e, l
.asm_6a2f
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ld a, [$ff8d]
	and a
	jr nz, .asm_6a3c
	ld a, [hli]
	ld [hld], a
	dec hl
	jr .asm_6a3f
.asm_6a3c
	ld a, [hld]
	ld [hli], a
	inc hl
.asm_6a3f
	dec c
	jr nz, .asm_6a2f
	ld a, [$ff8d]
	and a
	jr z, .asm_6a4a
	xor a
	dec hl
	ld [hl], a
.asm_6a4a
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	call Delay3
	ld a, [H_DOWNARROWBLINKCNT2] ; $ff8c
	ld c, a
	ld h, d
	ld l, e
	ld a, [$ff8d]
	and a
	jr nz, .asm_6a5e
	inc hl
	jr .asm_6a5f
.asm_6a5e
	dec hl
.asm_6a5f
	ld d, h
	ld e, l
	ld a, [H_DOWNARROWBLINKCNT1] ; $ff8b
	dec a
	ld [H_DOWNARROWBLINKCNT1], a ; $ff8b
	jr nz, .asm_6a2f
	pop bc
	pop de
	pop hl
	ret

DisplayIntroNameTextBox: ; 6a6c (1:6a6c)
	push de
	ld hl, wTileMap
	ld b, $a
	ld c, $9
	call TextBoxBorder
	hlCoord 3, 0
	ld de, .namestring ; $6aa3
	call PlaceString
	pop de
	hlCoord 2, 2
	call PlaceString
	call UpdateSprites
	xor a
	ld [wCurrentMenuItem], a ; wCurrentMenuItem
	ld [wLastMenuItem], a ; wLastMenuItem
	inc a
	ld [wTopMenuItemX], a ; wTopMenuItemX
	ld [wMenuWatchedKeys], a ; wMenuWatchedKeys
	inc a
	ld [wTopMenuItemY], a ; wTopMenuItemY
	inc a
	ld [wMaxMenuItem], a ; wMaxMenuItem
	jp HandleMenuInput

.namestring ; 6aa3 (1:6aa3)
	db "NAME@"

IF DEF(_RED)
DefaultNamesPlayer: ; 6aa8 (1:6aa8)
	db   "NEW NAME"
	next "RED"
	next "ASH"
	next "JACK"
	db   "@"

DefaultNamesRival: ; 6abe (1:6abe)
	db   "NEW NAME"
	next "BLUE"
	next "GARY"
	next "JOHN"
	db   "@"
ENDC

IF DEF(_BLUE)
DefaultNamesPlayer: ; 6aa8 (1:6aa8)
	db   "NEW NAME"
	next "BLUE"
	next "GARY"
	next "JOHN"
	db   "@"

DefaultNamesRival: ; 6abe (1:6abe)
	db   "NEW NAME"
	next "RED"
	next "ASH"
	next "JACK"
	db   "@"
ENDC

IF DEF(_YELLOW)
DefaultNamesPlayer:
	db   "NEW NAME"
	next "YELLOW"
	next "ASH"
	next "JACK"
	db   "@"

DefaultNamesRival:
	db   "NEW NAME"
	next "BLUE"
	next "GARY"
	next "JOHN"
	db   "@"
ENDC

Func_6ad6: ; 6ad6 (1:6ad6)
	ld b, a
	ld c, $0
.asm_6ad9
	ld d, h
	ld e, l
.asm_6adb
	ld a, [hli]
	cp $50
	jr nz, .asm_6adb
	ld a, b
	cp c
	jr z, .asm_6ae7
	inc c
	jr .asm_6ad9
.asm_6ae7
	ld h, d
	ld l, e
	ld de, wcd6d
	ld bc, $14
	jp CopyData
IF DEF(_RED)
DefaultNamesPlayerList: ; 6af2 (1:6af2)
	db "NEW NAME@RED@ASH@JACK@"
DefaultNamesRivalList: ; 6b08 (1:6b08)
	db "NEW NAME@BLUE@GARY@JOHN@"
ENDC
IF DEF(_BLUE)
DefaultNamesPlayerList: ; 6af2 (1:6af2)
	db "NEW NAME@BLUE@GARY@JOHN@"
DefaultNamesRivalList: ; 6b08 (1:6b08)
	db "NEW NAME@RED@ASH@JACK@"
ENDC
IF DEF(_YELLOW)
DefaultNamesPlayerList:
	db "NEW NAME@YELLOW@ASH@JACK@"
DefaultNamesRivalList:
	db "NEW NAME@BLUE@GARY@JOHN@"
ENDC

TextTerminator_6b20: ; 6b20 (1:6b20)
	db "@"
